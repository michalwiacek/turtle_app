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
        @x+=1 if @x < @table[0]
      when "WEST"
        @x-=1 if @x >0
      when "NORTH"
        @y-=1 if @y > 0
    end
  end
end

class UserInterface
prompt = "> "
print prompt
@turtle = Turtle.new [4, 4]
def self.place_turtle(x, y, d)
  @turtle.place x, y, d
end

while ui = gets.chomp
  user_input = []
  ui.gsub!(",", " ")
  user_input = ui.split(" ")
  puts user_input[0]
  case user_input[0]
    when "PLACE"
      if user_input.length == 4
        place_turtle x=user_input[1].to_i, y=user_input[2].to_i, d=user_input[3]
      else
        puts "We need exacly 3 arguments"
      end
      print prompt
    when "MOVE"
      @turtle.walk
      print prompt
    when "RIGHT"
      @turtle.turn_right
      print prompt
    when "LEFT"
      @turtle.turn_left
      print prompt
    when "REPORT"
      puts @turtle.report
      print prompt
    when "EXIT"
      break
    else
      puts "sorry, wrong method, try EXIT"
      print prompt
    end
  end
end