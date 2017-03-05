defmodule StatisticsExTest do
  use ExUnit.Case

  test "generates a sequence" do
    sequence = StatisticsEx.Sequence.generate 1, 5
    assert sequence == [1,2,3,4,5]
  end
end
