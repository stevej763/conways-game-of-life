require './game_engine'
require './game_of_life_grid'


columns = ARGV[0].to_i
rows = ARGV[1].to_i
chance_of_life = ARGV[2].to_i
speed = ARGV[3].to_f

grid = GameOfLifeGrid.new(rows, columns, chance_of_life)
GAME = GameEngine.new(grid.get_grid, rows, columns)
tick = 0

loop do
  sleep speed
  puts GAME.next_tick
  puts "".center(rows, "-")
  tick += 1
end