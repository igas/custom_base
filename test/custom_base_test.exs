defmodule BaseABCDEFGHIJ do
  use CustomBase, 'abcdefghij'
end

defmodule CustomBaseTest do
  use ExUnit.Case
  import BaseABCDEFGHIJ

  test "encode/1" do
    assert encode(0) == "a"
    assert encode(9) == "j"
    assert encode(11) == "bb"
  end

  test "decode/1" do
    assert decode("c") == 2
    assert decode("i") == 8
    assert decode("gg") == 66
  end
end
