defmodule ElixirBank.Users.Create do
  alias ElixirBank.ViaCep.Client, as: ViaCepClient
  alias ElixirBank.Users.User
  alias ElixirBank.Repo

  def call(%{"cep" => cep} = params) do
    with {:ok, _result} <- ViaCepClient.call(cep) do
      params
      |> User.changeset()
      |> Repo.insert()
    end
  end
end
