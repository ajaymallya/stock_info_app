import Ember from 'ember';
import config from './config/environment';
import App from './app';

var Router = Ember.Router.extend({
  location: config.locationType
});

export default Router;
