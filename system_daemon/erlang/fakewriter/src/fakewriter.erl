-module(fakewriter).
-export([process/1]).

process([N]) ->
    Integer = list_to_integer(atom_to_list(N)),
    run(Integer).

run(Integer) ->
    io:format("Next Integer: ~p~n", [Integer]),
    receive
	_ ->
	    ok
    after 1000 ->
	    init:stop()
    end.
