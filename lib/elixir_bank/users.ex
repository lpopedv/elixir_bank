defmodule ElixirBank.Users do
  alias ElixirBank.Users.Create
  alias ElixirBank.Users.Get

 defdelegate create(params), to: Create, as: :call
 defdelegate get(params), to: Get, as: :call
end
