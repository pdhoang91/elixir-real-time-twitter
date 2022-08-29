defmodule KafiWealthWeb.PageController do
  use KafiWealthWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
