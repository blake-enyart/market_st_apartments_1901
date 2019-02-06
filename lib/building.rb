class Building

  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    all_rent = get_all_rent
    average_rent = all_rent.inject{ |total, monthly_rent| total + monthly_rent }.to_f / all_rent.length
    average_rent.round(1)
  end

  def get_all_rent
    @units.map { |unit| unit.monthly_rent }
  end

  def get_only_full_apartments
    @units.select { |unit| unit.renter != nil }
  end

  def renter_with_highest_rent
    full_units = get_only_full_apartments
    high_apartment = full_units.max_by { |unit| unit.monthly_rent }
    high_apartment.renter
  end

  def annual_breakdown
    full_units = get_only_full_apartments
    renters = []
    annual_rent = []
    
    full_units.each do |unit|
      renters << unit.renter.name
      annual_rent << unit.monthly_rent*12
    end

    Hash[renters.zip(annual_rent)]
  end
end
