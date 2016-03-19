Template.saveToday.helpers
    amountToday: ()->
      getAmountPayableToday()


Template.paymentPlan.helpers
    pikin: () ->
        Pikins.findOne()
Template.saveToday.events
  'click #saveToVCash': (event, template) ->
    # console.log 'click is working'
    console.log (Meteor.call 'vodafoneApi')
    Meteor.call 'vodafoneApi', (err, data) ->
      if err
        console.log err
      if data
        # console.log data
        Session.set 'q', data
      return
    wrapper= document.createElement('div')
    wrapper.innerHTML= Session.get 'q'
    div = template.find('#showStatus')
    # console.log div
    div= wrapper.firstChild
    # console.log div

Template.saveToday.helpers
    pikin: () ->
        Pikins.findOne()

Template.status.helpers
    progress: () ->
        if Payments.findOne()
            Math.ceil(getTheTotalAmountContributed()/getTotalPayable() * 100)
    totalSaved: () ->
      getTheTotalAmountContributed()
    saveXToday: () ->
      getAmountPayableToday()

getAmountPayableToday = ()->
  totalPayable = getTotalPayable();
  console.log getNumberOfPeriods()
  amountToPayNow = Math.ceil (totalPayable/getNumberOfPeriods())

getTotalPayable = ()->
    delivery = Pikins.findOne()?.choiceOfDelivery
    potentialAMount = if (delivery == "Normal") then 500 else 1000

getNumberOfPeriods = ()->
    if Pikins.findOne()
        birthDate = moment(Pikins.findOne()?.conceptionDate)
        createdDate = moment(Pikins.findOne()?.createdAt)
        intervalType =  Pikins.findOne()?.PaymentInterval
        if intervalType == 'Daily'
            numberOfPeriods = birthDate?.diff(createdDate, 'days')
        else
            if intervalType == 'Weekly'
               numberOfPeriods = birthDate?.diff(createdDate, 'weeks')
            else
                numberOfPeriods = birthDate?.diff(createdDate, 'monthly')

getTheTotalAmountContributed = ()->
    total = 0
    Payments.find().map (payment) ->
        total += payment.amount
    total

vodafoneAPi = ()->
  console.log 'in the api'

  HTTP.call 'POST', 'http://testpay.vodafonecash.com.gh', { params:
    username: '711509'
    password: 'hackathon2'
    token: 'abc1234'
    amount: '2' }, (error, result) ->
    if !error
      console.log result
    return
