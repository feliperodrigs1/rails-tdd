require 'person'

describe 'Attributes' do
  # before(:each) do
  #   @person = Person.new
  # end

  around(:each) do |test|
    @person = Person.new

    test.run
  end

  it 'have_attributes' do
    @person.name = 'Felipe'
    @person.age = 23

    expect(@person).to have_attributes(name: a_string_starting_with('F'))
    expect(@person).to have_attributes(age: (a_value >= 20))
  end

  it 'have_attributes' do
    @person.name = 'Fernando'
    @person.age = 20

    expect(@person).to have_attributes(name: a_string_starting_with('F'))
    expect(@person).to have_attributes(age: (a_value >= 20))
  end
end
