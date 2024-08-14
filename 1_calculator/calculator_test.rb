require "minitest/autorun"
require_relative "calculator"

class TestCalculator < Minitest::Test
  def test_add
    result = Calculator.add(1, 2)
    assert_equal(3, result)
  end

  def test_subtract
    result = Calculator.subtract(1, 2)
    assert_equal(-1, result)
  end

  def test_multiply
    result = Calculator.multiply(-2, -3)
    assert_equal(6, result)
  end

  def test_divide
    result = Calculator.divide(-3, -2)
    assert_equal(1.5, result)
  end

  def test_divide_of_zero
    assert_raises(ArgumentError) { Calculator.divide(-3, 0) }
  end

  def test_factorial
    result = Calculator.factorial(5)
    assert_equal(120, result)
  end
  
  def test_factorial_of_zero
    result = Calculator.factorial(0)
    assert_equal(1, result)
  end

  def test_factorial_of_negative_integer
    assert_raises(ArgumentError) { Calculator.factorial(-1) }
  end
end
