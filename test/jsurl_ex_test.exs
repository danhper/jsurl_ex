defmodule JsurlExTest do
  use ExUnit.Case
  doctest JsurlEx

  import JsurlEx

  test "nil" do
    assert stringify(nil) == "~null"
  end

  test "boolean" do
    assert stringify(true) == "~true"
    assert stringify(false) == "~false"
  end

  test "atom" do
    assert stringify(:foo) == "~'foo"
  end

  test "number" do
    assert stringify(1) == "~1"
    assert stringify(1.2) == "~1.2"
  end

  test "string" do
    assert stringify("foo") == "~'foo"
  end

  test "array" do
    assert stringify([1, 2, 3]) == "~(~1~2~3)"
  end

  test "map" do
    input = [foo: "bar", bar: 2, baz: [1,2], qux: nil, asdf: true]
    expected = "~(foo~'bar~bar~2~baz~(~1~2)~qux~null~asdf~true)"
    assert stringify(input) == expected
  end
end
