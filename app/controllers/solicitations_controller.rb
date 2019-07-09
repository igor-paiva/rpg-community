class SolicitationsController < ApplicationController

  def create
    if params[:role] == 'Player' || params[:role] == 'Master'
      Solicitation.create!(user_id: params[:user_id],
                           table_id: params[:table_id],
                           role: params[:role])
    end
    redirect_to '/tables/'
  end

  def destroy
    Solicitation.find(params[:id]).destroy
  end

  def conclude
    s = Solicitation.find(params[:id])
    s.conclude

    redirect_to '/tables/users/' + params[:admin_id]
  end
end
