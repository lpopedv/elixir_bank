defmodule ElixirBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @params [:name, :password, :password_hash, :email, :cep]

  @required_create_params [:name, :password, :email]
  @required_update_params [:name, :email, :cep]

  @derive {Jason.Encoder, only: [:id, :name, :email, :cep]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @params)
    |> validate_required(@required_create_params)
    |> do_validations()
    |> add_password_hash()
  end

  def changeset(user, params) do
    user
    |> cast(params, @params)
    |> validate_required(@required_update_params)
    |> do_validations()
    |> add_password_hash()
  end

  defp do_validations(changeset) do
    changeset
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> validate_length(:password, is: 6)
  end

  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    Ecto.Changeset.change(changeset, %{password_hash: Argon2.hash_pwd_salt(password)})
  end

  defp add_password_hash(changeset), do: changeset
end
