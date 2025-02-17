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
        |> json_response(:unprocessable_entity)

      expected_response = %{
        "errors" => %{
          "cep" => ["should be 8 character(s)"],
          "email" => ["has invalid format"],
          "name" => ["can't be blank"],
          "password" => ["should be 6 character(s)"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "should be able to delete an user", %{conn: conn} do
      new_user = %{
        name: "Test user",
        password: "123456",
        cep: "12345678",
        email: "test@tets.com"
      }

      create_user_response =
        conn
        |> post(~p"/api/users", new_user)
        |> json_response(:created)

      %{"user" => %{"id" => user_id}} = create_user_response

      expected_response = %{
        "message" => "User deleted successfully",
        "user" => %{
          "id" => user_id,
          "cep" => "12345678",
          "email" => "test@tets.com",
          "name" => "Test user"
        }
      }

      response =
        conn
        |> delete(~p"/api/users/#{user_id}")
        |> json_response(:ok)

      assert expected_response == response
    end
  end
end
