-module(tut7).
-export([format_temps/1]).

format_temps(List_of_cities) -> 
    List_of_cities_c = convert_list_to_c(List_of_cities),
    print_temp(List_of_cities_c),
    {Min_city, Max_city} = find_min_and_max_cities(List_of_cities_c),
    print_min_and_max_cities(Min_city, Max_city).

convert_list_to_c([{Name, {f, F}}|Rest]) ->
    Converted_City = {Name, {c, (F-32)*5/9}},
    [Converted_City | convert_list_to_c(Rest)];

convert_list_to_c([City|Rest]) ->
    [City | convert_list_to_c(Rest)];

convert_list_to_c([]) ->
    [].

print_temp([{Name, {c, C}}|Rest]) ->
    io:format("~-15w ~wc~n", [Name, C]),
    print_temp(Rest);

print_temp([]) ->
    ok.

find_min_and_max_cities([City|Rest]) ->
    find_min_and_max_cities(Rest, City, City).

find_min_and_max_cities([{_, {c, C}}=ThisCity|Rest], {_, {c, LowTemp}}=Lowest, {_, {c, HighTemp}}=Highest) ->
    NewLowest = if C < LowTemp ->
                       ThisCity;
                true ->
                       Lowest 
                end,
        
    NewHighest = if C > HighTemp ->
                       ThisCity;
                 true ->
                       Highest
                 end,

    find_min_and_max_cities(Rest, NewLowest, NewHighest);

find_min_and_max_cities([], Lowest, Highest) ->
    {Lowest, Highest}.

print_min_and_max_cities(Min_city, Max_city) ->
    io:format("The minimum is: ~w.~n", [Min_city]),
    io:format("The maximum is: ~w.~n", [Max_city]),
    ok.
