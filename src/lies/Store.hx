package lies;

class Store<State, Action> {
  public static function create<State, Action>(reducer : Reducer<State, Action>, initialState : State) {
    return new Store(reducer, initialState);
  }

  public var state(default, null) : State;

  var reducer : Reducer<State, Action>;
  var listeners : Array<Listener<State, Action>>;
  function new(reducer : Reducer<State, Action>, initialState : State) {
    state = initialState;
    this.reducer = reducer;
    listeners = [];
  }

  public function dispatch(action : Action) : Void {
    if(null == action)
      throw new thx.Error('cannot dispatch a null action');
    var oldState = state;
    var value = reducer(oldState, action);
    state = value.state;
    invokeListeners(state, oldState, action);
    for(future in value.actions)
      future.then(dispatch);
  }

  function invokeListeners(currentState, oldState, action) {
    for(listener in listeners.copy()) {
      listener(currentState, oldState, action);
    }
  }

  public function subscribe(listener : Listener<State, Action>) : Void -> Void {
    listeners.remove(listener);
    listeners.push(listener);
    return function() {
      listeners.remove(listener);
    }
  }
}
