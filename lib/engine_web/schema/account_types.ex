defmodule EngineWeb.Schema.AccountTypes do
  use Absinthe.Schema.Notation

  @desc "A blog user"
  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :posts, list_of(:post)
  end
end
