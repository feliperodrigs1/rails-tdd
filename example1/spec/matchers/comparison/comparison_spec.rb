describe 'Comparison Matchers' do
  it '>' do
    expect(5).to be > 1
  end

  it '>=' do
    expect(5).to be >= 2
    expect(5).to be >= 5
  end

  it '<' do
    expect(5).to be < 12
  end

  it '<=' do
    expect(5).to be <= 12
    expect(5).to be <= 5
  end

  it 'be_between inclusive' do
    expect(5).to be_between(5, 7).inclusive
    expect(7).to be_between(5, 7).inclusive
  end

  it 'be_between inclusive / aggregate failures', :aggregate_failures do
    expect(5).to be_between(5, 7).inclusive
    expect(7).to be_between(5, 7).inclusive
  end

  it 'be_between exclusive' do
    expect(5).not_to be_between(5, 7).exclusive
    expect(6).to be_between(5, 7).exclusive
    expect(7).not_to be_between(5, 7).exclusive
  end

  it 'match' do
    expect('foo@foo.com').to match(/..@../)
  end

  it 'start_with' do
    expect('Foo Test').to start_with('Foo')
    expect([1, 2, 3]).to start_with(1)
  end

  it 'end_with' do
    expect('Foo Test').to end_with('Test')
    expect([1, 2, 3]).to end_with(3)
  end
end
