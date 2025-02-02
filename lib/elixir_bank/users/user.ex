defmodule ElixirBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @params [:name, :password, :password_hash, :email, :cep]
  @required_params [:name, :password, :email]

  @derive {Jason.Encoder, only: [:name, :email, :password]}
  schema "users" do
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :email, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cep, is: 8)
    |> add_password_hash()
  end

  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    Ecto.Changeset.change(changeset, %{password_hash: Argon2.hash_pwd_salt(password)})
  end

  defp add_password_hash(changeset), do: changeset
end
