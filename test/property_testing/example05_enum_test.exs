defmodule PropertyTesting.Example05EnumTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  describe "Enum.reverse/1" do
    @tag :skip
    property "?????" do
      # QUESTION: why `integer()` and not `term()`?
      check all list <- list_of(integer()) do
        _reversed = Enum.reverse(list)
        # TODO
        assert false
      end
    end
  end

  describe "Enum.take/2" do
    @tag :skip
    property "list returned has right number of elements" do
      # TODO (broken)
      check all list <- list_of(integer()),
                n <- non_negative_integer() do
        taken = Enum.take(list, n)
        assert length(taken) == n
      end
    end

    # QUESTION: is that test sufficient?
  end

  describe "Enum.sort/1" do
    @doc """
    Return `true` if elements of `enum` are in order; return `false` otherwise.
    """
    def in_order?(_enum) do
      # TODO
      false
    end

    @tag :skip
    property "sorted list is ordered" do
      check all list <- list_of(integer()) do
        sorted = Enum.sort(list)
        assert in_order?(sorted)
      end
    end

    # QUESTION: how is the previous test sufficient?
    # QUESTION: how is the previous test insufficient?

    @tag :skip
    property "??????" do
      check all list <- list_of(integer()) do
        _sorted = Enum.sort(list)
        # TODO
        assert false
      end
    end
  end

  describe "Enum.sort/2" do
    @tag :skip
    property "backwards sorted list is ordered" do
      check all list <- list_of(integer()) do
        sorted = Enum.sort(list, fn a, b -> a >= b end)
        # TODO (broken)
        assert in_order?(sorted)
      end
    end
  end

  # TAKE HOME EXERCISE
  describe "Enum.split/2 and Enum.concat/2" do
    @tag :skip
    property "concat/2 undoes split/2" do
      assert false
    end

    @tag :skip
    property "split/2 undoes concat/2" do
      assert false
    end
  end
end
