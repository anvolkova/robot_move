require 'spec_helper'
require './parser'

module Parser 

    describe TextParser do
        let(:parser) { TextParser.new }

        context "#parse_line" do

            it "should raise an ArgumentError error" do
                expect{parser.parse_line("BACK")}.to raise_error (ArgumentError)
            end
            
            context "returns the valid command" do
                it "move" do
                    expect(parser.parse_line("MOVE").name).to eq (:move)
                end

                it "left" do
                    expect(parser.parse_line("LEFT").name).to eq (:left)
                end

                it "right" do
                    expect(parser.parse_line("RIGHT").name).to eq (:right)
                end

                it "report" do
                    expect(parser.parse_line("REPORT").name).to eq (:report)
                end

                it "place" do
                    expect(parser.parse_line("PLACE 2,2,WEST").name).to eq (:place)
                    expect(parser.parse_line("PLACE 2,2,WEST").args).to eq [2, 2, "west"]
                end
            end
        end
    end
end