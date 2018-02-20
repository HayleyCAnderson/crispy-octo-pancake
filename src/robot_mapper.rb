module RobotMapper
  DIRECTIONS = ['north', 'east', 'south', 'west']
  DIRECTION_KEY = {
    north: Proc.new { |x, y, distance| {x_position: x, y_position: y + distance} },
    south: Proc.new { |x, y, distance| {x_position: x, y_position: y - distance} },
    east: Proc.new { |x, y, distance| {x_position: x + distance, y_position: y} },
    west: Proc.new { |x, y, distance| {x_position: x - distance, y_position: y} }
  }
  X_UNITS = 5
  Y_UNITS = 5

  def is_within_space?(x_position, y_position)
    x_position >= 0 && x_position < X_UNITS &&
      y_position >= 0 && y_position < Y_UNITS
  end

  def is_valid_direction?(direction)
    DIRECTIONS.include?(direction)
  end

  def travel(direction, x_position, y_position, distance)
    coordinates = DIRECTION_KEY[direction.to_sym].call(x_position, y_position, distance)
    coordinates if is_within_space?(*coordinates.values)
  end

  # Accepts direction as string and returns direction as string.
  def direction_to_left(direction)
    raw_index = DIRECTIONS.index(direction) - 1
    new_index = raw_index < 0 ? DIRECTIONS.length - 1 : raw_index
    DIRECTIONS[new_index]
  end

  # Accepts direction as string and returns direction as string.
  def direction_to_right(direction)
    raw_index = DIRECTIONS.index(direction) + 1
    new_index = raw_index > DIRECTIONS.length - 1 ? 0 : raw_index
    DIRECTIONS[new_index]
  end
end
