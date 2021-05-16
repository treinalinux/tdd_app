require 'rails_helper'

feature 'Welcomes', type: :feature do
  scenario 'Show a message of Welcome' do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end
