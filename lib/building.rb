class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    all_rent = @units.map { |unit| unit.monthly_rent }
    average_rent = all_rent.inject{ |total, monthly_rent| total + monthly_rent }.to_f / all_rent.length
    average_rent.round(1)
  end
end
