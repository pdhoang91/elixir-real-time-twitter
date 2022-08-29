defmodule KafiWealthWeb.PageLive do
  use KafiWealthWeb, :live_view

  def render(assigns) do
    ~H"""
    <section class="phx-hero">
      <h2><%= gettext "Welcome to %{name} !!!", name: "K A F I" %></h2>
    </section>

    <section class="row">
      <article class="column">
        <h4>LiveView Examples</h4>
        <ul>
          <li><%= live_redirect "Image Editor", to: Routes.live_path(@socket, KafiWealthWeb.ImageLive) %></li>
          <li><%= live_redirect "Search Live", to: Routes.live_path(@socket, KafiWealthWeb.SearchLive) %></li>
          <li><%= live_redirect "Image Editor", to: Routes.live_path(@socket, KafiWealthWeb.ImageLive) %></li>
          <li><%= live_redirect "Show All Users", to: Routes.user_index_path(@socket, :index) %></li>
          <li><%= live_redirect "Create New User", to: Routes.user_new_path(@socket, :new) %></li>
        </ul>
      </article>
    </section>
    """
  end
end
