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
    #@cart_action = @dedoche.cart_action current_user.try :id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dedoch
      @dedoch = Dedoche.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dedoch_params
      params.require(:dedoch).permit(:name, :description, :price, :stock, :image, :code)
    end
end
