require "game_engine"
require "game_of_life_grid"

describe 'GameEngine' do

  describe ".next_tick" do
    context "given all cells are dead and grid is displayed" do
      height = 5
      width = 3
      grid = [
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new]
      ]
      it "displays a #{height} by #{width} grid with dead cells}" do
        underTest = GameEngine.new(grid)
        expect(underTest.next_tick).to eq("---\n---\n---\n---\n---\n")
      end
    end
  end

  describe ".next_tick" do
    context "given all cells are alive and grid is displayed" do
      height = 5
      width = 3
      grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
      it "displays a #{height} by #{width} grid with living cells}" do
        cell = double(:cell, display_cell: "0")
        underTest = GameEngine.new(grid)
        expect(underTest.next_tick).to eq("+++\n+++\n+++\n+++\n+++\n")
      end
    end
  end
end