# JsurlEx

A module to encode/decode using [jsurl](https://github.com/Sage/jsurl) format.

NOTE: Only encoding is available now, as it is all I need for now,
I will work on decoding if someone needs it.

## Installation

Add `jsurl_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
[{:jsurl_ex, "~> 0.1.0"}]
end
```

## Usage

```elixir
value = %{foo: "bar", bar: [1, 2, 3]}
JsurlEx.stringify(value) # => "~(bar~(~1~2~3)~foo~'bar)
```
