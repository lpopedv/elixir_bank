defmodule ElixirBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @params [:name, :password_hash, :email, :cep]
  @required_params [:name, :password_hash, :email]

  schema "users" do
    field :name, :string
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
  end
end

