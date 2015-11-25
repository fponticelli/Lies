package lies;

using thx.Arrays;
import thx.promise.Future;
import thx.Tuple;

abstract ReducerValue<State, Action>(Tuple<State, Array<Future<Action>>>) from Tuple<State, Array<Future<Action>>> to Tuple<State, Array<Future<Action>>> {
  @:from
  inline public static function fromState<State, Action>(state : State) : ReducerValue<State, Action>
    return new Tuple(state, []);

  public var state(get, never) : State;
  public var actions(get, never) : Array<Future<Action>>;

  inline function get_state()
    return this.left;

  inline function get_actions()
    return this.right;
}
