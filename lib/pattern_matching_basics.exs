list = [1, 2, 3]
[a, b, c] = list # a=1, b=2, c=3

list = [1, 2, [ 3, 4, 5 ]]
[a, b, c] = list # a=1, b=2, c=[3, 4, 5]

list = [1, 2, 3]
[a, 2, b] = list # a=1, b=3
[a, 1, b] = list # does not match: (MatchError) no match of right hand side value: [1, 2, 3]

[a] = [[1, 2, 3]] # a=[1, 2, 3]
[[a]] = [ [ 1, 2, 3 ] ] # does not match