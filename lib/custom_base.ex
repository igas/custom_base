defmodule CustomBase do
  @moduledoc false

  defmodule Pow do
    @moduledoc false
    # This is an integer-only implementation of pow
    # It avoids issues where the erlang :math.pow overflows on a float
    # but yet doesn't raise any errors

    require Integer

    def pow(_, 0), do: 1
    def pow(x, n) when Integer.is_odd(n), do: x * pow(x, n - 1)
    def pow(x, n) do
      result = pow(x, div(n, 2))
      result * result
    end
  end

  defmacro __using__(alphabet) do
    quote bind_quoted: [alphabet: alphabet] do
      for { digit, idx } <- Enum.with_index(alphabet) do
        def encode(unquote(idx)), do: unquote(<< digit >>)
      end

      @spec encode(integer) :: binary
      def encode(number) do
        encode(div(number, unquote(length(alphabet)))) <> encode(rem(number, unquote(length(alphabet))))
      end

      @spec decode(binary) :: {:ok, integer} | :error
      def decode(binary) do
        { :ok, do_decode(binary) }
      rescue
        ArgumentError -> :error
      end

      @spec decode!(binary) :: integer
      def decode!(binary), do: do_decode(binary)

      defp do_decode(binary) do
        binary
        |> String.split("", trim: true)
        |> Enum.reverse
        |> decode(0)
      end

      for { digit, idx } <- Enum.with_index(alphabet) do
        defp decode_char(unquote(<< digit >>)), do: unquote(idx)
      end

      defp decode_char(char) do
        raise(ArgumentError, "non-alphabet digit found: #{char}")
      end

      defp decode([last], step) do
        decode_char(last) * Pow.pow(unquote(length(alphabet)), step)
      end
      defp decode([head|tail], step) do
        decode_char(head) * Pow.pow(unquote(length(alphabet)), step) + decode(tail, step + 1)
      end
    end
  end
end
