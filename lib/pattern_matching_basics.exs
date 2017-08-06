list = [1, 2, 3]
[a, b, c] = list # a=1, b=2, c=3

list = [1, 2, [ 3, 4, 5 ]]
[a, b, c] = list # a=1, b=2, c=[3, 4, 5]

list = [1, 2, 3]
[a, 2, b] = list # a=1, b=3
[a, 1, b] = list # does not match: (MatchError) no match of right hand side value: [1, 2, 3]

[a] = [[1, 2, 3]] # a=[1, 2, 3]
[[a]] = [ [ 1, 2, 3 ] ] # does not match

[a, a] = [1, 1] # matches, a=1
[b, b] = [1, 2] # does not mach, variables can only bind once per match

a = 1
[1, a, 3] = [1, 2, 3] # a is now 2. Variable can be bount to a new value on a subsequent match

a = 1
a = 2 # a is now 2
^a = 1 # by using pin operator we can use the exicting value. This will not match and a will not change

a = 2
[a, 2] = [1, 2] # matches, will reassign a to 1
[^a, 2] = [2, 2] # will not match because ^a is already 1

^a = 1
^a = 2 - a # matches, a is still 1 (2-1)

a = 1
[a, _, _] = [1, 2, 3] # matches and ignores _