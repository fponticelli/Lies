package lies;

using thx.Arrays;
import thx.promise.Future;
import thx.Tuple;

abstract Reduced<State, Action>(Tuple<State, Array<Future<Action>>>) from Tuple<State, Array<Future<Action>>> to Tuple<State, Array<Future<Action>>> {
  @:from
  inline public static function fromState<State, Action>(state : State) : Reduced<State, Action>
    return new Tuple(state, []);

  public var state(get, never) : State;
  public var actions(get, never) : Array<Future<Action>>;

  public function withAction(action : Action) : Reduced<State, Action>
    return withActions([action]);

  public function withActions(actions : Array<Action>) : Reduced<State, Action>
    return withFutures(actions.map(Future.value));

  public function withFuture(action : Future<Action>) : Reduced<State, Action>
    return withFutures([action]);

  public function withFutures(actions : Array<Future<Action>>) : Reduced<State, Action>
    return new Tuple(state, actions.concat(actions));

  inline function get_state()
    return this.left;

  inline function get_actions()
    return this.right;
}
