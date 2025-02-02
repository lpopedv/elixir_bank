defmodule ElixirBankWeb.UsersJSON do

  def create(%{user: user}) do
    %{
      message: "User created successfully",
      user: user
    }
  end

  def get(%{user: user}), do: %{data: user}
end
