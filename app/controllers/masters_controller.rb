class MastersController < ApplicationController
  def index
    @masters = Master.availables
  end

  def enable
    @master = Master.find_or_create_by(user_id: params[:admin_id])
  end

  def update
    @master = Master.find(params[:id])
    @master.update_attributes params.require(:master)
                                    .permit(:available, :campaigns)
  end
end
