-module(chat).
-export([runChatClient/0]).

runChatClient() -> runChatClientCore(true).

runChatClientCore(true) ->
    ChatLine = getChatLine(),
    Continue = dispatchChatLine(ChatLine),
    runChatClientCore(Continue);

runChatClientCore(false) ->
    exit(bye).

dispatchChatLine(".\n") -> false;

dispatchChatLine(Str) -> 
    io:format(Str),
    true.

getChatLine() ->
        io:get_line("enter things mortal> ").
