defmodule ElixirBankWeb.UsersController do
  use ElixirBankWeb, :controller

  alias ElixirBank.Users
  alias Users.User
  alias ElixirBankWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Users.create(params) do
     conn 
    |> put_status(:created)
    |> render(:create, user: user)
    end
  end
end
