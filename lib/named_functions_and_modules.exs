# Named functions MUST be written inside modules
defmodule Times do

    # this functions is written double/1
    def double(n) do
        n * 2
    end
end

# calling the above function
# we do not use . before () as with anon functions
Times.double(2) # => 4

# this is an anlernative and shorter syntax for single line blocks
def double(n), do: n * 2

# we can also pass multiple lines to do by grouping them with parentheses
def greet(greeting, name), do: (
    IO.puts greeting
    IO.puts "How are you doing, #{name}?"
)

# we can use pattern mathching in named functions too
# Elixir tries functions from the top down, executing the first match
def fact(0), do: 1
def fact(n), do: n * fact(n-1)