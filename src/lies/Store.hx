package lies;

class Store<State, Action> {
  public static function create<State, Action>(reducer : Reducer<State, Action>, initialState : State) {
    return new Store(reducer, initialState);
  }

  var currentState : State;
  var reducer : Reducer<State, Action>;
  var listeners : Array<Listener>;
  function new(reducer : Reducer<State, Action>, initialState : State) {
    currentState = initialState;
    this.reducer = reducer;
    listeners = [];
  }

  public function getState() : State {
    return currentState;
  }

  public function dispatch(action : Action) : Void {
    if(null == action)
      throw new thx.Error('cannot dispatch a null action');
    currentState = reducer(currentState, action, this);
    invokeListeners();
  }

  function invokeListeners() {
    for(listener in listeners.copy()) {
      listener();
    }
  }

  public function subscribe(listener : Listener) : Void -> Void {
    listeners.remove(listener);
    listeners.push(listener);
    return function() {
      listeners.remove(listener);
    }
  }
}
