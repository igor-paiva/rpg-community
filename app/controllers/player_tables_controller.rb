class PlayerTablesController < ApplicationController
  def destroy
    PlayerTable.find(params[:id]).destroy

    redirect_to '/tables/users/' + params[:admin_id]
  end
end
