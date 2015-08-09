class HousesController < ApplicationController
  before_action :set_house, only: [:show]

  def index
    @houses = House.all
  end

  def show
    @new_comment = @house.comments.new
  end

  private

  def set_house
    @house = House.find(params[:id])
  end
end
