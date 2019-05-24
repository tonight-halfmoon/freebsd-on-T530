%%% @author Amado Elga <rosemary@scuba>
%%% @copyright (C) 2019, Amado Elga
%%% @doc
%%%
%%% @end
%%% Created : 21 May 2019 by Amado Elga <rosemary@scuba>

-module(fake_service_test).

-export([after_each/1]).

-include("config.hrl").

-include_lib("eunit/include/eunit.hrl").

start_test_() ->
    {
      "When started then service process is registered and running",
      {
	setup,
	fun() -> start_fixture() end,
	fun ?MODULE:after_each/1,
	fun(Actual) ->
		[?_assertEqual(ok, Actual)]
	end
      }
    }.

start_fixture() ->
    Result = application:load(fake_service),
    io:format("Test Load Application Result in: ~p~n", [Result]),
    StartResult = application:start(fake_service),
    io:format("Test Start Application result in: ~p~n", [StartResult]),
    StartResult.

after_each(_) ->
    application:stop(fake_service),
    application:unload(fake_service).
