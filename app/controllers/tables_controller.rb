class TablesController < ApplicationController
  before_action :set_table, only: %i[show update edit destroy]
  before_action :set_admin, only: :user_tables

  def index
    @tables = Table.where(available: true)
  end

  def show
    @members = [@table.associated_master,
                @table.associated_players]
  end

  def new
    @table = Table.new
    @admin_id = params[:admin_id]
  end

  def create
    @table = Table.create!(table_params)

    redirect_to action: :user_tables,
                admin_id: params[:table][:admin_id]
  end

  def destroy
    @table.destroy

    redirect_to action: :user_tables, admin_id: params[:admin_id]
  end

  def edit
    @admin_id = params[:admin_id]
    @members = [@table.associated_master,
                @table.associated_players]
  end

  def update
    @table.update_attributes(table_params)

    redirect_to action: :user_tables,
                admin_id: params[:table][:admin_id]
  end

  def user_tables
    @tables = @admin.tables
  end
end

private

def set_table
  @table = Table.find(params[:id])
end

def set_admin
  @admin = User.find(params[:admin_id])
end

def table_params
  params.require(:table).permit(:admin_id, :name, :available,
                                :max_players, :description)
end
