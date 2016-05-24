class Purchase < ActiveRecord::Base
  belongs_to :dedoche
  belongs_to :buyer, class_name: 'User'
end