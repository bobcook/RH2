class Member < ActiveRecord::Base
  has_many :prayers, -> { order('date desc') }
end
