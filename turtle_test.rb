require 'minitest/autorun'
require 'minitest/pride'
require_relative 'turtle.rb'
require 'pry'

class TurtleTest < Minitest::Test
  def setup
    @turtle = Turtle.new [4, 4]
    @turtle.place 3, 3, "SOUTH"
  end

  def test_that_turtle_is_on_a_table
    assert_equal true, @turtle.am_i_on_a_table?
  end

  def test_that_turtle_can_turn_right
    @turtle.turn_right
    assert_match "WEST", @turtle.check_direction
  end

  def test_that_turtle_can_turn_left
    @turtle.turn_left
    assert_match "EAST", @turtle.check_direction
  end

  def test_that_turtle_can_walk
    @turtle.walk
    assert_match "3, 4, SOUTH", @turtle.report
  end

  def test_that_turtle_cant_walk_of_the_eage
    @turtle.walk
    @turtle.walk
    assert_match "3, 4, SOUTH", @turtle.report
  end
end