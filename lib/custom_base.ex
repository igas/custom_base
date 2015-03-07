defmodule CustomBase do
  defmacro __using__(alphabet) do
    quote bind_quoted: [alphabet: alphabet] do
      for { digit, idx } <- Enum.with_index(alphabet) do
        def encode(unquote(idx)), do: unquote(<< digit >>)
      end

      def encode(number) do
        encode(div(number, unquote(length(alphabet)))) <> encode(rem(number, unquote(length(alphabet))))
      end

      for { digit, idx } <- Enum.with_index(alphabet) do
        def decode(unquote(<< digit >>)), do: unquote(idx)
      end

      def decode(binary) do
        binary
        |> String.split("", trim: true)
        |> Enum.reverse
        |> decode(0)
        |> round
      end

      defp decode([last], step) do
        decode(last) * :math.pow(unquote(length(alphabet)), step)
      end
      defp decode([head|tail], step) do
        decode(head) * :math.pow(unquote(length(alphabet)), step) + decode(tail, step + 1)
      end
    end
  end
end
