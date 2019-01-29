defmodule EngineWeb.Router do
  use EngineWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: EngineWeb.Schema

    forward "/", Absinthe.Plug, schema: EngineWeb.Schema
  end
end
