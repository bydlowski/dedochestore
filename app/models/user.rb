class User < ActiveRecord::Base
  has_many :purchases, foreign_key: :buyer_id
  has_many :dedoches, through: :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  dedoches = []

  def cart_count
    $redis.scard "cart#{id}"
  end

  def cart_total_price
    total_price = 0
    get_cart_dedoches.each { |dedoche| total_price += dedoche.price }
    total_price
  end

  def get_cart_dedoches
    cart_ids = $redis.smembers "cart#{id}"
    Dedoche.find(cart_ids)
  end

  def purchase_cart_dedoches!
    get_cart_dedoches.each { |dedoche| purchase(dedoche) }
    $redis.del "cart#{id}"
  end

  def purchase(dedoche)
    dedoches << dedoche unless purchase?(dedoche)
  end

  def purchase?(dedoche)
    dedoches.include?(dedoche)
  end

end
