-module(rpnFold).
-export([simple/1]).

simple("") ->
    error("No expression provided");

simple(Expression) ->
    lists:foldl(fun simple/2, [], string:tokens(Expression, " ")).

simple("+", [Operand1,Operand2|Rest]) -> [Operand1+Operand2|Rest];
simple("-", [Operand1,Operand2|Rest]) -> [Operand1-Operand2|Rest];
simple("*", [Operand1,Operand2|Rest]) -> [Operand1*Operand2|Rest];
simple("/", [Operand1,Operand2|Rest]) -> [Operand1/Operand2|Rest];
simple(Val, EvaluationStack) -> [list_to_integer(Val)|EvaluationStack].
