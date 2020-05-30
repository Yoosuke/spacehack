defmodule SpacehackWeb.PageController do
  use SpacehackWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
