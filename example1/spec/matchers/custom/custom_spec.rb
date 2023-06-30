RSpec::Matchers.define :be_a_multiple_of do |expected|
  match do |actual|
    actual % expected == 0
  end

  description do |actual|
    "#{actual} be a multiple of #{expected}"
  end

  failure_message do |actual|
    "expected that #{actual} would be a multiple of #{expected}"
  end
end

describe 18, 'Custom Matcher' do
  it { is_expected.to be_a_multiple_of(3) }
  it { is_expected.not_to be_a_multiple_of(5) }
end
