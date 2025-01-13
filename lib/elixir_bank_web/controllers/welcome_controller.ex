defmodule ElixirBankWeb.WelcomeController do
  use ElixirBankWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to Elixir Bank API"})
  end
end
