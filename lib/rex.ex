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

  @doc """
  Calculates the mode of a list
  """
  def mode list do
    counter = count_values list, %{}
    sorted_counts = Enum.sort counter, &sort_counter/2
    extract_mode_values sorted_counts
  end

  @doc """
  Calculates the 1st quartile
  """
  def quartile_1 list do
    list = Enum.sort list
    count = Enum.count list
    first_half = Enum.slice list, 0..(div(count,2) - 1)
    median first_half
  end

  @doc """
  Calculates the 2nd quartile
  """
  def quartile_2 list do
    median list
  end

  @doc """
  Calculates the 3rd quartile
  """
  def quartile_3 list do
    list = Enum.sort list
    count = Enum.count list
    last_half = Enum.slice list, (div(count, 2))..count
    median last_half
  end

  defp count_values [h | t], counter do
    if counter[h] == nil do
      counter = Map.put counter, h, 1
    else
      counter = Map.put counter, h, counter[h] + 1
    end
    count_values t, counter
  end

  defp count_values [], counter do
    counter
  end

  defp sort_counter value1, value2 do
    {_,count1} = value1
    {_,count2} = value2
    count1 > count2
  end

  def extract_mode_values [h | t] do
    {value, count} = h
    extract_mode_values t, count, [value]
  end

  defp extract_mode_values [h | t], max_count, acc do
    {value, count} = h
    if count != max_count do
      extract_mode_values [], max_count, acc
    else
      extract_mode_values t, max_count, acc ++ [value]
    end
  end

  defp extract_mode_values [], _max_count, acc do
    acc
  end
end
