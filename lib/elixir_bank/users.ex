defmodule ElixirBank.Users do
  alias ElixirBank.Users.Create
  alias ElixirBank.Users.Get
  alias ElixirBank.Users.Update

 defdelegate create(params), to: Create, as: :call
 defdelegate get(params), to: Get, as: :call
 defdelegate update(params), to: Update, as: :call
end
