require 'rails_helper'
require_relative '../support/new_customer_form'

RSpec.describe "Customers", type: :request do
  before do
    create(:customer, id: 1)
  end

  describe "GET /customers" do
    it "status 200" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it 'index - JSON' do
      get '/customers.json'

      json = [
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      ]

      expect(response.body).to include_json(json)
    end

    it 'show - JSON' do
      NewCustomerForm.new.login
      get '/customers/1.json'

      expect(response.body).to include_json(id: /\d/)
    end

    it 'show - JSON Parse' do
      NewCustomerForm.new.login
      get "/customers/1.json"

      response_body = JSON.parse(response.body)
      expect(response_body.fetch("id")).to eq(1)
      expect(response_body.fetch("name")).to be_kind_of(String)
      expect(response_body.fetch("email")).to be_kind_of(String)
    end

    it 'JSON Schema' do
      get '/customers/1.json'

      expect(response).to match_response_schema('customer')
    end

    it 'create - JSON' do
      NewCustomerForm.new.login

      headers = { 'ACCEPT' => 'application/json' }
      customers_params = attributes_for(:customer)
      post '/customers.json', params: { customer: customers_params }, headers: headers

      expect(response.body).to include_json( name: customers_params.fetch(:name),
                                             email: customers_params.fetch(:email) )
    end

    it 'update - JSON' do
      NewCustomerForm.new.login

      headers = { 'ACCEPT' => 'application/json' }

      customer = Customer.first
      customer.name += '- foo'

      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers

      expect(response.body).to include_json( name: customer.name,
                                             email: customer.email )
    end

    it 'destroy - JSON' do
      NewCustomerForm.new.login

      headers = { 'ACCEPT' => 'application/json' }

      customer = Customer.first

      expect{
        delete "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      }.to change(Customer, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end
