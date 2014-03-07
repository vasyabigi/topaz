'use strict';

var Pusher = require('cloud/pusher.js'),
  _ = require('underscore'),
  Choice = Parse.Object.extend("Choice");

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

// create choices after saving new question
Parse.Cloud.afterSave('Question', function(request) {
  var question = request.object;
  var queryUsers = new Parse.Query(Parse.User);

  queryUsers.find().then(function(users) {
    _(users).each(function(user) {
      var choice = new Choice();
      choice.save({
        'user': user,
        'question': question
      });
    });
  });
});
