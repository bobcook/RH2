class Member < ActiveRecord::Base
  has_many :prayers, -> { order('date desc') }, dependent: :destroy
end
