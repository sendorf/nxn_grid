# nxn_dictionary_spec.rb
require_relative '../nxn_dictionary.rb'

describe Nxn_Dictionary, "Generate NxN grid" do
  it "Generate an N x N grid, where N can be any number, and randomly populate the grid with letters (A-Z)." do
    nxn_dictionary = Nxn_Dictionary.new
    dimension = (2..12).to_a.shuffle.first 							#Random dimension between 2 and 12
    grid = nxn_dictionary.generate(dimension)
    grid.length.should eq(dimension) 								#Checks the first dimension
    grid[0].gsub(/\s+/, "").length.should eq(dimension)    			#Checks the second dimension
  end
end

describe Nxn_Dictionary, "Find in dictionary" do
  it "Horizontal words from left to right in your grid" do
    nxn_dictionary = Nxn_Dictionary.new
    dimension = (2..12).to_a.shuffle.first 							#Random dimension between 2 and 12
    grid = nxn_dictionary.generate(dimension)
    words = nxn_dictionary.horizontal_l2r(grid)
    nxn_dictionary.horizontal_l2r(grid).should eq(words) 				#Checks the output
  end
end