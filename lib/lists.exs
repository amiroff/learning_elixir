# Lists can be empty or consist of head and tail
list = [1, 2, 3]
[h | t] = list # h -> 1, t -> [2, 3]

list = [1, 2, 3]
[h | [z | t]] = list # h -> 1, z -> 2, t -> 3
[1] == [1 | []] # true
[2 | [ 3 | [] ]] == [2, 3] # true

# concatenation
[1, 2, 3] ++ [4, 5] # [1, 2, 3, 4, 5]

# difference
[1, 2, 3] -- [2] # [1, 3]

# membership
1 in [1, 2] # true

# Recursion Examples

# Count every element
def len([]), do: []
def len([_head | tail]), do: [1 + len(tail)]


# Count every element in list
def len([]), do: []
def len([_head | tail]), do: [1 + len(tail)]
MyModule.len([1, 2, 3]) # 3
MyModule.len(["John", "Week"]) # 2

# Square each element in list
def square([]), do: []
def square([head | tail]), do: [head * head | square(tail)]
MyModule.square([1, 2, 3]) # [2, 4, 9]

# Add one to every element in list
def add_1([]), do: []
def add_1([head | tail]), do: [head + 1, add1_(tail)]

# Create a map function
def apply_map([], _func), do: []
def apply_map([head | tail], func), do: [func.(head), apply_map(tail, func)]
MyModule.apply_map([1, 2, 3], fn (n) -> n * 10) # [10, 20, 30]
MyModule.apply_map([1, 2, 3], &(&1 > 2)) # [false, false, true]

# Keeping track of values during recursion

# Retun sum of elements (with accumulator)

def sum(list),          do: _sum(list, 0)
defp _sum([], total),   do: total
defp _sum([head | tail], total), do: [sum(tail), total + head]

# Retun sum of elements (without accumulator)
def sum([]),              do: 0
def sum([ head | tail ]), do: head + sum(tail)

# Examle reducer function

def reduce([], value, _) do
    value # if the list is empty we return final value
end
def reduce([head | tail], value, fun) do
    reduce([tail, fun.(value + head), fun]) # we apply fun to head + value and then call reduce on tail
end
MyModule.reduce([1,2,3,4,5], 0, &(&1 + &2)) # 15
