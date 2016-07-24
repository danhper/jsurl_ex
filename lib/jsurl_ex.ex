defmodule JsurlEx do
  @moduledoc """
  JsurlEx provides functions to work with the jsurl format.

  See https://github.com/Sage/jsurl for more information about the format
  """

  @doc """
  stringify takes an Elixir data structure as input and returns a jsurl encoded string
  """
  @spec stringify(atom | number | binary | list | map) :: String.t
  def stringify(value)
  def stringify(value) when is_nil(value) do
    "~null"
  end
  def stringify(term) when is_number(term) or is_boolean(term) do
    "~#{term}"
  end
  def stringify(atom) when is_atom(atom) do
    atom |> Atom.to_string |> stringify()
  end
  def stringify(string) when is_binary(string) do
    "~'#{string}"
  end
  def stringify(list) when is_list(list) do
    if Keyword.keyword?(list) do
      stringify_kv_enumerable(list)
    else
      transformed = list |> Enum.map(&stringify/1) |> Enum.join("")
      "~(#{transformed})"
    end
  end
  def stringify(map) when is_map(map) do
    stringify_kv_enumerable(map)
  end

  defp stringify_kv_enumerable(enumerable) do
    transformed =
      enumerable
      |> Enum.map(fn {key, value} -> "#{key}#{stringify(value)}" end)
      |> Enum.join("~")
    "~(#{transformed})"
  end
end
