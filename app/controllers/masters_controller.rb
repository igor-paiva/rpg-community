class MastersController < ApplicationController
  def index
    @masters = Master.availables
  end
end
