require "pry"
class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || c == a
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    valid_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    [a, b, c].each do |s|
      valid_triangle << false if s <= 0
    end
    raise TriangleError if valid_triangle.include?(false)
  end

  class TriangleError < StandardError
    def message
      "invalid triangle"
    end
  end
end
tri = Triangle.new(7,7,0)
binding.pry