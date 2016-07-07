require 'spec_helper'
require 'rails_helper'

describe 'invitations' do
  user = FactoryGirl.create(:user)

  before do
    login_as(user, scope: :user)
    visit users_path
  end

  it 'shows the owner in the authorized user list' do
    expect(page).to have_content user.email
    expect(page).to have_selector '.glyphicon-ok'
  end

  it 'shows invitation when user is invited' do
    fill_in 'user_email', with: user.email
    click_button 'Invite User'
    expect(page).to have_content 'invitation email has been sent'
    expect(page).to have_content user.email
    expect(page).to have_content 'Invitation Pending'
  end
end