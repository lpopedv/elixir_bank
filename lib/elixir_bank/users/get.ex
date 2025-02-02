defmodule ElixirBank.Users.Get do
  alias ElixirBank.Users.User
  alias ElixirBank.Repo

  def call(user_id) do
    case Repo.get(User, user_id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
