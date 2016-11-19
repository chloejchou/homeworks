class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end

    # when game is over:
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !game_over
      round_success_message
      @sequence_length += 1
    end

  end

  # adds a color and then shows/clears the sequence
  def show_sequence
    add_random_color
    p seq

    sleep(2)
    system("clear")
    sleep(0.5)
  end

  # decides whether the game is over or not
  def require_sequence
    puts "What is your sequence? Input each colors on separate lines."

    @seq.each do |color|
      user_color = gets.chomp
      if user_color != color
        @game_over = true
        break
      end
    end

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Congratulations! You've passed level #{sequence_length}."
  end

  def game_over_message
    puts "GAME OVER."
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end

end

g = Simon.new
g.play
