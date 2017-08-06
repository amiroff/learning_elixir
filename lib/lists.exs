# Lists can be empty or consist of head and tail
list = [1, 2, 3]
[h | t] = list # h -> 1, t -> [2, 3]

list = [1, 2, 3]
[h | [z | t]] = list # h -> 1, z -> 2, t -> 3

# concatenation
[1, 2, 3] ++ [4, 5] # [1, 2, 3, 4, 5]

# difference
[1, 2, 3] -- [2] # [1, 3]

# membership
1 in [1, 2] # true