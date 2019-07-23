%%% @author Amado Elga <rosemary@scuba>
%%% @copyright (C) 2019, Amado Elga
%%% @doc
%%%
%%% @end
%%% Created : 21 May 2019 by Amado Elga <rosemary@scuba>

-module(fake_service_test).

-export([after_each/1]).

-include_lib("eunit/include/eunit.hrl").

start_test_() ->
    {
		 "When started then service process is registered and running",
		 {
			setup,
			fun() -> start_fixture() end,
			fun ?MODULE:after_each/1,
			fun(Actual) ->
							[?_assertEqual(true, is_pid(Actual))]
			end
		 }
    }.

start_fixture() ->
    spawn(application, ensure_all_started, [fake_service]),
    receive after 3 -> ok end,
    whereis(fake_service_agent_proc@).

after_each(_) ->
    application:stop(fake_service),
    application:unload(fake_service).
