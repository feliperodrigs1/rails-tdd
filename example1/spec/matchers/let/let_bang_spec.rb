$count = 0

describe 'let!' do
  invoiced = []

  let!(:counter) do
    invoiced << :let!
    $count += 1
  end

  it 'call helper method before the test' do
    invoiced << :example

    expect(invoiced).to eq([:let!, :example])
    expect(counter).to eq(1)
  end
end
