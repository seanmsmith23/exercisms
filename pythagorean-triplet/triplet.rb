class Triplet
  attr_accessor :triplet

  def initialize(a, b, c)
    @triplet = []
    @triplet << a
    @triplet << b
    @triplet << c
  end

  def self.where(hash)
    min = 0
    if hash.include?(:min_factor)
      min = hash[:min_factor]
    end
    if hash.include?(:max_factor)
      max = hash[:max_factor]
    end
    if hash.include?(:sum)
      sum = hash[:sum]
    end

    to_test = []

    while min < max
      min += 1
      to_test << min
      to_test << min
      to_test << min
    end

    unique_tests = to_test.permutation(3).to_a.uniq
    @triplet = []
    unique_tests.each do |test|
      @triplet << test if (test[0] ** 2) + (test[1] ** 2) == (test[2] ** 2)
    end
    @triplet = @triplet.uniq { |item| item[0] + item[1] + item[2] }
  end

  def pythagorean?
    if (@triplet[0] ** 2) + (@triplet[1] ** 2) == (@triplet[2] ** 2)
      true
    else false
    end
  end

  def sum
    triplet_sum = @triplet[0] + @triplet[1] + @triplet[2]
  end

  def product
    triplet_product = @triplet[0] * @triplet[1] * @triplet[2]
  end

end


# A list of pythagorean triplets below 1000
  # Start with one, one, one. Add two
# Add that list of triplets to see which equals 1000