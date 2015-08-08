class HousesController < ApplicationController
  before_action :set_house

  def index
    @houses = House.all
  end

  def show
  end

  private

  def set_house
    @house = House.find(params[:id])
  end
end