defmodule Rex do
  @moduledoc """
    This is the main library of Rex designed to integrate statistics common functions
  """

  @doc """
  Calculates the mean passing a list
  """
  def mean list do
    sum = Enum.sum list
    sum / Enum.count list
  end

  @doc """
  Calculates the median passing a list
  """
  def median list do
    list = Enum.sort list
    if rem(Enum.count(list), 2) == 0 do
      first_idx = div Enum.count(list), 2
      (Enum.at(list, first_idx - 1) + Enum.at(list, first_idx)) / 2
    else 
      Enum.at list, div(Enum.count(list), 2)
    end
  end
end
