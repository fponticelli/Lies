enum TodoAction {
  Add(text : String);
  Complete(index : Int);
  SetVisibilityFilter(filter : VisibilityFilter);
}
