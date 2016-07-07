require 'rails_helper'

RSpec.describe Member, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:member)).to be_valid
  end

  it 'is not valid without a name' do
    expect(FactoryGirl.build(:member, name: nil)).to_not be_valid
  end
end
