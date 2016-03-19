Meteor.methods({
	'getTextMessage': function() {
		this.unblock()
		response = HTTP.call("POST",
			'http://testpay.vodafonecash.com.gh/SendSMS.php', {
				params: {
					vendor: '711509',
					amount: '200',
					phone: '0246424340'
				}
			});
		return response
	}
});
