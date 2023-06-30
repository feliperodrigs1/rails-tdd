class NewCustomerForm
  include Capybara::DSL
  include FactoryBot::Syntax::Methods
  include Rails.application.routes.url_helpers

  def visit_page
    visit(new_customer_path)
    self
  end

  def fill_in_with(params={})
    fill_in('Name', with: params.fetch(:name, Faker::Name.first_name))
    fill_in('Email', with: params.fetch(:email, Faker::Internet.email))
    fill_in('Phone', with: params.fetch(:address, Faker::PhoneNumber.phone_number))
    choose(option: %w[Y N].sample)
    self
  end

  def attach
    attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    self
  end

  def submit
    click_button('Create Customer')
  end
end

