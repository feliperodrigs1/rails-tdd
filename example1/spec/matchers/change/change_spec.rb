require 'counter'

describe 'Change' do
  it { expect{ Counter.increment }.to change{ Counter.amount }.by(1) }
  it { expect{ Counter.increment }.to change{ Counter.amount }.from(1).to(2) }
end