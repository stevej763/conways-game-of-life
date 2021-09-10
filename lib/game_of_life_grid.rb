require_relative 'cell'

class GameOfLifeGrid
  def initialize(cells_per_row, row_count)
    @grid = build_grid(cells_per_row, row_count)
    @cells_per_row = cells_per_row
    @row_count = row_count
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

  def build_grid(cells_per_row, row_count)
    grid_template = []
    row_count.times do |row_number|
      grid_template << [] #add a new empty row
      cells_per_row.times do
        number = rand(2)
        if number == 1
          alive = false
        else
          alive = true
        end
        grid_template[row_number] << Cell.new(alive) #add a new cell into the row (cells_per_row)
      end
    end
    return grid_template
  end

end