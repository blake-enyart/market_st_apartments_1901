require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < Minitest::Test

  def setup
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @jessie = Renter.new('Jessie')
  end

  def test_apartment_exist

    assert_instance_of Apartment, @a1
  end

  def test_apartment_has_no_renter

    assert_nil @a1.renter
  end

  def test_add_renter_places_renter_object_in_apartment
    @a1.add_renter(@jessie)

    assert_instance_of Renter, @a1.renter
  end
end

# require './lib/renter'
#
# require './lib/apartment'
#
# jessie = Renter.new("Jessie")
#
# jessie.name
#
# a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
#
# a1.number
#
# a1.monthly_rent
#
# a1.bathrooms
#
# a1.bedrooms
#
# a1.renter
#
# a1.add_renter(jessie)
#
# a1.renter
