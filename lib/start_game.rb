require './game_engine'
require './game_of_life_grid'


columns = ARGV[0].to_i
rows = ARGV[1].to_i
seed = []

grid = GameOfLifeGrid.new(rows, columns)
GAME = GameEngine.new(grid.get_grid, rows, columns)
tick = 0


puts "Row count: #{grid.get_row_count}"
puts "Cells per row: #{grid.get_cells_per_row}"


# puts "Testing Game Tick: 1"
# puts GAME.next_tick

# puts "Testing Game Tick: 2"
# puts GAME.next_tick
# puts "Testing Game Tick: 3"
# puts GAME.next_tick



loop do
  sleep 0.5
  puts "Game Tick: #{tick}"
  puts GAME.next_tick
  tick += 1
end