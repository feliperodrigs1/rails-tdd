require 'person'

describe 'Attributes' do
  let(:person) { Person.new }

  it 'have_attributes' do
    person.name = 'Felipe'
    person.age = 23

    expect(person).to have_attributes(name: a_string_starting_with('F'))
    expect(person).to have_attributes(age: (a_value >= 20))
  end

  it 'have_attributes' do
    person.name = 'Fernando'
    person.age = 20

    expect(person).to have_attributes(name: a_string_starting_with('F'))
    expect(person).to have_attributes(age: (a_value >= 20))
  end
end

