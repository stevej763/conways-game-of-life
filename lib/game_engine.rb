class GameEngine
  def initialize(grid)
    @grid = grid
  end

  def next_tick
    grid = ""
    @grid.each do |row|
      row.each do |cell|
        alive = rand(5) == 1 ? cell.revive : cell.kill
        
        grid += "#{cell.display_cell}"
      end
      grid += "\n"
    end
    return grid
  end

end