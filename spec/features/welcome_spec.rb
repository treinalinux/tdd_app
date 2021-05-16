require 'rails_helper'

RSpec.feature 'Welcomes', type: :feature do
  scenario 'Show a message of Welcome' do
    visit(root_path)
    expect(page).to have_content('Welcome')
  end

  scenario 'Check Customer Registration link' do
    visit(root_path)
    expect(find('ul li')).to have_link('Create Customers')
  end
end
