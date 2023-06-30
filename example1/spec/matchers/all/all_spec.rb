describe 'all', type: 'collection' do
  it { expect([1, 7, 9]).to all (be_odd).and be_an(Integer) }
  it { expect(%w[ruby rails]).to all be_a(String).and include ('r')}
end
