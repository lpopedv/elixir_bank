defmodule ElixirBankWeb.UsersJSON do
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
end
