class Prayer < ActiveRecord::Base
  belongs_to :member
  validates :member_id, presence: true
end
