class PlayersController < ApplicationController
  def index
    @players = Player.availables
  end

  def enable
    @player = Player.find_or_create_by(user_id: params[:user_id])
  end

  def update
    @player = Player.find(params[:id])
                    .update_attributes player_params
  end

private

  def player_params
    params.require(:player).permit(:available, :campaigns)
  end
end
