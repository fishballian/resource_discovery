%%%-------------------------------------------------------------------
%% @doc resource_discovery top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(resource_discovery_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    Child = {resource_discovery, 
             {resource_discovery, start_link, []}, 
             transient, 
             brutal_kill,
             worker,
             [resource_discovery]},
    {ok, { {one_for_all, 0, 1}, [Child]} }.

%%====================================================================
%% Internal functions
%%====================================================================
