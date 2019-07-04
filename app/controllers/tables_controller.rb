class TablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_table, only: %i[show update edit destroy]

  def index
    @tables = Table.all
  end

  def show; end

  def new
    @table = Table.new
  end

  def create
    @table = Table.create!(table_params)
  end

  def destroy
    @table.destroy!

    redirect_to action: :index
  end

  def edit; end

  def update
    @table.update_attributes(table_params)
  end
end

private

def set_table
  @table = Table.find(params[:id])
end

def table_params
  params.require(:table).permit(:admin_id, :name, :available, :max_players)
end