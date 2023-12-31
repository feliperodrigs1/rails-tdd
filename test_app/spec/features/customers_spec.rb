require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.feature "Customers", type: :feature do
  let(:new_customer_form) { NewCustomerForm.new }

  it 'visit index page' do
    visit(customers_path)

    expect(page).to have_current_path(customers_path)
  end

  it 'creates a customer' do
    member = create(:member)
    login_as(member, scope: :member)

    visit(new_customer_path)
    fill_in('Name', with: Faker::Name.first_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    click_button('Create Customer')

    expect(page).to have_content(/successfully created/)
  end

  it 'creates a customer - Page Object Pattern' do
    new_customer_form.login.visit_page.fill_in_with(
      name: Faker::Name.first_name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address
    ).submit

    expect(page).to have_content(/successfully created/)
  end

  xit 'ajax' do
    visit(customers_path)
    click_link('Add a Message')

    expect(page).to have_content('Yes!')
  end

  xit 'Find' do
    visit(customers_path)
    click_link('Add a Message')

    expect(find('#my-div').find('h1')).to have_content('Yes!')
  end
end
