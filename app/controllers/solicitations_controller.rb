class SolicitationsController < ApplicationController
  before_action :set_solicitation, only: %i[destroy, conclude]

  def create
    condition = params[:role] == 'Player' || params[:role] == 'Master'

    Solicitation.create!(solicitation_params) if condition

    redirect_to '/tables/'
  end

  def destroy
    @solicitation.destroy
  end

  def conclude
    @solicitation.conclude

    redirect_to "/tables/users/#{params[:admin_id]}"
  end

private

  def set_solicitation
    @solicitation = Solicitation.find(params[:id])
  end

  def solicitation_params
    params.permit(:user_id, :table_id, :role)
  end
end
