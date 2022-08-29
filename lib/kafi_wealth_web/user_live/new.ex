defmodule KafiWealthWeb.UserLive.New do
  use KafiWealthWeb, :live_view

  alias KafiWealth.Users
  alias KafiWealth.Users.User

  def mount(_params, _session, socket) do
    changeset = Users.change_user(%User{})
    {:ok, assign(socket, changeset: changeset)}
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      %User{}
      |> KafiWealth.Users.change_user(user_params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        {:noreply,
          socket
          |> put_flash(:info, "user created")
          |> push_redirect(to: Routes.user_show_path(socket, :show, user))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
