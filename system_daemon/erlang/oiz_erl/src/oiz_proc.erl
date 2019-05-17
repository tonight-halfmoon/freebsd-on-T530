-module(oiz_proc).
-export([start/1]).
-export([init/0]).

start([Arg]) ->
    io:format("Invoked oiz_proc:start with Args: ~p~n", [Arg]),
    spawn(?MODULE, init, []).

init() ->
    loop().

loop() ->
    receive
	stop ->
	    ok
    after 3000 ->
	    %io:format("writing ~p~n", [date()]),
	    {Y, M, D} = date(),
	    file:write_file("/var/log/oize.out.txt", list_to_binary(lists:map(fun erlang:integer_to_list/1, [Y,M,D]))),
	    file:write_file("/var/log/oize.out.txt", list_to_binary("\n")),
	    loop()
    end.
