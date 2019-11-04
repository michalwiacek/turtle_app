DIRECTIONS = ["NORTH", "EAST", "SOUTH", "WEST"]

class Turtle
  def initialize table
    @table = table
    @directions = DIRECTIONS
    @placed = false
  end
  
  def turn_left
    @directions.rotate!(-1)
  end
  
  def turn_right
    @directions.rotate!(1)
  end
  
  def place x, y, d
    @x = x
    @y = y
    @d = d
    @direction_index = @directions.index(d)
    if (x <= @table[0]) and (y <= @table[1]) and x >= 0 and y>=0
      @placed = true
    end
  end
  
  def report
    "#{@x}, #{@y}, #{@directions[@direction_index]}"
  end

  def am_i_on_a_table?
    @placed
  end

  def check_direction
    @directions[@direction_index]
  end

  def walk
    return if @placed == false
    case @directions[@direction_index]
      when "SOUTH"
        @y+=1 if @y < @table[1]
      when "EAST"
        @x+=1 if @x < table[0]
      when "WEST"
        @x-=1 if @x >0
      when "NORTH"
        @y-=1 if @y > 0
    end
  end
end