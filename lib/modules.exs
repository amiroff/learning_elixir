# we have to define modules to use named functions
defmodule MyModule do
    def myfun do
        "hello"
    end
end
MyModule.myfun

# We can define nested modules
defmodule Outer do
    defmodule Inner do
        def inner_func do 
        end
    end
    def outer_func do
        Inner.inner_func
    end
end
Outer.outer_func
Outer.Inner.inner_func

# we can directly define a nested module
defmodule Mix.Tasks.Doctest do
    def run do
    end
end
Mix.Tasks.Doctest.run

# import Module brings all the Functions and Macros of Module un-namespaced into your module.
import List # we can use everyting in List module, iex flatten[5, [6, 7], 8]

# we can limit what to import and what to not
import List, only: [flatten: 1]
import List, only: [flatten: 1, duplicate: 2]
import List, only: :functions
import List, only: :macros
import List, except: [flatten: 1]

# The alias directive creates an alias for a module so we can call it shorter
alias My.Other.Module.Parser, as: MyParser
MyParser.parse

# if we omit the as: part, alias will be the same as last inner module
alias My.Other.Module.Parser

# we can also use {} to make multiple aliases on one line
alias My.Other.Module.{Parser, Runner}

# require Module allows you to use macros of Module but does not import them. 
# Functions of Module are always available namespaced.
# In order to use a macro, we need to guarantee its module and implementation are available during compilation.
require Integer
Integer.is_odd(3)

# use macro is frequently used by developers to bring external 
# functionality into the current lexical scope, often modules.
# Behind the scenes, use requires the given module and then calls 
# the __using__/1 callback on it allowing the module to inject 
# some code into the current context.
defmodule Example do
  use Feature, option: :value
end
# is equal to:
defmodule Example do
  require Feature
  Feature.__using__(option: :value)
end

# Elixir modules can have metadata. They are called attributes and we name them with @
# They are used as annotations, constants or temp module storage
defmodule MyServer do
  @vsn 2
end

defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Math.sum(1, 2)
      3

  """

  @doc """
  Calculates the sum of two numbers.
  """
  def sum(a, b), do: a + b
end 

defmodule MyServer do
  @initial_state %{host: "147.0.0.1", port: 3456}
  IO.inspect @initial_state
end

defmodule Example do
    @author "Metin Emiroglu"
    def get_author do
        @author
    end
end

# we call Erlang modules with :
:io.format("The number is", [5.678])