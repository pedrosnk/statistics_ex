defmodule StatisticsEx do
  @moduledoc """
    This is the main library of StatisticsEx designed to integrate statistics common functions
  """

  @doc """
  Calculates the mean passing a list or a range

  Example:

    iex> StatisticsEx.mean [1,2,3,4,5,6,7,8,9,10]
    5.5

    iex> StatisticsEx.mean 100..200
    150.0
  """
  def mean list do
    sum = Enum.sum list
    sum / Enum.count list
  end

  @doc """
  Calculates the Weighted mean between two lists or ranges
  """
  def weighted_mean list1, list2 do
    mean1 = mean list1
    mean2 = mean list2
    count1 = Enum.count(list1)
    count2 = Enum.count(list2)

    ((mean1 * count1) + (mean2 * count2)) / (count1 + count2)
  end

  @doc """
  Calculates the median passing a list

  Example:
    iex> StatisticsEx.median [1,2,3,4,5,6,7]
    4

    iex> StatisticsEx.median 1..101
    51
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
  Calculates the mode of a list, which is the most frequently value

  Example:
    iex> StatisticsEx.mode [1,2,3,3,3,7,5]
    [3]

    iex> StatisticsEx.mode [1,1,1,1,2,8,10]
    [1]
  """
  def mode list do
    counter = count_values list, %{}
    sorted_counts = Enum.sort counter, &sort_counter/2
    extract_mode_values sorted_counts
  end

  @doc """
  Calculates the variance of a list

  """
  def variance list do
    list_count = Enum.count list
    list_mean = mean list

    deviation_score = list
      |> Enum.map(&(&1 - list_mean))
      |> Enum.sum()

    deviation_score = case deviation_score do
      0.0 ->
        list
          |> Enum.map(&(:math.pow(&1 - list_mean, 2)))
          |> Enum.sum()
      _ ->
        deviation_score
    end

    deviation_score / list_count
  end

  @doc """
  Calculates the standart deviantion of a list
  """
  def standart_deviation list do
    list |> variance() |> :math.sqrt()
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
    last_half =
      if rem(count, 2) == 0 do
        Enum.slice list, (div(count, 2))..count
      else
        Enum.slice list, (div(count, 2) + 1)..count
      end
    median last_half
  end

  def sumary _list do
    # TODO
  end

  def simple_z_score x, [standart_deviation: sd, mean: mean] do
    (x - mean) / sd
  end

  defp count_values [h | t], counter do
    counter =
      case counter[h] do
        nil -> Map.put counter, h, 1
        _ -> Map.put counter, h, counter[h] + 1
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
