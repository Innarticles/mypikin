Template.saveToday.events({
	'click .sendSMS': function() {
		// alert("hfeowngoe");
		mycall = Meteor.call('getTextMessage', function(e) {});
		console.log(mycall)
	}
});
