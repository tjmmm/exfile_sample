defmodule ExfileSample.User do
  use ExfileSample.Web, :model
  import Exfile.Ecto.File

  schema "users" do
    field :name, :string
    field :email, :string
    field :avatar, Exfile.Ecto.File

    timestamps
  end

  @required_fields ~w(name email)
  @optional_fields ~w(avatar)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
