if (Meteor.isClient) {
  // counter starts at 0
    Template.masterLayout.rendered = function() {
        if (!window.allScriptsLoaded) {
            var scripts = [
              'js/jquery.mobile-custom.js'
            ];
          }
        }
}

if (Meteor.isServer) {
  Meteor.startup(function () {
    // code to run on server at startup
  });
}


