-module(tut14).
-export([start/0, say_something/2]).

say_something(_, 0) ->
    done;

say_something(What, N) ->
    io:format("~p~n", [What]),
    say_something(What, N - 1).

start() ->
    spawn(tut14, say_something, ['Hello!', 3]),
    spawn(tut14, say_something, ['Goodbye!', 3]).
