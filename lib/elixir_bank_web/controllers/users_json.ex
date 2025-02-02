defmodule ElixirBankWeb.UsersJSON do
  alias ElixirBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User created successfully",
      user: %{
        name: user.name,
        email: user.email,
        cep: user.cep
      }
    }
  end

  def get(%{user: user}), do: %{data: data(user)}

  defp data(%User{} = user) do
    %{
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
