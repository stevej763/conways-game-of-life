class Cell
  LIVING = "+"
  DEAD = "-"
  def initialize(living = false)
    @alive = living
    
  end

  def is_alive
    return @alive
  end

  def revive
    @alive = true
  end

  def kill
    @alive = false
  end

  def display_cell
    return  @alive ? LIVING : DEAD
  end

end