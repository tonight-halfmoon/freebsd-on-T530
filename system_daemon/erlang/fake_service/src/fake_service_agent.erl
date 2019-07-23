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

%% Proc Callback
-export([init/1]).

-define(FREQUENCY_MILLISECONDS, 3000).
-define(UNIT_MILLIS, millisecond).

%%%===================================================================
%%% API functions
%%%===================================================================

start_link() ->
    start_link(self()).

start_link(_Args) ->
    RegName=fake_service_agent_proc@,
				proc_lib:start_link(?MODULE, init, [[self(), RegName]]).

%%%===================================================================
%%% Proc Callback
%%%===================================================================

init([Parent, ProcRegName]) ->
    register(ProcRegName, self()),
    process_flag(trap_exit, true),
    loop([Parent, ProcRegName]).

%%%===================================================================
%%% Internal functions
%%%===================================================================

loop([Parent, ProcRegName]) ->
    receive
				{'EXIT', Parent, Reason} ->
						io:format("Received Exit from Parent for reason: ~p.~n", [Reason]),
						safely_unregister(ProcRegName),
						exit(Reason);
				stop ->
						ok
		after ?FREQUENCY_MILLISECONDS ->
						SystemTimeInMilliseconds = erlang:system_time(?UNIT_MILLIS),
						io:format("System Time ~p millis.~n", [SystemTimeInMilliseconds]),
						file:write_file("/tmp/fake_service.txt", list_to_binary(lists:map(fun erlang:integer_to_list/1, [SystemTimeInMilliseconds]))),
						file:write_file("/tmp/fake_service.txt", list_to_binary("\n")),
						loop([Parent, ProcRegName])
		end.

safely_unregister(ProcRegName) ->
    case whereis(ProcRegName) of
				undefined ->
						io:format("Service's Process Register Name ~p is not registerd!~n", [ProcRegName]);
				PID ->
						io:format("Found for Service a Registered Name '~p' with PID = '~p'~n", [ProcRegName, PID]),
						io:format("Service's Process Registered Name '~p' will be unregistered.~n", [ProcRegName]),
						unregister(ProcRegName)
    end.
