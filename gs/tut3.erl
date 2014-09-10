-module(tut3).
-export([convert_length/1]).

convert_length({centimeter, N}) ->
    {inch, N / 2.54};

convert_length({inch, N}) ->
    {centimeter, N * 2.54}.
