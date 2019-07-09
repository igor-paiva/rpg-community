class MastersController < ApplicationController
  def index
    @masters = Master.availables
  end

  def enable
    @master = Master.find_or_create_by(user_id: params[:admin_id])
  end

  def update
    @master = Master.find(params[:id])
                    .update_attributes master_params
  end
end

private

def master_params
  params.require(:master).permit(:available, :campaigns)
end