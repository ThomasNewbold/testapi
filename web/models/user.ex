defmodule Testapi.User do
  use Testapi.Web, :model

  schema "users" do
    field :fullname, :string
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:fullname, :email])
    |> validate_required([:fullname, :email])
  end
end
