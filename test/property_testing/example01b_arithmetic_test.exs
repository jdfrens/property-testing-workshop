defmodule PropertyTesting.Example01bArithmeticTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "*" do
    @tag :skip
    property "* of two integers returns an integer" do
      check all _factor1 <- integer(),
                _factor2 <- integer() do
        # TODO
        assert false
      end
    end

    @tag :skip
    property "* of two floats returns a float" do
      check all _factor1 <- float(),
                _factor2 <- float() do
        # TODO
        assert false
      end
    end

    @tag :skip
    property "* is commutative" do
      # TODO
      assert false
    end
  end

  describe "/" do
    @tag :skip
    property "/ of two integers returns an integer" do
      # TODO (broken)
      check all dividend <- integer(),
                divisor <- integer() do
        quotient = dividend / divisor
        assert is_integer(quotient)
      end
    end

    @tag :skip
    property "/ of two floats returns a float" do
      # TODO (broken)
      check all dividend <- float(),
                divisor <- float() do
        quotient = dividend / divisor
        assert is_float(quotient)
      end
    end

    @tag :skip
    property "/ of two numbers returns a float" do
      # TODO (use `one_of`)
      assert false
    end
  end

  describe "div/2" do
    @tag :skip
    property "div of two integers returns an integer" do
      check all dividend <- integer(),
                divisor <- integer() do
        _quotient = div(dividend, divisor)
        # TODO
        assert false
      end
    end
  end

  describe "rem/2" do
    @tag :skip
    property "rem of two integers returns an integer" do
      check all dividend <- integer(),
                divisor <- integer() do
        _remainder = rem(dividend, divisor)
        # TODO
        assert false
      end
    end
  end

  describe "* and /" do
    @tag :skip
    property "div/2 undoes *" do
      check all _factor1 <- integer(),
                _factor2 <- integer() do
        # TODO
        assert false
      end
    end

    @tag :skip
    property "* and + undo div/2 and rem/2" do
      check all dividend <- integer(),
                divisor <- integer() do
        _quotient = div(dividend, divisor)
        _remainder = rem(dividend, divisor)
        # TODO
        assert false
      end
    end
  end
end
