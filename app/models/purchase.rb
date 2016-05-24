class Purchase < ActiveRecord::Base
  #ori-belongs_to :dedoche
  #ori-belongs_to :buyer, class_name: 'User'
  belongs_to :dedoche
  belongs_to :buyer, class_name: 'User'
end