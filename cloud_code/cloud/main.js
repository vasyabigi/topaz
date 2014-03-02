'use strict';

var Pusher = require('cloud/pusher.js');

var pusher = new Pusher({
  appId: '67502',
  key: '83915278656e66d15149',
  secret: 'e24556c7ff65b17b1269'
});

// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define('hello', function(request, response) {
  response.success('Hello world!');
  pusher.trigger('topazes', 'new', request);
});
