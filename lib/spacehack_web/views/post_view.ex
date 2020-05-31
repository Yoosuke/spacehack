defmodule SpacehackWeb.PostView do
  use SpacehackWeb, :view

  def parse_markdown(markdown) do
    Earmark.as_html!(markdown,  %Earmark.Options{code_class_prefix: "language-",  smartypants: false })
  end

  def mapbox do
    System.get_env("EX_MAPBOX")
  end

  def vimeo(url) do
    length = String.length(url) + 1
    case String.slice(url, 18, length) |> String.length  do
      20 -> String.slice(String.slice(url, 18, length), 0, 9)
      9 -> String.slice(url, 18, length)
    end
  end

  def vimeo?(url) do
    case String.slice(url, 0, 17) do
      "https://vimeo.com" -> true
       _ -> false
    end
  end

  def youtube(url) do
    String.slice(url, 17, 12)
  end

  def youtube?(url) do
    case String.slice(url, 0, 17) do
      "https://youtu.be/" -> true
       _  -> false
    end
  end

end
