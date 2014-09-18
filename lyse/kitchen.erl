-module(kitchen).
-compile(export_all).

fridge1() ->
    receive
        {From, {store, Food}} ->
            From ! {self(), ok},
            fridge1();
        {From, {take, Food}} ->
            From ! {self(), not_found},
            fridge1();
        terminate ->
            ok
    end.

fridge2(FoodList) ->
    receive
        {From, {store, Food}} ->
            From ! {self(), ok},
            fridge2([Food|FoodList]);
        {From, {take, Food}} ->
            NewFoodList = lists:delete(Food, FoodList),
            TookSomething = NewFoodList /= FoodList,
            Return = case TookSomething of
                         true -> {ok, Food};
                         false -> not_found
                     end,
            From ! {self(), Return},
            fridge2(NewFoodList);
        terminate ->
            ok
    end.

store(Pid, Food) ->
    Pid ! {self(), {store, Food}},
    receive 
        {_, Msg} -> Msg
    end.

take(Pid, Food) -> 
    Pid ! {self(), {take, Food}},
    receive
        {_, Msg} -> Msg
    end.
