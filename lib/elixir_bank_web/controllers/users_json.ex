defmodule ElixirBankWeb.UsersJSON do

  def create(%{user: user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end

  def get(%{user: user}), do: user

  def update(%{user: user}), do: %{ message: "User updated successfully", user: user}
end
