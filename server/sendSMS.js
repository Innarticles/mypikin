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
    // 'sendConfirmationSMS': function() {
    //   this.unblock()
    //   var e, result;
    //   this.unblock();
    //   console.log('in sendMessage');
    //   try {
    //     result = HTTP.call('GET', 'https://api.smsgh.com/v3/messages/send?', {
    //       params: {
    //         From: smsOptions.From,
    //         To: '0246424340',
    //         Content: 'smsOptions.contents',
    //         ClientId: 'vradbyxu',
    //         ClientSecret: 'ypaolptq',
    //         RegisteredDelivery: true
    //       }
    //     });
    //     console.log('tried sending');
    //     return true;
    //   } catch (_error) {
    //     e = _error;
    //     console.log(e);
    //     return false;
    //   }
    // }
});
