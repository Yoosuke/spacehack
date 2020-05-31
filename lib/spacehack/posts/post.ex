defmodule Spacehack.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :b, :string
    field :body, :string
    field :data, :string
    field :date, :date
    field :lat, :float
    field :lng, :float
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :b, :body, :lat, :lng, :url, :date, :data])
    |> validate_required([:title])
  end
end
