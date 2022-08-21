defmodule Rubyforadmins2Web.PageController do
  use Rubyforadmins2Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
