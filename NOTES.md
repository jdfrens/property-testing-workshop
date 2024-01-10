## History

* Haskell and Quick Check
  * Quick Check library builds functions to generate data using Haskell's typing
    system.
* Other languages: write our own generator functions.

## Breakdown of Property Testing

* Generate data
  * need a stream of values
  * shrinking
* Properties
  * need to identify useful, testable properties
  * only need `assert/1`

## Elixir's `stream_data` Library

https://hexdocs.pm/stream_data/StreamData.html
* `StreamData` functions generate streams of data.

https://hexdocs.pm/stream_data/ExUnitProperties.html
* Provides DSL:
  * `check all` is a macro to check properties using `StreamData` generators.
  * `gen all` is a macro to write our own generators.
  * `property` is a drop-in replacement for `test` in ExUnit tests

## Recommended Reading and Viewing


"Picking Properties to Test in Property Based Testing" by Michael Stalker -
ElixirConf 2018
* https://www.youtube.com/watch?v=OVLTHGaTi7k
* https://github.com/michaelstalker/presentations/tree/master/elixirconf-2018
* List of testable properties
  * type
  * shape
  * symmetry
  * size
  * presence/emptiness
  * enumeration
  * range
  * relationship of values
  * order

[PropCheck](https://hexdocs.pm/propcheck/readme.html)
