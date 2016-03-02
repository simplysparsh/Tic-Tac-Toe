class Computer

  def initialize(marker)
    @id = :computer
    @marker = marker
    @name = "Computer"
  end

  attr_reader :marker, :name, :id

  def play(board, opponent)
    @opponent = opponent
    set_best_move(board, @opponent.marker)
    @best_move.to_s
  end

  private

  def set_best_move(board, last_move_marker, depth = 0)
    scores =[]
    moves =[]
    current_marker = nil
    depth += 1

    if board.game_over?
      return get_move_score(board, last_move_marker, depth)
    end

    board.available_blocks.each do |current_block|
      current_marker = next_player_marker(last_move_marker)
      board.fill_block_at(current_block, current_marker)
      scores.push set_best_move(board, current_marker, depth)
      moves.push current_block
      board.reset_block_value_at(current_block.to_i)
    end

    if current_marker == self.marker
      max_score_index = scores.each_with_index.max[1]
      @best_move = moves[max_score_index]
      return scores.max
    elsif current_marker == @opponent.marker
      min_score_index = scores.each_with_index.min[1]
      @best_move = moves[min_score_index]
      return scores.min
    end
  end

  def get_move_score(board, last_move_marker, depth)
    if board.player_wins?
      return (10 - depth) if last_move_marker == self.marker
      return (depth - 10) if last_move_marker == @opponent.marker
    elsif board.tie?
      0
    end
  end

  def next_player_marker(last_move_marker)
    if last_move_marker == @opponent.marker
      self.marker
    elsif last_move_marker == self.marker
      @opponent.marker
    end
  end

end

