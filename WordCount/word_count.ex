defmodule WordCount do
  def start() do
    filename = IO.gets("Input name of the file: ")
    String.trim(filename) |> read_file() |> count_words()
  end

  def read_file(filename) do
    content = File.read!(filename) |> String.trim()
    content
  end

  def count_words(content) do
    word_count =
      Regex.replace(~r/[[:punct:]]/, content, "")
      |> String.split()
      |> Enum.count()

    IO.puts(word_count)
  end
end
