# simplest function
sum = fn (a, b) -> a + b end
# invoking the above anonymous function
sum.(1, 2)

# We can omit parentheses in a function definition
f1 = fn a, b -> a * b end
f1.(5, 6)

# No arguments function
greet = fn -> IO.puts "Hello" end
greet.() #parentheses are required even if no arguments are passed

# We can use pattern matching with anon functions
swap = fn {a, b} -> {b, a} end
swap.({6, 8}) # {8, 6}

# One function, multiple bodies are possible
handle_open = fn
    {:ok, file} -> "Successfully read data"
    {_,  error} -> "Error reading data"
end

handle_open.(File.open("hello.exs")) # Successfully read data
handle_open.(File.open("404.exs")) # Error reading data