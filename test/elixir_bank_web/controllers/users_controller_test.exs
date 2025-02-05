defmodule ElixirBankWeb.UsersControllerTest do
  use ElixirBankWeb.ConnCase

  describe "create/2" do
    test "should be able to create an new user", %{conn: conn} do
      params = %{name: "Test User", password: "123456", cep: "12345678", email: "user@test.com"}

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "message" => "User created successfully",
               "user" => %{"cep" => "12345678", "email" => "user@test.com", "name" => "Test User"}
             } = response
    end

    test "should not be able to create an new user if params is invalid", %{conn: conn} do
     params = %{name: nil, password: "1", cep: "2", email: "invalid"}

       response =
       conn
       |> post(~p"/api/users", params)
       |> json_response(:created)

       expected_response = "{\"errors\":{\"password\":[\"should be 6 character(s)\"],\"email\":[\"has invalid format\"],\"cep\":[\"should be 8 character(s)\"]}}"

       assert response == expected_response
    end
  end
end
