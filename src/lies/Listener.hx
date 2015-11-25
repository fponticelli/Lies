package lies;

@:callable
abstract Listener<State, Action>(ListenerImpl<State, Action>) from ListenerImpl<State, Action>  to ListenerImpl<State, Action> {
  @:from
  inline public static function fromPingFunction<State, Action>(f : Void -> Void) : Listener<State, Action>
    return function(_, _, _) f();

  @:from
  inline public static function fromStateFunction<State, Action>(f : State -> Void) : Listener<State, Action>
    return function(state, _, _) f(state);

  @:from
  inline public static function fromActionFunction<State, Action>(f : Action -> Void) : Listener<State, Action>
    return function(_, _, action) f(action);
}

typedef ListenerImpl<State, Action> = State -> State -> Action -> Void;
