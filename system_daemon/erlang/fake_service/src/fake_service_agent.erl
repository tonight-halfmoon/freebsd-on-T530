%%%-------------------------------------------------------------------
%%% @author Amado Elga <rosemary@scuba>
%%% @copyright (C) 2019, Amado Elga
%%% @doc
%%%
%%% @end
%%% Created : 22 May 2019 by Amado Elga <rosemary@scuba>
%%%-------------------------------------------------------------------
-module(fake_service_agent).

%% API
-export([start_link/0, start_link/1]).

-export([init/1]).

-include("config.hrl").

start_link() ->
    start_link(self()).

start_link(_Args) ->
    proc_lib:start_link(?MODULE, init, [self()]).

init(Parent) ->
    register(?agent_proc_name, self()),
    process_flag(trap_exit, true),
    loop(Parent).

loop(Parent) ->
    receive
	{'EXIT', Parent, Reason} ->
	    io:format("Received Exit from Parent for reason: ~p.~n", [Reason]),
	    exit(Reason);
	stop ->
	    ok
    after ?FREQUENCY_MILLISEONCDS ->
	    SystemTimeInMilliseconds = erlang:system_time(?unit_millis),
	    file:write_file("/tmp/fake_service.txt", list_to_binary(lists:map(fun erlang:integer_to_list/1, [SystemTimeInMilliseconds]))),
	    file:write_file("/tmp/fake_service.txt", list_to_binary("\n")),
	    loop(Parent)
    end.
