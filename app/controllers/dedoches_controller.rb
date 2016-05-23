class DedochesController < ApplicationController
  before_action :set_dedoch, only: [:show, :edit, :update, :destroy]

  # GET /dedoches
  # GET /dedoches.json
  def index
    @dedoches = Dedoche.all
  end

  # GET /dedoches/1
  # GET /dedoches/1.json
  def show
    @dedoche = Dedoche.find(params[:id])
    @cart_action = @dedoche.cart_action current_user.try :id
  end

end
