defmodule BaseABCDEFGHIJ do
  use CustomBase, 'abcdefghij'
end

defmodule HexBase do
  use CustomBase, '0123456789abcdef'
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
    assert decode("c") == {:ok, 2}
    assert decode("i") == {:ok, 8}
    assert decode("gg") == {:ok, 66}
  end

  test "decode!/1" do
    assert decode!("c") == 2
    assert decode!("i") == 8
    assert decode!("gg") == 66
  end

  # This test will fail if :math.pow overflows
  test "pow overflow" do
    int = 489732498728927498273432
    str = "67b473b32ffa144f0298" # Checked with WolframAlpha

    assert str == HexBase.encode(int)
    assert int == HexBase.decode!(str)
  end
end
