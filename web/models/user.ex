defmodule NinjaPhoenix.User do
#  defstruct [:id, :name, :username, :password]
  use NinjaPhoenix.Web, :model

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :videos, NinjaPhoenix.Video

    timestamps
  end
  def changeset(model, params \\ :empty) do 
    model
     |> cast(params, ~w(name username), [])
     |> validate_length(:username, min: 1, max: 20)
  end
  def registration_changeset(model, params) do 
     model
     |> changeset(params)
     |> cast(params, ~w(password), [])
     |> validate_length(:password, min: 3, max: 100)
     |> put_pass_hash()
    
  end
  def put_pass_hash(changeset) do
    case changeset do 
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
  #iex(4)> for u <- NinjaPhoenix.Repo.all(User) do
 #...(4)> NinjaPhoenix.Repo.update!(User.registration_changeset(u, %{ password: u.password_hash || "temppass"}))
 #...(4)> end<Paste>
end
