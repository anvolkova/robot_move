module Parser

    class Command
        attr_reader :name, :args

        def initialize(name, args)
            @name = name
            @args = args
        end
    end

    class Runner
        def apply(robot, command)
            case command.name
            when :left
                robot.left
            when :right
                robot.right
            when :report
                puts robot.report
            when :move
                robot.move
            when :place
                robot.place(command.args[0], command.args[1], command.args[2])
            end
        end
    end
    
    class TextParser
        def parse_line(line)
            case line
            when "MOVE"
                Command.new(:move, [])
            when "LEFT"
                Command.new(:left, [])
            when "RIGHT"
                Command.new(:right, [])
            when "REPORT"
                Command.new(:report, [])
            when /PLACE (-?[0-9]),(-?[0-9]),(NORTH|WEST|EAST|SOUTH)/
                Command.new(:place, [$1.to_i, $2.to_i, $3.downcase])
            else
                raise ArgumentError.new("invalid command: #{line}")
            end
        end
    end
end