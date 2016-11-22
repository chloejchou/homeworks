class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    @cups[6] = []
    @cups[13] = []
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    on_board = start_pos.between?(1, 6) || start_pos.between?(7, 12)
    raise "Invalid starting cup" unless on_board
  end

  def make_move(start_pos, current_player_name)
    num_stones = cups[start_pos].length
    cups[start_pos] = []
    cup_idx = start_pos
    num_stones.times do
      cup_idx == 13 ? cup_idx = 0 : cup_idx += 1

      if current_player_name == @name1
        cup_idx = 0 if cup_idx == 13
      else
        cup_idx = 7 if cup_idx == 6
      end

      cups[cup_idx] << :stone
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    answer = true
    (0..5).each do |cup_idx|
      answer = false unless cups[cup_idx].empty?
    end

    return answer if answer

    (7..12).each do |cup_idx|
      answer = false unless cups[cup_idx].empty?
    end

    answer
  end

  def winner
    return :draw if cups[6].length == cups[13].length
    if cups[6].length > cups[13].length
      return @name1
    else
      return @name2
    end
  end
end
