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
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell.update_to_next_state
      end
    end
  end

  def mark_changes(cell, living_neighbours)
    if (living_neighbours > 3) || (living_neighbours < 2)
      cell.set_living_next_tick(false)
    end
    if !cell.is_alive && (living_neighbours == 2 || living_neighbours == 3)
      cell.set_living_next_tick(true)
    end
  end

  def get_surrounding_cell_status(row_index, column_index)
    living_neighbours = 0
    results = []

    results << get_status(row_index -1, column_index -1) #up-left
    results << get_status(row_index, column_index -1) #up
    results << get_status(row_index +1, column_index -1) #up_right
    results << get_status(row_index -1, column_index) #left
    results << get_status(row_index +1, column_index) #right
    results << get_status(row_index -1, column_index +1) #down_left
    results << get_status(row_index, column_index +1) #down
    results << get_status(row_index +1, column_index +1) #down_left
    
    results.each do |result|
      if result == true
        living_neighbours += 1
      end
    end
    return living_neighbours
  end

  def get_status(row, column)
    #puts "checking cell at row: #{row} column: #{column}"
    #puts "highest allowed cell index in row: #{@cells_per_row -1} heighest allowed column index: #{@row_count -1}"
    if row < 0 || column < 0
      #puts "Skipped, grid reference lower than minimum"
      return false
    elsif row > (@cells_per_row - 1) || column > (@row_count - 1)
      #puts "Skipped, grid reference higher than maximum"
      return false
    else
      #puts "Found neighbour for: #{@grid[row][column]}"
      return @grid[row][column].is_alive
    end
  end

end