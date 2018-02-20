require_relative 'robot_mapper'

class Robot
  include RobotMapper

  def initialize(x_position, y_position, direction)
    place(x_position, y_position, direction)
  end

  # Accepts x and y positions as integers and direction as string.
  # Take no action if out of bounds or input invalid.
  # TODO: Strings in place of ints should return instead of being converted to 0.
  def place(x_str, y_str, direction)
    x_position = x_str.to_i
    y_position = y_str.to_i

    return unless is_valid_direction?(direction)
    return unless is_within_space?(x_position, y_position)

    @x_position = x_position
    @y_position = y_position
    @direction = direction
  end

  # Move robot one unit in current direction. Take no action if out of bounds.
  def move
    coordinates = travel(@direction, @x_position, @y_position, 1)
    if coordinates
      @x_position = coordinates[:x_position]
      @y_position = coordinates[:y_position]
    end
  end

  # Move direction 90 degrees to left.
  def left
    @direction = direction_to_left(@direction)
  end

  # Move direction 90 degrees to right.
  def right
    @direction = direction_to_right(@direction)
  end

  # Return string of position and direction.
  def report
    "#{@x_position},#{@y_position},#{@direction.upcase}"
  end
end

