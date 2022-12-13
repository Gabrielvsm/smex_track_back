defmodule SmexTrackWeb.PageController do
  use SmexTrackWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
