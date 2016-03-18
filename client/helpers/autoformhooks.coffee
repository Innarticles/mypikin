AutoForm.hooks setup:
  onSuccess: (operation, result, template) ->
    Router.go 'paymentPlan'
    return
  onError: (operation, error, template) ->
    alert error
    return
AutoForm.hooks updateSetup:
  onSuccess: (operation, result, template) ->
    Router.go 'status'
    return
  onError: (operation, error, template) ->
    alert error
    return
AutoForm.hooks saveToday:
  onSuccess: (operation, result, template) ->
    Router.go 'status'
    # Todo add a toast
    return
  onError: (operation, error, template) ->
    alert error
    return

    
# AutoForm.hooks add:
#   onSuccess: (operation, result, template) ->
#     if Meteor.user().roles[1] == 'admin'
#       Router.go 'dashboard'
#     else
#       Router.go 'items'
#     return
#   onError: (operation, error, template) ->
#     alert error
#     return
# AutoForm.hooks addSelection:
#   onSuccess: (operation, result, template) ->
#     console.log 'selection added'
#     return
#   onError: (operation, error, template) ->
#     alert error
#     return
# AutoForm.hooks addOrders:
#   onSuccess: (operation, result, template) ->
#     #TODO: Remove the every
#     # console.log( this.insertDoc);
#     swal
#       title: 'Your order is being processed!'
#       timer: 4000
#       showConfirmButton: false
#       text: 'You would receive a notification shortly'
#       imageSize: '279x60'
#       imageUrl: '/oncenout.png'
#     Meteor.call 'sendInternalEmail', 'New order from ' + @insertDoc.phone, 'Hurray! We have a new order from ' + @insertDoc.phone + ' residing at ' + @insertDoc.deliveryAddress + '. Item Id is: ' + @insertDoc.itemsIds + '. Item name is: ' + Items.findOne(_id: @insertDoc.itemsIds[0]).itemName
#     content = 'Hurray! We have a new order from ' + @insertDoc.phone + '. ' + 'Names: ' + Items.findOne(_id: @insertDoc.itemsIds[0]).itemName
#     smsOptions = 
#       From: 'oncenout'
#       phone: +233261096308
#       contents: content
#     Router.go 'home'
#     return
#   onError: (operation, error, template) ->
#     alert error
#     return
