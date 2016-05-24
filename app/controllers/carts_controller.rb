class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    #cart_ids = $redis.smembers current_user_cart
    #@cart_dedoches = Dedoche.find(cart_ids)
    @cart_dedoches = current_user.get_cart_dedoches
  end

  def add
    $redis.sadd current_user_cart, params[:dedoche_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:dedoche_id]
    render json: current_user.cart_count, status: 200
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end
