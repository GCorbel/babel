//= require jquery
//= require jquery_ujs
//= require jquery.ui.effect-highlight
//= require underscore
//= require backbone
//= require frontend_editor/frontend_editor
//= require frontend_editor/basic_editor
//= require babel
//= require_tree .

$(document).ready(function() {
  FrontendEditor.init()
  Babel.init()
});
