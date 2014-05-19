var Router = Ember.Router.extend({
  location: ENV.locationType
});

Router.map(function() {
  this.route("operation-table");
  this.route("count-by");
});

export default Router;
