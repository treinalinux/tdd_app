require 'rails_helper'

RSpec.feature "Customers", type: :feature do
  scenario 'Check Customer Registration link' do
    visit(root_path)
    expect(page).to have_link('Create Customers')
  end

  scenario 'Check New Customer link' do
    visit(root_path)
    click_on('Create Customers')
    expect(page).to have_content('List Customers')
    expect(page).to have_link('New Customers')
  end

  scenario 'Check New Customer form' do
    visit(customers_path)
    click_on('New Customers')
    expect(page).to have_content('New Customers')
  end

  scenario 'Register a Valid Customer' do
    visit(new_customer_path)
    customer_name = Faker::Name.name

    fill_in('Name', with: customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('customer_avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    choose(option: %w[Y No].sample)
    click_on('Register Customer')

    expect(page).to have_content('Customer successfully registered!')
    expect(Customer.last.name).to eq(customer_name)
  end
end
