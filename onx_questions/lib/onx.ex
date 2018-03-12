#Write a function to flatten a 2d array.
defmodule ArrayFlattener do
  def flatten_array_version_1(array) do
    flatten_array_version_1(array, [])
  end

  def flatten_array_version_1([head | tail], accumulator) do
    flatten_array_version_1(tail, accumulator ++ head)
  end

  def flatten_array_version_1([], accumulator) do
    accumulator
  end

  def flatten_array_version_2([head | tail]) do
    head ++ flatten_array_version_2(tail)
  end

  def flatten_array_version_2([]) do
    []
  end
end

#Write a function that returns the correct value from the flattened array given i, j indices
defmodule ArrayAccessor do
  def access_at_2d_index(i, j, width, array) do
    Enum.at(array, i*width+j)
  end
end

# Write a function that takes opposite corners of a rectangle and returns the centroid of the rectangle
defmodule Rectangle do
  def find_centroid(first_corner, second_corner) do
    {(elem(first_corner, 0) + elem(second_corner,0)) / 2 , (elem(first_corner, 1) + elem(second_corner,1)) / 2}
  end

  def point_exists_in(top_left_corner, length, height, point) do
    elem(top_left_corner,0) <= elem(point,0) && elem(top_left_corner,0) + length  >= elem(point,0) && elem(top_left_corner,1) >= elem(point,1) && elem(top_left_corner,0) - height <= elem(point,1)
  end

  def points_exists_in_enhanced(top_left_corner, bottom_left_corner, top_right_corner, bottom_right_corner, point) do
    area_of_rectangle = area_of_triangle(top_left_corner, bottom_left_corner, top_right_corner) + area_of_triangle(bottom_left_corner, bottom_right_corner, top_right_corner)
    tl_bl_point = area_of_triangle(top_left_corner, bottom_left_corner, point)
    bl_br_point = area_of_triangle(bottom_left_corner, bottom_right_corner, point)
    br_tr_point = area_of_triangle(bottom_right_corner, top_right_corner, point)
    tl_tr_point = area_of_triangle(top_left_corner, top_right_corner, point)

    area_of_rectangle == tl_bl_point + bl_br_point + br_tr_point + tl_tr_point
  end

  def area_of_triangle(a,b,c) do
    ax = elem(a,0)
    ay = elem(a,1)
    bx = elem(b,0)
    by = elem(b,1)
    cx = elem(c,0)
    cy = elem(c,1)

    abs((ax*(by-cy) + bx*(cy-ay) + cx*(ay-by))/2)
  end
end
