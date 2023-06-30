require 'rails_helper'
require_relative '../support/new_customer_form'

feature "Customers", type: :feature do
  scenario 'verify client register link' do
    visit(root_path)

    expect(page).to have_link('Register Client')
  end

  scenario 'verify new customer link' do
    visit(root_path)
    click_on('Register Client')

    expect(page).to have_content('Customers List')
    expect(page).to have_link('New Customer')
  end

  scenario 'verify new customer form' do
    visit(customers_path)

    click_on('New Customer')
    expect(page).to have_content('New Customer')
  end

  scenario 'register a valid customer' do
    new_customer_form = NewCustomerForm.new

    new_customer_form.visit_page.fill_in_with(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    ).attach.submit

    expect(page).to have_content('Client registered successfully!')
    expect(Customer.all.count).to eq(1)
  end

  scenario 'not register a invalid customer' do
    visit(new_customer_path)

    click_on('Create Customer')

    expect(page).to have_content("can't be blank")
  end

  scenario 'show a client' do
    customer = create(:customer)

    visit(customer_path(customer.id))
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
    expect(page).to have_content(customer.smoker)
  end

  scenario 'testing index' do
    customer1 = create(:customer)
    customer2 = create(:customer)

    visit(customers_path)
    expect(page).to have_content(customer1.name).and have_content(customer2.name)
  end

  scenario 'update a customer' do
    customer = create(:customer)

    new_name = Faker::Name.name
    visit(edit_customer_path(customer.id))
    fill_in('Name', with: new_name)

    click_on('Update Customer')
    expect(page).to have_content('Client updated successfully!')
    expect(page).to have_content(new_name)
  end

  scenario 'click in show link' do
    customer = create(:customer)

    visit(customers_path)

    find(:xpath, '/html/body/table/tbody/tr[1]/td[2]/a').click
    expect(page).to have_content("Showing: #{customer.name}")
  end

  scenario 'click in edit link' do
    create(:customer)

    visit(customers_path)

    find(:xpath, '/html/body/table/tbody/tr[1]/td[3]/a').click
    expect(page).to have_content('Edit Customer')
  end

  scenario 'delete a customer' do
    create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[4]/a').click

    expect(page).to have_content('Customer deleted successfully!')
  end
end
