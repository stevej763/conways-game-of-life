require "game_engine"
require "game_of_life_grid"
require "cell"

describe 'GameEngine' do

  living = Cell::LIVING
  dead = Cell::DEAD
  grid_height = 5
  grid_width = 3

  describe ".next_tick" do
    context "given all cells are dead and grid is displayed" do
      grid = [
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new],
        [Cell.new,Cell.new,Cell.new]
      ]
      it "displays a #{grid_height
  } by #{grid_width} grid with dead cells}" do
        underTest = GameEngine.new(grid, grid_width, grid_height
    )
        
        expect(underTest.next_tick).to eq("#{dead+dead+dead}\n#{dead+dead+dead}\n#{dead+dead+dead}\n#{dead+dead+dead}\n#{dead+dead+dead}\n")
      end
    end

    context "given all cells are alive and grid is displayed" do
      grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
      it "displays a #{grid_height
  } by #{grid_width} grid with living cells}" do
        cell = double(:cell, display_cell: "0")
        underTest = GameEngine.new(grid, grid_width, grid_height
    )
        expect(underTest.next_tick).to eq("#{living+living+living}\n#{living+living+living}\n#{living+living+living}\n#{living+living+living}\n#{living+living+living}\n")
      end
    end
  end
end