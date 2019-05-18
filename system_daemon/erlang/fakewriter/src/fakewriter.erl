%%%-------------------------------------------------------------------
%%% @author Amado Elga <rosemary@scuba>
%%% @copyright (C) 2019, Amado Elga
%%% @doc
%%% This module does nothing at all. It is purpose is only
%%% to experience running a FreeBSD System Daemon in the background
%%% And this program will be the blind-mouse that shows us that
%%% the system daemon has been correctly configured and automatically
%%% started at FreeBSD system boot time. Moreoever, we could see that
%%% it has a reachable PID.
%%% @end
%%%-------------------------------------------------------------------
-module(fakewriter).
-export([process/1]).

-define(SLEEP_MILLIS, 5000).

process([N]) ->
    Integer = list_to_integer(atom_to_list(N)),
    loop(Integer).

loop(8) ->
    io:format("8 is sleeping for ~p~n", [?SLEEP_MILLIS]),
    receive
	stop ->
	    io:format("Received stop command. Process is stopped~n", []),
	    init:stop()
    after ?SLEEP_MILLIS ->
	    io:format("8 won't get done~n", []),
	    loop(8)
    end;
loop(Any) ->
    io:format("~p won't help!~nProcess is stopped~n", [Any]),
    init:stop().
