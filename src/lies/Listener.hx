package lies;

@:callable
abstract Listener<State, Action>(ListenerImpl<State, Action>) from ListenerImpl<State, Action>  to ListenerImpl<State, Action> {
}

typedef ListenerImpl<State, Action> = State -> State -> Action -> Void;
