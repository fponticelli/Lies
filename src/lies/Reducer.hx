package lies;

@:callable
abstract Reducer<State, Action>(ReducerImpl<State, Action>) from ReducerImpl<State, Action> to ReducerImpl<State, Action> {
  @:op(A+B)
  public function compose(other : ReducerImpl<State, Action>)
    return function(state, action) {
      return other(this(state, action), action);
    };
}

typedef ReducerImpl<State, Action> = State -> Action -> State;

typedef Next<Action, State> = Action -> State;
