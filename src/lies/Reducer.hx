package lies;

import haxe.ds.Option;
import thx.promise.Future;
import thx.Tuple;

@:callable
abstract Reducer<State, Action>(ReducerImpl<State, Action>) from ReducerImpl<State, Action> to ReducerImpl<State, Action> {
  @:from
  inline public static function fromPure<State, Action>(f : State -> Action -> State) : Reducer<State, Action>
    return function(state : State, action : Action) : Reduced<State, Action>
      return new Tuple(f(state, action), []);

  @:op(A+B)
  public function compose(other : ReducerImpl<State, Action>) : Reducer<State, Action>
    return function(state, action) {
      var t1 = this(state, action),
          t2 = other(t1.state, action);
      return new Tuple(t2.state, t1.actions.concat(t2.actions));
    };
}

typedef ReducerImpl<State, Action> = State -> Action -> Reduced<State, Action>;
