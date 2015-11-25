package lies;

@:callable
abstract Reducer<State, Action>(ReducerImpl<State, Action>) from ReducerImpl<State, Action> to ReducerImpl<State, Action> {
  @:op(A+B)
  public function compose(other : ReducerImpl<State, Action>)
    return function(state, action, store) {
      return other(this(state, action, store), action, store);
    };

  @:from
  public static function fromPure<State, Action>(f : State -> Action -> State) : Reducer<State, Action>
    return function(state : State, action : Action, _ : Store<State, Action>)
      return f(state, action);
}

typedef ReducerImpl<State, Action> = State -> Action -> Store<State, Action> -> State;
