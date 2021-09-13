require_relative 'cell'

class GameOfLifeGrid
  def initialize(cells_per_row = 20, row_count = 20, chance_of_life)
    @grid = build_grid(cells_per_row, row_count, chance_of_life)
  end

  def get_grid
    return @grid
  end

  def get_cells_per_row
    return @cells_per_row
  end

  def get_row_count
    return @row_count
  end

  def get_chance_of_life
    return @chance_of_life
  end

  def build_grid(cells_per_row, row_count, chance_of_life)
    grid_template = []
    row_count.times do |row_number|
      grid_template << [] #add a new empty row
      cells_per_row.times do
        will_be_alive = rand(chance_of_life)
        if will_be_alive == 1
          alive = true
        else
          alive = false
        end
        grid_template[row_number] << Cell.new(alive) #add a new cell into the row (cells_per_row)
      end
    end
    return grid_template
  end

end