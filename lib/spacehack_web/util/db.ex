defmodule Db do

  def query(sql) do
    case Ecto.Adapters.SQL.query( YourProjectName.Repo  ,sql, []) do
      {:ok, result } -> result
      {:error, _result } -> "sql error"
    end
  end

  def columns_rows(result) do
     Enum.map(result.rows, fn row -> to_map(result.columns, row) end )
  end

  defp to_map(column, row) do
    List.zip([ column, row ])
    |> Enum.into(%{})
  end

end
