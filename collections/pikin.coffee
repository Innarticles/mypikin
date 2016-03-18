@Pikins = new Meteor.Collection('pikins');

Schemas.Pikins = new SimpleSchema
    conceptionDate:
        type:Date

    choiceOfDelivery:
        type: String
        autoform: {
          type: "select",
          options: ->
            [
                {label: "Normal", value: "Normal"},
                {label: "CS", value: "CS"}
            ]
          }
    PaymentInterval:
        type: String
        optional:true
        autoform: {
          type: "select",
          options: ->
            [
                {label: "Daily", value: "Daily"},
                {label: "Weekly", value: "Weekly"}
                {label: "Monthly", value: "Monthly"}
            ]
          }

    invitedNumber:
        type:String
        optional:true

    createdAt: 
        type: Date
        autoValue: ->
            if this.isInsert
                new Date()

    updatedAt:
        type:Date
        optional:true
        autoValue: ->
            if this.isUpdate
                new Date()
    # owner: 
    #     type: String
    #     regEx: SimpleSchema.RegEx.Id
    #     autoValue: ->
    #         if this.isInsert
    #             Meteor.userId()
    #     autoform:
    #         options: ->
    #             _.map Meteor.users.find().fetch(), (user)->
    #                 label: user.emails[0].address
    #                 value: user._id

Pikins.attachSchema(Schemas.Pikins)


Pikins.after.update (userId, doc, fieldNames, modifier, options) ->
  #validation
  if doc.invitedNumber?
      content = 'Hi, you have been invited to contribute to my pikins' + doc.invitedNumber
      #send a message to the buyer
      console.log doc.invitedNumber
      console.log doc
      correctNumber = doc.invitedNumber.replace(/\s+/g, '')
      smsOptions = 
        From: 'MyPikins'
        phone: correctNumber
        contents: content
      Meteor.call 'sendMessage', smsOptions