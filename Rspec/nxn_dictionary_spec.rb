# jobs_manager_spec.rb
require_relative '../nxn_dictionary.rb'

describe Nxn_Dictionary, "Generate NxN grid" do
  it "Generate an N x N grid, where N can be any number, and randomly populate the grid with letters (A-Z)." do
    nxn_dictionary = Nxn_Dictionary.new
    dimension = (2..12).to_a.shuffle.first #Random dimension between 2 and 12
    gird = nxn_dictionary.generate(dimension)
    grid.length.should eq(dimension)
    grid[0].length eq(dimension)
  end
end