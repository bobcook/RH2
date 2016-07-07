require 'rails_helper'

RSpec.describe Prayer, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:prayer)).to be_valid
  end
end
