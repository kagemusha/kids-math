/* globals requirejs,require */
import Em from 'ember';

// TODO: load based on params
Em.keys(requirejs.entries).forEach(function(entry) {
  if ((/\-test/).test(entry)) {
    require(entry, null, null, true);
  }
});
