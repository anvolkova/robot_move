require 'spec_helper'
require './robot'

describe Robot do

    let(:robot) { Robot.new() }

    context "#place" do
        it "puts the toy robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST" do
            robot.place(0, 2, "east")
            expect(robot.report).to eq ("0,2,EAST")
        end
    end

    context "#move" do
        it "should move the robot one unit forward in the direction it is currently facing" do
            robot.place(0, 0, "north")
            robot.move
            expect(robot.report).to eq ("0,1,NORTH")
        end

        it "should not move the robot if the movement make it fall from the table" do
            robot.place(0,0, "south")
            robot.move
            expect(robot.report).to eq ("0,0,SOUTH")
          end

        it "should be ignored if robot is not on the table" do
            robot.move
            expect(robot.report).to eq ("Error")
        end
    end

    context "#left" do
        it "rotates the robot 90 degrees to the left without changing the position" do
            robot.place(0, 0, "north")
            robot.left
            expect(robot.report).to eq ("0,0,WEST")
        end

        it "should be ignored if robot is not on the table" do
            robot.left
            expect(robot.report).to eq ("Error")
          end
    end

    context "#right" do
        it "rotates the robot 90 degrees to the right without changing the position" do
            robot.place(0, 0, "north")
            robot.right
            expect(robot.report).to eq ("0,0,EAST")
        end

        it "should be ignored if robot is not on the table" do
            robot.right
            expect(robot.report).to eq ("Error")
          end
    end

    context "valid #place" do
        it "should discard move command in the sequence until a valid PLACE command has been executed" do
            robot.place(-1,-1,"west")
            robot.move
            expect(robot.report).to eq ("Error")
        end

        it "should discard left command in the sequence until a valid PLACE command has been executed" do
            robot.place(-1,-1,"west")
            robot.left
            expect(robot.report).to eq ("Error")
        end

        it "should discard right command in the sequence until a valid PLACE command has been executed" do
            robot.place(-1,-1,"west")
            robot.right
            expect(robot.report).to eq ("Error")
        end
    end

    context "block of commands" do
        it "returns the valid result" do
            robot.place(1,2,"east")
            robot.move
            robot.move
            robot.left
            robot.move
            expect(robot.report).to eq ("3,3,NORTH")
        end
    end
end