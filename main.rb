require './parser.rb'
require './robot.rb'

parser = Parser::TextParser.new
robot = Robot.new
runner = Parser::Runner.new
$stdin.each_line do |l|
    runner.apply(robot, parser.parse_line(l.chomp))    
end