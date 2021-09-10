require_relative 'cell'

class GameOfLifeGrid
  def initialize(x, y)
    @grid = build_grid(x, y)
  end

  def get_grid
    return @grid
  end

  def build_grid(x, y)
    grid_template = []
    y.times do |row|
      grid_template << []
      x.times do
        grid_template[row] << Cell.new()
      end
    end
    return grid_template
  end

end