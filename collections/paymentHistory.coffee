@Payments = new Meteor.Collection('payments');

Schemas.Payments = new SimpleSchema
    amount:
        type:Number

    setupId:
        type:String
        autoValue: ->
            Pikins.findOne()._id

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

Payments.attachSchema(Schemas.Payments)

Payments.before.insert (doc) ->
  Meteor.call 'getTextMessage', (e) ->
  	$("#confirm-transaction-modal").modal("show");
