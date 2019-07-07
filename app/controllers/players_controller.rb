class PlayersController < ApplicationController
  def index
    @players = Player.availables
  end
end
