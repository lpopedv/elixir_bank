defmodule ElixirBank.Users.Create do
  alias ElixirBank.Users.User
  alias ElixirBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
