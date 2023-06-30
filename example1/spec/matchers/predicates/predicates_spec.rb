describe 'Predicates' do
  it 'odd' do
    expect(1).to be_odd
  end

  it 'even' do
    expect(1).not_to be_even
  end
end
