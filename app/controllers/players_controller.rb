class PlayersController < ApplicationController
  def index
    @players = Player.availables
  end

  def enable
    @player = Player.find_or_create_by(user_id: params[:user_id])
  end

  def update
    @player = Player.find(params[:id])
    @player.update_attributes params.require(:player)
                                    .permit(:available, :campaigns)
  end
end
