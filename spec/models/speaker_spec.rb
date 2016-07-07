require 'rails_helper'

RSpec.describe Speaker, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:speaker)).to be_valid
  end
end
