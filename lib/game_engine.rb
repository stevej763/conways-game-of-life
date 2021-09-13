class GameEngine
  def initialize(grid, row_count, cells_per_row)
    @grid = grid
    @row_count = row_count
    @cells_per_row = cells_per_row
  end

  def next_tick
    grid = ""
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        living_neighbours = get_surrounding_cell_status(row_index, column_index)
        mark_changes(cell, living_neighbours)
        grid += "#{cell.display_cell}"
      end
      grid += "\n"
    end
    triggerUpdate
    return grid
  end

  def triggerUpdate
    @grid.each_with_index do |row|
      row.each_with_index do |cell|
        cell.update_to_next_state
      end
    end
  end

  def mark_changes(cell, living_neighbours)
    if (living_neighbours > 3) || (living_neighbours < 2)
      cell.set_living_next_tick(false)
    end
    if !cell.is_alive? && (living_neighbours == 3)
      cell.set_living_next_tick(true)
    end

  end

  def get_surrounding_cell_status(row_index, column_index)
    living_neighbours = 0
    
    get_status(row_index -1, column_index -1) == true ? living_neighbours +=1 : nil
    get_status(row_index, column_index -1) == true ? living_neighbours +=1 : nil
    get_status(row_index +1, column_index -1) == true ? living_neighbours +=1 : nil#up_right
    get_status(row_index -1, column_index) == true ? living_neighbours +=1 : nil#left
    get_status(row_index +1, column_index) == true ? living_neighbours +=1 : nil#right
    get_status(row_index -1, column_index +1) == true ? living_neighbours +=1 : nil#down_left
    get_status(row_index, column_index +1) == true ? living_neighbours +=1 : nil#down
    get_status(row_index +1, column_index +1) == true ? living_neighbours +=1 : nil#down_left

    return living_neighbours
  end

  def get_status(row, column)
    if row < 0 || column < 0
      return false
    elsif row > (@cells_per_row - 1) || column > (@row_count - 1)
      return false
    else
      return @grid[row][column].is_alive?
    end
  end

end