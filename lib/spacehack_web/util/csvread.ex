defmodule CsvRead do

  def stream(file_path) do
     file_path
     |> Path.expand(__DIR__)
     |> File.stream!
     |> CSV.decode
     |> Enum.to_list
     |> Enum.map(fn row -> tuple_to_list(row) end)
  end

  def csv_struct(head, tail) do
    %Data_csv{columns: head, rows: tail }
  end

  defp tuple_to_list(tuple_data) do
    case tuple_data do
      {:ok, list_data} -> list_data
      {:error, _list_data } -> []
    end
  end

  def to_json(file_path) do
    file_path
    |> Path.expand(__DIR__)
    |> File.stream!
    |> IO.inspect
  end

 end
