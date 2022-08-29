defmodule KafiWealth.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :user_name, :string
    field :email, :string
    field :phone_number, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:user_name, :email, :phone_number])
    |> validate_required([:user_name, :email, :phone_number])
    |> validate_confirmation(:password)
    |> validate_format(:user_name, ~r/^[a-zA-Z0-9_]*$/,
         message: "only letters, numbers, and underscores please"
       )
    |> validate_length(:user_name, max: 12)
    |> validate_format(:email, ~r/.+@.+/, message: "must be a valid email address")
      #|> validate_format(:phone_number, @phone, message: "must be a valid number")
    |> unique_constraint(:email)
  end
end
