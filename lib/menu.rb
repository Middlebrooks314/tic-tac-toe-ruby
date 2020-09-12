class Menu

  def initialize(display)
    @display = display
  end

  def player_choice(player_number)
    @display.player_choice_prompt(player_number)
    @display.player_choice
    potential_choice = @display.retrieve_user_input
    check_game_choice(potential_choice)
  end

  private

  def check_game_choice(potential_choice)
    until valid_player_choice?(potential_choice)
      @display.invalid_player_choice
      @display.player_choice_prompt
      @display.player_choice
      potential_choice = @display.retrieve_user_input
    end
    potential_choice
  end

  def valid_player_choice?(potential_choice)
    potential_choice == '1' || potential_choice == '2'
  end
end
