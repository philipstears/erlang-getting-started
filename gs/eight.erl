-module(eight).
-export([getPhrase/0]).

getPhrases() -> [
   "Maybes",
   "Leave me alone",
   "Yes",
   "No",
   "You only ever talk to me when you want something"
].

getPhrase() -> 
    Phrases = getPhrases(),
    Index = 1 + trunc(random:uniform() * (length(Phrases) - 1)),
    lists:nth(Index, Phrases). 
