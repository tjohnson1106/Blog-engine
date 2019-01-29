defmodule EngineWeb.Resolvers.Content do
  def list_posts(_parent, _args, _resolution) do
    {:ok, Engine.Content.list_posts()}
  end
end
