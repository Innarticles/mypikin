Meteor.methods sendMessage: (smsOptions) ->
  @unblock()
  console.log 'in sendMessage'
  try

    result = HTTP.call('GET', 'https://api.smsgh.com/v3/messages/send?', params:
      From: smsOptions.From
      To: smsOptions.phone
      Content: smsOptions.contents
      ClientId: 'vradbyxu'
      ClientSecret: 'ypaolptq'
      RegisteredDelivery: true)
    console.log 'tried sending'
    return true
  catch e
    # Got a network error, time-out or HTTP error in the 400 or 500 range.
    console.log e
    return false



Meteor.methods vodafoneApi: (params) ->
  @unblock()
  response = ''
  try
    console.log 'in the api'
    response = HTTP.call 'POST', 'http://testpay.vodafonecash.com.gh', { params:
            username: '711509'
            password: 'hackathon2'
            token: 'abc1234'
            amount: '2'}
    return response.content;
  catch e
    # Got a network error, time-out or HTTP error in the 400 or 500 range.
    console.log e
    return false

# Meteor.methods vodafoneApi: (params) ->
#   @unblock()
#   response = ''
#   try
#     console.log 'in the api'
#     HTTP.call 'POST', 'http://testpay.vodafonecash.com.gh', { params:
#       username: '711509'
#       password: 'hackathon2'
#       token: 'abc1234'
#       amount: '2' }, (error, result) ->
#       if !error
#         response = result
#       if error
#         console.log error
#         response = error
#     return response
#   catch e
#     # Got a network error, time-out or HTTP error in the 400 or 500 range.
#     console.log e
#     return false