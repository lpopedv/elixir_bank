defmodule ElixirBank.ViaCep.Client do
  use Tesla
  plug Tesla.Middleware.JSON
  plug Tesla.Middleware.BaseUrl, "https://viacep.com.br/ws"

  def call(cep) do
    "/#{cep}/json"
    |> get()
    |> handle_response()
  end

  defp handle_response({:ok, %Tesla.Env{status: 200, body: %{"erro" => "true"}}}),
    do: {:error, :not_found}

  defp handle_response({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}

  defp handle_response({:ok, %Tesla.Env{status: 400}}), do: {:error, :bad_request}

  defp handle_response({:error, _}), do: {:error, :internal_server_error}
end
