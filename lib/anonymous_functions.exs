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

# A function that takes three arguments. 
# If the first two are zero, returns "FizzBuzz."
# If the first is zero, returns "Fizz." If the second is zero, returns "Buzz." 
# Otherwise returns the third argument. "

fizbuz = fn 
    0, 0, _ -> "FizzBuzz"
    0, _, _ -> "Fizz"
    _, 0, _ -> "Buzz"
    _, _, n -> n
end

# functions can return functions
fun1 = fn -> 
    fn -> 
        "Hello"
    end 
end

fun2 = fun1.()
fun2.() # Hello

# functions carry with them the scope in which they were defined
greeter = fn name -> (fn -> "Hello #{name}" end) end
dave_greeter = greeter.("Dave") # "Dave" now in scope of inner function
dave_greeter.() # -> "Hello Dave"

# parameterized Functions
add_n = fn n -> (fn other -> n + other end) end
add_two = add_n.(2) # This returns a function that gets one parameter and adds 2 to it
add_two.(5) # -> 7

# Passing functions as values is common
times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6) # -> 12. # here we pass function just like a parameter

# here we are passing anon function as a second argument to Enum.map
Enum.map [1, 2, 3, 4], fn elem -> elem * 2 end # returns [2, 4, 6, 8]

# using ^ operator is possible
def for(name, greeting) do
    fn 
        (^name) -> "#{greeting} #{name}" # name must match the same at the time of definition
        (_)     -> "I do not know you"
    end
end

mr_valim = for("Jose", "Oi!")
mr_valim.(Jose) # => Oi! Jose
mr_valim.(Dave) # => I do not know you

# & notation for anonymous functions
# Here &1 and &2 and &n defines arguments in order.
add_one = &(&1 + 1) # same as add_one = fn (n) -> n + 1 end
square = &(&1 * &1)
speak = &(IO.puts(&1))
rnd = &(Float.round(&1, &2))

# If we give & a name of function and its arity, it gives us anon function that calls it
len = &Enum.count/1
len.([1, 2, 3, 4]) # => 4

# more examples with &
Enum.map [1, 2, 3, 4], &(&1 + 1) # [2, 3, 4, 5]
Enum.map [1, 2, 3, 4], &(&1 * &1) # [1, 2, 9, 16]
Enum.map [1, 2, 3, 4], &(&1 < 3) # [true, true, false, false]

# even more examples
list_concat = fn a, b -> a ++ b end
list_concat.([:a, :b], [:c, :d]) # [:a, :b, :c, :d]

sum = fn a, b, c -> a + b + c end
sum.(1, 2, 3) # 6

tuple_to_list = fn {a, b} -> [a, b] end
tuple_to_list.({123, 4567}) # [123, 4567]