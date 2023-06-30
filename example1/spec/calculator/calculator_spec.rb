require 'calculator'

describe Calculator, 'class with operations' do
  subject(:calc) { described_class }

  context '#sum' do
    it 'positive numbers' do
      result = calc.sum(5, 7)

      expect(result).to eq(12)
    end

    it 'negative numbers' do
      result = calc.sum(-5, 7)

      expect(result).to eq(2)
    end
  end

  context '#div' do
    it 'by 0' do
      expect{ calc.div(3, 0) }.to raise_error(ZeroDivisionError)
      expect{ calc.div(3, 0) }.to raise_error('divided by 0')
      expect{ calc.div(3, 0) }.to raise_error(ZeroDivisionError, 'divided by 0')
    end
  end
end
