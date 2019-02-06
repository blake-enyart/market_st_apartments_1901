require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @jessie = Renter.new('Jessie')
  end

  def test_building_exist

    assert_instance_of Building, @building
  end

  def test_no_units_in_building_initially

    assert_equal [], @building.units
  end

  def test_add_unit_fills_units_with_multiple_apartment_objects
    @building.add_unit(@a1)
    @building.add_unit(@b2)

    assert_instance_of Apartment, @building.units[0]
    assert_instance_of Apartment, @building.units[1]
    assert_equal 2, @building.units.length
  end

  def test_average_rent_calculated_from_all_units_in_building
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    
    assert_equal 1099.5, @building.average_rent
  end
end

# require './lib/renter'
#
#
# require './lib/apartment'
#
#
# require './lib/building'
#
#
# building = Building.new
#
#
# building.units
#
#
# a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
# building.add_unit(a1)
# building.add_unit(b2)
# building.units
# building.average_rent
