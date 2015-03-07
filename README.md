# CustomBase [![License](https://img.shields.io/hexpm/l/custom_base.svg?style=flat-square)](https://github.com/igas/custom_base/blob/master/LICENSE)

CustomBase allow you to make custom base conversion in Elixir.

## Installation

Add `{ :custom_base, "~> 0.1.0" }` to `deps` function in your `mix.exs` file.

After you are done, run `mix deps.get` in your shell to fetch and compile CustomBase.

## Example

Lets make `Base12` module with conversion described below.

| Value | Encoding |
|------:|---------:|
|      0|         0|
|      1|         1|
|      2|         2|
|      3|         3|
|      4|         4|
|      5|         5|
|      6|         6|
|      7|         7|
|      8|         8|
|      9|         9|
|     10|         A|
|     11|         B|

Add macro to your module:

```elixir
defmodule Base12 do
  use CustomBase, '0123456789AB'
end
```

Now your module have 2 functions `encode/1` and `decode/1`:

```
iex> Base12.encode(9)
"9"
iex> Base12.encode(10)
"A"
iex> Base12.encode(11)
"B"
iex> Base12.encode(12)
"10"
iex> Base12.decode("16")
18
iex> Base12.decode("AB")
131
```

## Specs & Docs

All specs included by this library, if you want to provide your documentation,
add it after `use` call, like this:

```
defmodule Base12 do
  use CustomBase, '0123456789AB'

  @moduledoc """
  Your module docs.
  """

  @doc """
  Documentation for encode/1.
  """
  def encode(integer)

  @doc """
  Documentation for decode/1.
  """
  def decode(binary)

  @doc """
  Documentation for decode!/1.
  """
  def decode!(binary)
end
```

## [License](https://github.com/igas/custom_base/blob/master/LICENSE)

Released under the MIT License.
