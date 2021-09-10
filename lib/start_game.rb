require './game_engine'
require './game_of_life_grid'


columns = ARGV[0].to_i
rows = ARGV[1].to_i

grid = GameOfLifeGrid.new(rows, columns)
GAME = GameEngine.new(grid.get_grid)
tick = 0

loop do
  sleep 1
  puts "Game Tick: #{tick}"
  puts GAME.next_tick
  tick += 1
end