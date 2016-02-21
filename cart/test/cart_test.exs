defmodule CartTest do
  use ExUnit.Case
  doctest Cart

  test "add_to_history" do
    assert Cart.add([], {})==[]
    assert Cart.add([], {:+, 'banana'})==[{:+, 'banana'}]
    assert Cart.add([{:+, 'banana'}], {:+, 'apple'})==[{:+, 'banana'}, {:+, 'apple'}]
    assert Cart.add([{:+, 'banana'}], {:-, 'banana'})==[{:+, 'banana'}, {:-, 'banana'}]
  end

  test "show cart" do
    assert Cart.show([]) == []
  end

  test "show unique" do
    assert Cart.unique([]) == []
    assert Cart.unique([{:+,'banana'}]) == ['banana']
    assert Cart.unique([{:+,'banana'}, {:+,'banana'}]) == ['banana']
  end

end
