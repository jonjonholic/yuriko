all:
	test -d deps || ../../rebar/rebar get-deps
	../../rebar/rebar compile
	@erl -noshell -pa './deps/bitcask/ebin' -pa './ebin' -s yuriko start

