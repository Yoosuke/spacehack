defmodule Spacehack.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :b, :string
      add :body, :text
      add :lat, :float
      add :lng, :float
      add :url, :string
      add :date, :date
      add :data, :string

      timestamps()
    end

  end
end
