class Game

  def initialize
    @grid = Array.new(9, [])
  end

  def grid
    @grid
  end

  def turn(player, slot)
    error_guard(player, slot)
    @grid[slot] = player
  end

  private

  def error_guard(player, slot)
    unless player == 'X' || player == 'O'
      raise 'Error: Invalid character entered'
    end
    if slot < 0 || slot > 8
      raise 'Error: Chosen slot is outside of the grid'
    elsif !@grid[slot].empty?
      raise 'Error: Chosen slot has been taken'
    end
  end

end
