defmodule ElixirBank.Users.Delete do
  alias ElixirBank.Users.User
  alias ElixirBank.Repo

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> Repo.delete(user)
    end
  end
end
