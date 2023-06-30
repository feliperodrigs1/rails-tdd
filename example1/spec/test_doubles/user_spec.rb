describe 'Test Double' do
  it '#receive_messages' do
    user = double('User')
    allow(user).to receive_messages(name: 'Foo', password: 'secret')

    expect(user.name).to eq('Foo')
  end

  it '#as_null_object' do
    user = double('User').as_null_object
    allow(user).to receive_messages(name: 'Foo', password: 'secret')

    expect(user.name).to eq('Foo')
    expect(user.foo).not_to be_nil
  end
end
