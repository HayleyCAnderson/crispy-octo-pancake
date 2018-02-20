require_relative 'robot'

Instruction = Struct.new(:action, :arguments)

class RobotRunner
  def initialize
    @robot = nil
  end

  def run
    input = gets.chomp.downcase
    until input == 'exit'
      handle(input)
      input = gets.chomp.downcase
    end
  end

  # Accepts string and performs action on robot or does nothing if invalid.
  def handle(input)
    instructions = input.split(' ')
    instruction = instructions.first

    if @robot && instructions.length == 1
      if ['move', 'left', 'right'].include?(instruction)
        @robot.send(instruction)
      elsif instruction == 'report'
        puts @robot.report
      end
    elsif instructions.length == 2
      if instruction == 'place'
        arguments = instructions.last.split(',')
        # TODO: Fix handling of these arguments.
        @robot ? @robot.place(*arguments) : @robot = Robot.new(*arguments)
      end
    end
  end
end
