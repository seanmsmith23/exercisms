require 'minitest/autorun'
require_relative 'triplet'

class TripletTest < MiniTest::Unit::TestCase
  def test_sum
    assert_equal 12, Triplet.new(3, 4, 5).sum
  end

  def test_product
    assert_equal 60, Triplet.new(3, 4, 5).product
  end

  def test_pythagorean
    assert Triplet.new(3, 4, 5).pythagorean?
  end

  def test_not_pythagorean
    assert !Triplet.new(5, 6, 7).pythagorean?
  end

  def test_triplets_upto_10
    triplets = Triplet.where(max_factor: 10)
    # creates a variable called triplets. calls method where and passes a single hash called max_factor. should find all triplets up to 10.
    products = triplets.map(&:product).sort
    assert_equal [60, 480], products
  end

  def test_triplets_from_11_upto_20
    skip
    triplets = Triplet.where(min_factor: 11, max_factor: 20)
    products = triplets.map(&:product).sort
    assert_equal [3840], products
  end

  def test_triplets_where_sum_x
    skip
    triplets = Triplet.where(sum: 180, max_factor: 100)
    products = triplets.map(&:product).sort
    assert_equal [118080, 168480, 202500], products
  end
end

# where is a method that needs to identify triplets form a minimum to a maximum
#