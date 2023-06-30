require 'rails_helper'

RSpec.describe Customer, type: :model do
  fixtures :customers

  it '#full_name w/ fixture' do
    customer = customers(:foo)

    expect(customer.full_name).to eq('Mister Foo')
  end

  it '#full_name w/ factory' do
    customer = create(:customer)

    expect(customer.full_name).to start_with('Mister')
  end

  it 'inheritance' do
    customer = create(:customer_vip)

    expect(customer.vip).to be_truthy
  end

  it 'attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)

    expect(customer.full_name).to eq("Mister #{attrs[:name]}")
  end

  it { expect{ create(:user) }.to change{ Customer.all.size }.by(1) }

  it 'transient attribute' do
    customer = create(:customer, to_upcase: true)

    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'trait' do
    customer = create(:customer_vip, :male)

    expect(customer.gender).to eq('M')
    expect(customer.vip).to be_truthy
  end

  it 'travel_to' do
    travel_to Time.zone.local(2004, 11) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to eq(Time.zone.local(2004, 11))
  end
end
