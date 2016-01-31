class Member < ActiveRecord::Base
  has_many :prayers

  def self.all_ordered_by_prayer
   includes(:prayers).order('prayers.date ASC')
  end
end
