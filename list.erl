-module(list).
-export([list_length/1, list_max/1]).

list_length([]) ->
    0;

list_length([_|R]) ->
    1 + list_length(R).

list_max([X|XS]) ->
    list_max(XS, X).

list_max([], CurrentMax) ->
    CurrentMax;

list_max([X|XS], CurrentMax)
    when X > CurrentMax ->
    list_max(XS, X);

list_max([_|XS], CurrentMax) ->
    list_max(XS, CurrentMax).
