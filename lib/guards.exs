defmodule Guard do
    # we can use when clause to check for pre excisting requirements
    def double(n) when is_number(n) do
        n * 2
    end

    # we can use only a subset of Elixir expressions in guard clauses
    # http://elixir-lang.org/getting-started/case-cond-and-if.html#expressions-in-guard-clauses
    def divide(a, b) when a > 0 and b > a do
        div(a, b)
    end
end