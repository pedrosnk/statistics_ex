defmodule StatisticsExTest do
  use ExUnit.Case
  doctest StatisticsEx

  describe "the mean" do
    test "standards cases with mean" do
      assert StatisticsEx.mean([1,2,3,4,5,6,7,8,9,10]) == 5.5
      assert StatisticsEx.mean([1,1,1,1,1,1,1,1,1,1]) == 1
      assert StatisticsEx.mean([20,30,40,50]) == 35
    end

    test "with ranges" do
      assert StatisticsEx.mean(1..100) == 50.5
      assert StatisticsEx.mean(100..200) == 150
      assert StatisticsEx.mean(-20..20) == 0
    end
  end


  test "the median" do
    assert StatisticsEx.median([1,2,3,4,5,6,7]) == 4
    assert StatisticsEx.median([5,5,5,5,5]) == 5
    assert StatisticsEx.median([10,20,40,80,160,200]) == 60
  end

  test "the median with ranges" do
    assert StatisticsEx.median(1..101) == 51
    assert StatisticsEx.median(1..100) == 50.5
    assert StatisticsEx.median(-90..120) == 15
  end

  test "the mode" do
    assert StatisticsEx.mode([1,2,3,1,2,1,1]) == [1]
    assert StatisticsEx.mode([1,2,3,1,2,1,1,2,2]) == [2, 1]
    assert StatisticsEx.mode([50]) == [50]
  end

  test "the quartile 1" do
    assert StatisticsEx.quartile_1([10,11,12,13,14,15]) == 11
    assert StatisticsEx.quartile_1([22,23,24,25,26]) == 22.5
  end

  test "the quartile 2" do
    assert StatisticsEx.quartile_2([10,11,12,13,14,15]) == 12.5
  end

  test "the quartile 3" do
    assert StatisticsEx.quartile_3([10,11,12,13,14,15]) == 14
    assert StatisticsEx.quartile_3([22,23,24,25,26]) == 25.5
  end

  test "the weighted mean between two samples" do
    assert StatisticsEx.weighted_mean([5,4,2,9,3], [1,3,2,5,8]) == 4.2
  end

  test "the standart deviation" do
    assert StatisticsEx.standart_deviation([14, 9, 11, 7, 9]) == 2.3664319132398464
  end

  test "the variance" do
    assert StatisticsEx.variance([14, 9, 11, 7, 9]) == 5.6
  end

  test "the z score" do
    example = [1, 2, 5, 10]
    mean = StatisticsEx.mean example
    sd = StatisticsEx.standart_deviation example
    assert StatisticsEx.simple_z_score(1, standart_deviation: sd, mean: mean) == -1.0
  end

end
