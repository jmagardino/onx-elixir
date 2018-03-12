defmodule ArrayFlattener1Test do
  use ExUnit.Case
  doctest ArrayFlattener

  @test_list [["a","b","c"],["d","e","f"],["g","h","i"]]
  @test_list_flattened ["a","b","c","d","e","f","g","h","i"]

  test "Empty list returns an empty list" do
    assert ArrayFlattener.flatten_array_version_1([]) == []
  end

  test "Two d list with only one nested list returns the one nested list" do
    assert ArrayFlattener.flatten_array_version_2([[1,2,3]]) == [1,2,3]
  end

  test "Two d list returns a one d flattened list" do
    assert ArrayFlattener.flatten_array_version_1(@test_list) == @test_list_flattened
  end

end

defmodule ArrayFlattener2Test do
  use ExUnit.Case
  doctest ArrayFlattener

  @test_list [["a","b","c"],["d","e","f"],["g","h","i"]]
  @test_list_flattened ["a","b","c","d","e","f","g","h","i"]

  test "Empty list returns an empty list" do
    assert ArrayFlattener.flatten_array_version_2([]) == []
  end

  test "Two d list with only one nested list returns the one nested list" do
    assert ArrayFlattener.flatten_array_version_2([[1,2,3]]) == [1,2,3]
  end

  test "Two d list returns a one d flattened list" do
    assert ArrayFlattener.flatten_array_version_2(@test_list) == @test_list_flattened
  end

end

defmodule ArrayAccessorTest do
  use ExUnit.Case
  doctest ArrayAccessor

  @test_list [["a", "b", "c"],["d", "e", "f"],["g", "h", "i"]]

  test "Indices for value at bottom right of 2d array return the same value in 1d represenation" do
    assert ArrayAccessor.access_at_2d_index(2,2,3,ArrayFlattener.flatten_array_version_1(@test_list)) == Enum.at(Enum.at(@test_list, 2),2)
  end

  test "Indices for value at top left of 2d array return the same value in 1d represenation" do
    assert ArrayAccessor.access_at_2d_index(0,0,3,ArrayFlattener.flatten_array_version_1(@test_list)) == Enum.at(Enum.at(@test_list, 0),0)
  end

  test "Indices for value in middle of 2d array return the same value in 1d represenation" do
    assert ArrayAccessor.access_at_2d_index(2,0,3,ArrayFlattener.flatten_array_version_1(@test_list)) == Enum.at(Enum.at(@test_list, 2),0)
  end

end

defmodule RectangleCentroidTest do
  use ExUnit.Case
  doctest Rectangle

  test "Rectangle that has an exact centroid point should return the point" do
    assert Rectangle.find_centroid({-10,-10},{10,10}) == {0,0}
  end

  test "Rectangle that does not have an exact centroid point on the graph should return the decimal point" do
    assert Rectangle.find_centroid({-11,-11},{10,10}) == {-0.5,-0.5}
  end

end

defmodule PointExistsInRectangleTest do
  use ExUnit.Case
  doctest Rectangle

  test "Point that exists in rectangle should return true" do
    assert Rectangle.point_exists_in({-10,10},20,20,{0,0}) == true
  end

  test "Point that exists outside of rectangle should return false" do
    assert Rectangle.point_exists_in({3,-3},20,20,{0,0}) == false
  end

  test "Point that exists on border of rectangle should return true" do
    assert Rectangle.point_exists_in({0,0},20,20,{0,-5}) == true
  end

end

defmodule PointExistsInRectangleEnhancedTest do
  use ExUnit.Case
  doctest Rectangle

  test "Given three corners the area of triangle should be returned" do
    assert Rectangle.area_of_triangle({0,0},{0,2},{2,0}) == 2.0
  end

  test "Point that exists in axes alligned rectangle should return true" do
    assert Rectangle.points_exists_in_enhanced({0,2},{0,0},{2,2},{2,0},{1,1}) == true
  end

  test "Point that exists on edge of axes alligned rectangle should return true" do
    assert assert Rectangle.points_exists_in_enhanced({0,2},{0,0},{2,2},{2,0},{0,1}) == true
  end

  test "Point that exists outside of axes alligned rectangle should return false" do
    assert assert Rectangle.points_exists_in_enhanced({0,2},{0,0},{2,2},{2,0},{0,5}) == false
  end

  test "Point that exists in rotated rectangle should return true" do
    assert Rectangle.points_exists_in_enhanced({20,30}, {15,15}, {35,25}, {30,10}, {25,25}) == true
  end

  test "Point that exists outside of rotated rectangle should return false" do
    assert Rectangle.points_exists_in_enhanced({20,30}, {15,15}, {35,25}, {30,10}, {100,100}) == false
  end

  test "Point that exists on edge of rotated rectangle should return false" do
    assert Rectangle.points_exists_in_enhanced({20,30}, {10,0}, {35,25}, {25,-5}, {15,15}) == true
  end

end
