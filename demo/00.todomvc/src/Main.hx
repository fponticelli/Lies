import lies.Store;
import Reducers.*;
import thx.ReadonlyArray;

class Main {
  static function main() {
    var store = Store.create(todoApp, {
      visibilityFilter : ShowAll,
      todos : ReadonlyArray.empty()
    });

    trace("initial state", store.state);

    var unsubscribe = store.subscribe(function(state) {
      trace(state);
    });

    store.dispatch(Add('Learn about actions'));
    store.dispatch(Add('Learn about reducers'));
    store.dispatch(Add('Learn about store'));
    store.dispatch(Complete(0));
    store.dispatch(Complete(1));
    store.dispatch(SetVisibilityFilter(ShowCompleted));

    unsubscribe();
  }
}
