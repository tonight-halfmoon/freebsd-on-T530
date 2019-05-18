-module(fakewriter).
-export([process/1]).

-export([init/1]).

-define(SLEEP_MILLIS, 3000).

process([N]) ->
    Integer = list_to_integer(atom_to_list(N)),
    spawn(?MODULE, init, [Integer]).

init(Integer) ->
    run(Integer).

run(Integer) ->
    io:format("Next Integer: ~p~n", [Integer]),
    case Integer of
	8 ->
	    loop([]);
	_ ->
	    ok
    end,
    receive
	_ ->
	    ok
    after 1000 ->
	    init:stop()
    end.

loop([]) ->
    io:format("8 is sleeping for ~p~n", [?SLEEP_MILLIS]),
    receive
    after ?SLEEP_MILLIS ->
	    io:format("8 won't get done~n", []),
	    loop([])
    end.
