defmodule Jaxa do
  def get(dataset_id, start_time, end_time, latlng, header \\ []) do
    path = "https://gportal.jaxa.jp/csw?/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&"
    path <> dataset_id <> "&startTime=" <> start_time <> "T00:00:00Z" <> "&endTime=" <> end_time <> "T23:59:59Z" <> "&box=" <> latlng
		|> HTTPoison.get!( header )
		|> parse
  end

  def get(dataset_id, header \\ []) do
    path = "https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&datasetId="
    path <> dataset_id
		|> HTTPoison.get!( header )
		|> parse
  end

  # datasetid の範囲指定
  def id_range_get(dataset_id, end_id, header \\ []) do
    path = "https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&datasetId="
    path <> dataset_id <> "+" <> end_id
		|> HTTPoison.get!( header )
		|> parse
  end

  # datasetid　の複数指定
  def id_gets(dataset_id, dataset2_id, header \\ []) do
    path = "https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&datasetId="
    path <> dataset_id <> "," <> dataset2_id
		|> HTTPoison.get!( header )
		|> parse
  end

  # グラニュールIDで検索
  def gid_get(g_id, header \\ []) do
    path ="https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&id="
    path <> g_id
		|> HTTPoison.get!( header )
		|> parse
  end

  # センサ名で検索
  def sensor_name_get(sat_name, sensor_name, header \\ []) do
    path ="https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&sat="
    path <> sat_name <> "&sen=" <> sensor_name
		|> HTTPoison.get!( header )
		|> parse
  end

  # ・観測日時による検索
  def time_get(start_time, end_time, header \\ []) do
    path ="https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&startTime="
    path <> start_time <> "Z&endTime=" <> end_time
		|> HTTPoison.get!( header )
		|> parse
  end

  # 座標情報による検索
  def bbox_get(latlon, header \\ []) do
    path ="https://gportal.jaxa.jp/csw/csw?service=CSW&version=3.0.0&request=GetRecords&outputFormat=application/json&bbox="
    path <> latlon
		|> HTTPoison.get!( header )
		|> parse
  end

	defp parse( response ) do
		response
		|> get_body
		|> Poison.decode!
  end

	defp get_body( %{ status_code: 200, body: body } ), do: body
	defp get_body( %{ status_code: 201, body: body } ), do: body
	defp get_body( %{ status_code: 204, body: body } ), do: body
end
