require 'string_present'

describe 'Classes' do
  it 'be_instance_of' do
    str = StringPresent.new

    expect(str).not_to be_instance_of(String)
    expect(str).to be_instance_of(StringPresent)
    expect(10).to be_instance_of(Integer)
  end

  it 'be_kind_of' do
    str = StringPresent.new

    expect(str).to be_kind_of(String)
    expect(str).to be_kind_of(StringPresent)
    expect(10).to be_kind_of(Integer)
  end

  it 'respond_to' do
    expect('foo').to respond_to(:size)
  end

  it 'be_a // be_an' do
    str = StringPresent.new

    expect(str).to be_a(String)
    expect(str).to be_a(StringPresent)
    expect(10).to be_a(Integer)
  end
end
