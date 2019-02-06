require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test

  def test_renter_exist
    jessie = Renter.new('Jessie')

    assert_instance_of Renter, jessie
  end
end
