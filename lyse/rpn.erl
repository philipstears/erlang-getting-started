-module(rpn).
-export([simple/1]).

simple("") ->
    error("No expression provided");

simple(Expression) ->
    simple(string:tokens(Expression, " "), []).

simple([], [Result]) ->
    Result;

simple([Latest|Rest], Stack) ->
    {NewStack, Result} = case Latest of
                 "+" -> simple_op(Stack, fun(X,Y) -> X + Y end);
                 "-" -> simple_op(Stack, fun(X,Y) -> X - Y end);
                 "*" -> simple_op(Stack, fun(X,Y) -> X * Y end);
                 "/" -> simple_op(Stack, fun(X,Y) -> X / Y end);
                 V   -> {Stack, list_to_integer(V)}
             end,
    simple(Rest, [Result|NewStack]).

simple_op([Operand1, Operand2|Rest], Operator) ->
    {Rest, Operator(Operand1, Operand2)}.
