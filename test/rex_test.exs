defmodule RexTest do
  use ExUnit.Case

  test "the mean" do
    assert Rex.mean([1,2,3,4,5,6,7,8,9,10]) == 5.5
    assert Rex.mean([1,1,1,1,1,1,1,1,1,1]) == 1
    assert Rex.mean([20,30,40,50]) == 35
  end

  test "the median" do
    assert Rex.median([1,2,3,4,5,6,7]) == 4
  end
end
