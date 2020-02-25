class GameRunner
  def initialize(game)
    @game = Game.new
  end

  def run
    @game.welcome
    @game.play
  end
end
