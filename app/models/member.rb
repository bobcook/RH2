class Member < ActiveRecord::Base
  has_many :prayers, -> { order('date desc') }, dependent: :destroy
  has_many :speakers, -> { order('date desc') }, dependent: :destroy
end
