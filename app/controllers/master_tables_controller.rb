class MasterTablesController < ApplicationController
  def destroy
    MasterTable.find(params[:id]).destroy
    redirect_to '/tables/users/' + params[:admin_id]
  end
end
