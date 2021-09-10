require "game_of_life_grid"
require "cell"

describe 'GameOfLifeGrid' do
  number_of_columns = 10
  number_of_rows = 10

  cell = Cell.new
      grid = [
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell],
        [cell, cell, cell, cell, cell, cell, cell, cell, cell, cell] 
      ]

  describe "get_grid" do
    context "a #{number_of_rows}x#{number_of_columns} grid has been initialised" do
      underTest = GameOfLifeGrid.new(number_of_rows, number_of_columns)
      RESULT = underTest.get_grid

      it "is #{number_of_rows}" do
        expect(RESULT.length).to eq(10)
      end

      RESULT.each do |row| 
        it "is #{number_of_columns}" do
          expect(row.length).to eq(10)
        end

        it "displays a 10x10 grid" do
          expect(row).to all(be_a(Cell))
        end
      end
    end
  end
end