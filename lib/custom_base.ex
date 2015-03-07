defmodule CustomBase do
  @moduledoc false

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
        |> round
      end

      for { digit, idx } <- Enum.with_index(alphabet) do
        defp decode_char(unquote(<< digit >>)), do: unquote(idx)
      end

      defp decode_char(char) do
        raise(ArgumentError, "non-alphabet digit found: #{char}")
      end

      defp decode([last], step) do
        decode_char(last) * :math.pow(unquote(length(alphabet)), step)
      end
      defp decode([head|tail], step) do
        decode_char(head) * :math.pow(unquote(length(alphabet)), step) + decode(tail, step + 1)
      end
    end
  end
end
