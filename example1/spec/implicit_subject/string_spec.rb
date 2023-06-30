require 'string_present'

describe String do
  describe StringPresent do
    it 'should not be empty' do
      expect(subject).to eq('NotEmpty')
    end
  end
end
