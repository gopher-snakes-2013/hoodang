require 'spec_helper'

feature 'sign up' do
  scenario 'user sees sign up on home page' do
    visit '/'
    expect(page).to have_content('sign up')
  end
end
