# Tuple -> ordered collection of values. Max 3-4 values.
{1, 2}
{:ok, response}

# Can be used in pattern matching
{status, count, action} = {:ok, 42, "next"} # status -> :ok

# Functions can return multiple values via tuples
{status, file} = File.open("myfile.txt") # {:ok, #PID<0.39.0>}