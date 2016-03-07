defmodule RexTest do
  use ExUnit.Case
  doctest Rex

  test "the mean" do
    assert Rex.mean([1,2,3,4,5,6,7,8,9,10]) == 5.5
    assert Rex.mean([1,1,1,1,1,1,1,1,1,1]) == 1
    assert Rex.mean([20,30,40,50]) == 35
  end

  test "the mean with ranges" do
    assert Rex.mean(1..100) == 50.5
    assert Rex.mean(100..200) == 150
    assert Rex.mean(-20..20) == 0
  end

  test "the median" do
    assert Rex.median([1,2,3,4,5,6,7]) == 4
    assert Rex.median([5,5,5,5,5]) == 5
    assert Rex.median([10,20,40,80,160,200]) == 60
  end

  test "the median with ranges" do
    assert Rex.median(1..101) == 51
    assert Rex.median(1..100) == 50.5
    assert Rex.median(-90..120) == 15
  end

  test "the mode" do
    assert Rex.mode([1,2,3,1,2,1,1]) == [1]
    assert Rex.mode([1,2,3,1,2,1,1,2,2]) == [2, 1]
    assert Rex.mode([50]) == [50]
  end

  test "the quartile 1" do
    assert Rex.quartile_1([10,11,12,13,14,15]) == 11
    assert Rex.quartile_1([22,23,24,25,26]) == 22.5
  end

  test "the quartile 2" do
    assert Rex.quartile_2([10,11,12,13,14,15]) == 12.5
  end

  test "the quartile 3" do
    assert Rex.quartile_3([10,11,12,13,14,15]) == 14
    assert Rex.quartile_3([22,23,24,25,26]) == 25.5
  end

  test "the weighted mean between two samples" do
    assert Rex.weighted_mean([5,4,2,9,3], [1,3,2,5,8]) == 4.2
  end

end
