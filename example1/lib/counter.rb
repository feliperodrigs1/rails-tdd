class Counter
  @amount = 0

  def self.amount
    @amount
  end

  def self.increment
    @amount += 1
  end
end
