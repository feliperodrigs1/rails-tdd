describe 'Equal Matchers' do
  context '#equal' do
    it 'test if are the same object' do
      x = 'ruby'
      y = 'ruby'

      expect(x).not_to equal(y)
      expect(x).to equal(x)
    end
  end

  context '#be' do
    it 'test if are the same object' do
      x = 'ruby'
      y = 'ruby'

      expect(x).not_to be(y)
      expect(x).to be(x)
    end
  end

  context '#eq' do
    it 'test the value' do
      x = 'ruby'
      y = 'ruby'

      expect(x).to eq(y)
    end
  end
end
