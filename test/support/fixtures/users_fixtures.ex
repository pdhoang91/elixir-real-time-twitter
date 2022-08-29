defmodule KafiWealth.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KafiWealth.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        phone_number: "some phone_number",
        user_name: "some user_name"
      })
      |> KafiWealth.Users.create_user()

    user
  end
end
