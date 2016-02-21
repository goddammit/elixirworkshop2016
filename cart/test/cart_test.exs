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
   assert Cart.show([{:+, 'banana'}]) == [{1, 'banana'}]
  end

  test "show unique" do
    assert Cart.unique([]) == []
    assert Cart.unique([{:+,'banana'}]) == ['banana']
    assert Cart.unique([{:+,'banana'}, {:+,'banana'}]) == ['banana']
  end

  test "count" do
    assert Cart.counter([{:+, 'banana'}], 'banana') == 1
    assert Cart.counter([{:+, 'banana'},{:-, 'banana'}], 'banana') == 0
    assert Cart.counter([{:+, 'banana'},{:+, 'banana'}], 'banana') == 2
    assert Cart.counter([{:-, 'banana'},{:-, 'banana'}], 'banana') == -2
    assert Cart.counter([{:+, 'banana'},{:-, 'banana'}, {:+, 'apple'}], 'banana') == 0
  end

end
