-module(yuriko).
-export([start/0]).

start() -> 
	io:format("Hello my name is Yuriko.~n"),
	Handle = bitcask:open("yuriko_database", [read_write]),
	N = fetch(Handle),
	store(Handle, N+1),
	io:format("Yuriko has been run ~p times.~n", [N]),
	bitcask:close(Handle),
	init:stop().

store(Handle, N) ->
	bitcask:put(Handle, <<"yuriko_executions">>, term_to_binary(N)).

fetch(Handle) ->
	case bitcask:get(Handle, <<"yuriko_executions">>) of
		not_found -> 1;
		{ok, Bin} -> binary_to_term(Bin)
	end.



