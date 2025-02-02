defmodule ElixirBankWeb.UsersJSON do
  def create(%{user: user}), do: %{message: "User created successfully", user: user}
  def get(%{user: user}), do: user
  def update(%{user: user}), do: %{message: "User updated successfully", user: user}
  def delete(%{user: user}), do: %{message: "User deleted successfully", user: user}

end
