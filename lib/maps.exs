# Maps are collection of key-value pairs like keyword lists

%{ key => value, key2 => value2 }

# Keys and values can be anything
cities = %{ 34 => "İstanbul", 16 => "Bursa" }

# If the key is an atom we can use shortcut
colors = %{ :white => "fff", :black => "000" }
# can be written as:
colors = %{ white: "fff", black: "000" }

# we can use expressions as keys:
name = "Metin Emiroğlu"
%{ String.downcase(name) => name } # %{"metin emiroğlu" => "Metin Emiroğlu"}

# Accessing values via keywords
cities[34] # İstanbul
colors[:white] # "fff"

# if key is an atom we can use . notation:
colors.white # "fff"

# We get KeyError if key does not exist:
colors.beige # ** (KeyError) key :beige not found in: %{black: "000", white: "fff"}
