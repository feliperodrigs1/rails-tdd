require 'rails_helper'

feature 'Welcome', type: :feature do
  scenario 'show welcome message' do
    visit(root_path)

    expect(page).to have_content('Welcome!!')
  end

  scenario 'verify client register link' do
    visit(root_path)

    expect(find('ul li')).to have_link('Register Client')
  end
end
