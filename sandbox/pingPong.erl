-module(pingPong).
-export([start/0,ping/2,pong/0]).

ping(0, PongProcessId) ->
    PongProcessId ! finished;

ping(N, PongProcessId) ->
    PongProcessId ! {ping, self()},

    receive
        pong ->
            io:format("ping received pong~n", [])
    end,

    ping(N - 1, PongProcessId).

pong() ->
    receive
        finished ->
            io:format("pong received finished~n", []);

        {ping, PingProcessId} ->
            io:format("pong received ping~n", []),
            PingProcessId ! pong,
            pong()
    end.

start() ->
    PongProcessId = spawn(pingPong, pong, []),
    spawn(pingPong, ping, [5, PongProcessId]).
