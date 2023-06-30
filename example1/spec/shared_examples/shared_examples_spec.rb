require 'person'

shared_examples 'status' do |feeling|
  it "#{feeling}" do
    person.send("#{feeling}!")
    expect(person.status).to eq("Feeling #{feeling.capitalize}")
  end
end

describe Person do
  subject(:person) { described_class.new }

  it_behaves_like 'status', :happy
  it_behaves_like 'status', :sad
  it_should_behave_like 'status', :bored
end
