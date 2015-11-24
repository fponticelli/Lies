package lies;

class Store<State, Action> {
  var currentState : State;
  var reducer : Reducer<State, Action>;
  var listeners : Array<Listener>;
  public function new(reducer : Reducer<State, Action>, initialState : State) {
    currentState = initialState;
    this.reducer = reducer;
    listeners = [];
  }

  public function getState() : State {
    return currentState;
  }

  public function dispatch(action : Action) : Void {
    currentState = reducer(currentState, action);
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

typedef Listener = Void -> Void;
