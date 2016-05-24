class Dedoche < ActiveRecord::Base
  has_many :purchases
  has_many :buyers, through: :purchases
  #has_many :purchases, foreign_key: :dedoche_id

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
  
end
