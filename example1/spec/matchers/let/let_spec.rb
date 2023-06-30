$counter = 0

describe 'let' do
  let(:count) { $counter += 1 }

  it 'memorize the value' do
    expect(count).to eq(1)
    expect(count).to eq(1)
  end

  it 'not cached between the tests' do
    expect(count).to eq(2)
  end
end
