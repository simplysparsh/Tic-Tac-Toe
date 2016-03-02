class Board

  def initialize
    @block = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  attr_reader :block, :name, :last_move_marker

  def print
    puts " #{@block[0]} | #{@block[1]} | #{@block[2]} \n"
    puts "===+===+===\n"
    puts " #{@block[3]} | #{@block[4]} | #{@block[5]} \n"
    puts "===+===+===\n"
    puts " #{@block[6]} | #{@block[7]} | #{@block[8]} \n"
  end

  def available_blocks
    available_blocks = []
    @block.each do |block|
      if block != "X" && block != "O"
        available_blocks << block
      end
    end
    available_blocks
  end

  def fill_block_at(block, marker)
    @last_move_marker = marker
    @block[block.to_i] = marker
  end

  def reset_block_value_at(current_block)
    block[current_block] = current_block
  end

  def player_wins?
    diagonal_win? || row_win? || column_win?
  end

  def row_win?
    [0, 3, 6].each do |block|
      if [@block[block], @block[block + 1], @block[block + 2]].uniq.length == 1
        return true
      end
    end
    false
  end

  def column_win?
    [0, 1, 2].each do |block|
      if [@block[block], @block[block + 3], @block[block + 6]].uniq.length == 1
        return true
      end
    end
    false
  end

  def diagonal_win?
    [@block[2], @block[4], @block[6]].uniq.length == 1 ||
    [@block[0], @block[4], @block[8]].uniq.length == 1
  end

  def tie?
    @block.all? { |b| b == "X" || b == "O" }
  end

  def game_over?
    tie? || player_wins?
  end

end
