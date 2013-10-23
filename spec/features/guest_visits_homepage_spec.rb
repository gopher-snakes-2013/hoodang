require 'spec_helper'

feature "Guest visits homepage" do
  scenario "they see Hoodang!" do
    visit '/'
    expect(page).to have_content('Hoodang!')
  end

  scenario "they see sign in with Facebook button" do
    visit '/'
    expect(page).to have_content('sign up')
  end

end


