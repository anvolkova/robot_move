class Robot

    DIRECTIONS = ['north', 'east', 'south', 'west']
    TABLE_SIZE = 4
    # Calculating the move shift of the robot depending on the direction
    SHIFTS = [[0, 1], [1, 0], [0, -1], [-1,0]]

    # Initializing the robot with coordinates outside the table so it can not move before place command
    def initialize()
        @x = -2
        @y = -2
        @face = "north"
    end

    # Searching for the index of the FACE direction in the array
    def find_face_index
        DIRECTIONS.find_index(@face)
    end

    # Checking if coordinates of the robot is on the table
    def table_check?(x, y)
        x.between?(0,TABLE_SIZE) && y.between?(0,TABLE_SIZE)
    end

    def place(x, y, face)
        if table_check?(x, y)
            @x = x
            @y = y
            @face = face
        end
    end

    def move
        shifts = SHIFTS[find_face_index]
        if table_check?(@x + shifts[0], @y + shifts[1])
            @x = @x + shifts[0]
            @y = @y + shifts[1]
        end
    end

    def left
        if table_check?(@x, @y)
            index = (find_face_index - 1) % DIRECTIONS.count
            @face = DIRECTIONS[index]
        end
    end

    def right
        if table_check?(@x, @y)
            index = (find_face_index + 1) % DIRECTIONS.count
            @face = DIRECTIONS[index]
        end
    end

    def report
        if table_check?(@x, @y)
            "#{@x},#{@y},#{@face.upcase}"
        else
            "Error" # if robot is not on the table
        end
    end
end 

# myrobot = Robot.new(0,0, "north")
# puts(myrobot.report)
# myrobot.place(0,2,"east")
# puts(myrobot.report)
# myrobot.move
# puts(myrobot.report)
# myrobot.move
# puts(myrobot.report)
# myrobot.left
# puts(myrobot.report)
# myrobot.move
# puts(myrobot.report)