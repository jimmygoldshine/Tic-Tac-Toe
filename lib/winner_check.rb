class WinnerCheck

  def initialize(game)
    @grid = game.grid
  end

  WINNING_COMBOS = { diagonal_1: [0, 4, 8],
                  diagonal_2: [2, 4, 6],
                  horiztona1_1: [0, 1, 2],
                  horiztona1_2: [3, 4, 5],
                  horizontal_3: [6, 7, 8],
                  vertical_1: [0, 3, 6],
                  vertical_2: [1, 4, 7],
                  vertical_3: [2, 5, 8]
                  }

  def winner?
    WINNING_COMBOS.each_value do |combo|
      slots = slot_selector(@grid, combo)
      if all_checks_pass?(slots)
        return "#{slots[0]} has won!"
      end
    end
    grid_full?(@grid) ? "It's a draw!" : "Next player's turn"
  end

  private

  def all_checks_pass?(slots)
    no_empty_slots?(slots) && all_slots_match?(slots) && three_in_the_combo?(slots)
  end

  def no_empty_slots?(slots)
    slots.each do |slot|
      return false if slot.empty?
    end
    true
  end

  def three_in_the_combo?(slots)
    slots.length == 3
  end

  def all_slots_match?(slots)
    slots.all? { |slot| slot == "X"} || slots.all? { |slot| slot == "O"}
  end

  def slot_selector(grid, combo)
    return [grid[combo[0]], grid[combo[1]], grid[combo[2]]].flatten
  end

  def grid_full?(grid)
    grid.all? { |slot| !slot.empty? }
  end

end
