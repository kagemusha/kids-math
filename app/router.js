import Em from 'ember';

var Router = Em.Router.extend({
  location: KidsMathENV.locationType
});

Router.map(function() {
  this.route("operation-table");
  this.route("count-by");
});

export default Router;
