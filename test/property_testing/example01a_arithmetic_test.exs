defmodule PropertyTesting.Example01aArithmeticTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "+" do
    property "+ of two integers returns an integer" do
      check all summand1 <- integer(),
                summand2 <- integer() do
        assert is_integer(summand1 + summand2)
      end
    end

    property "+ of two floats returns a float" do
      check all summand1 <- float(),
                summand2 <- float() do
        assert is_float(summand1 + summand2)
      end
    end

    property "+ is commutative" do
      # QUESTION: why `integer()` and not `float()`?
      check all summand1 <- integer(),
                summand2 <- integer() do
        assert summand1 + summand2 == summand2 + summand1
      end
    end
  end

  describe "-" do
    property "- of two integers returns an integer" do
      check all minuend <- integer(),
                subtrahend <- integer() do
        assert is_integer(minuend - subtrahend)
      end
    end

    property "- of two floats returns a float" do
      check all minuend <- float(),
                subtrahend <- float() do
        assert is_float(minuend - subtrahend)
      end
    end

    property "minuend and difference are interchangeable" do
      check all minuend <- integer(),
                subtrahend <- integer() do
        difference = minuend - subtrahend
        assert minuend - difference == subtrahend
      end
    end
  end

  describe "+ and -" do
    property "- undoes +" do
      check all summand1 <- integer(),
                summand2 <- integer() do
        sum = summand1 + summand2
        assert sum - summand1 == summand2
        assert sum - summand2 == summand1
      end
    end

    property "+ undoes -" do
      check all minuend <- integer(),
                subtrahend <- integer() do
        difference = minuend - subtrahend
        assert difference + subtrahend == minuend
      end
    end
  end
end
