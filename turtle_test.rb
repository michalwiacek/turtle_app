require 'minitest/autorun'
require 'minitest/pride'
require_relative 'turtle.rb'

class TurtleTest < Minitest::Test
  def turtle
    turtle = Turtle.new
  end
end