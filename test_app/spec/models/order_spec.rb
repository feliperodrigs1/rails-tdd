require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_list' do
    order = create(:order)

    expect(order.customer).not_to be_nil
    expect(order.customer).to be_kind_of(Customer)
  end

  it 'create_list' do
    orders = create_list(:order, 3)

    expect(orders.count).to eq(3)
  end

  it 'has_many' do
    customer = create(:customer, :with_orders)

    expect(customer.orders.count).to eq(3)
  end

  it 'has_many - overwriting' do
    customer = create(:customer, :with_orders, orders_amount: 5)

    expect(customer.orders.count).to eq(5)
  end

  it 'create_pair' do
    orders = create_pair(:order)

    expect(orders.count).to eq(2)
  end
end
