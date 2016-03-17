Router.map ->
  @route "home",
    path: "/"
    fastRender: true
    onBeforeAction: ->
      console.log "in the home"
      this.next()

  @route "login",
      path: "/login"
      fastRender: false


#   @route "howItWorks",
#     path: "/how_it_works"
#     layoutTemplate: "homeLayout"

#   @route "blog",
#     path: "/blog"
#     layoutTemplate: "homeLayout"
#     waitOn: ->
#       [
#         subs.subscribe 'blogItems'
#       ]
#     data: ->
#       console.log "in route"
#       blogs: BlogItems.find({},{sort: {date: -1}}).fetch()

#   @route "testPage",
#     path: "/testPage"
#     layoutTemplate: "homeLayout"

#   @route "aboutUs",
#     path: "/about"
#     layoutTemplate: "homeLayout"

#   @route "faq",
#     path: "/faq"
#     layoutTemplate: "homeLayout"

#   @route "donate",
#     path: "/donate"
#     layoutTemplate: "homeLayout"

#   @route "sell",
#     path: "/sell"
#     layoutTemplate: "homeLayout"

#   @route "items",
#     path: "/items"
#     fastRender: true
#     onBeforeAction: ->
#       if Meteor.user().roles[0] == 'seller'
#         @render 'items'
#       else
#           Router.go '/shop'
#       @next()
#     layoutTemplate: "homeLayout"
#     waitOn: ->
#       [
#         subs.subscribe 'sellersItems', Meteor.userId()
#         subs.subscribe ('user');
#         subs.subscribe ('selections');
#       ]
#     data: ->
#       items: Items.find({},{sort: {priority: -1}}).fetch()


#   @route "dashboard",
#     path: "/dashboard"
#     onBeforeAction: ->
#       if Meteor.user() == null
#         Router.go 'atSignIn'
#       else
#         if Meteor.user().roles[1] == 'admin'
#           @render 'dashboard'
#         else
#           Router.go '/'
#       this.next()
#     waitOn: ->
#       [
#         subs.subscribe 'brands'
#         subs.subscribe 'items'
#         subs.subscribe ('user');
#         subs.subscribe ('files');
#         subs.subscribe ('selections');
#       ]
#     data: ->
#       items = Items.find({},{sort: {priority: -1}}).fetch()
#       # x = []
#       # for i in items
#       #   picId = i.pictures[0]
#       #   m = Files.findOne(picId)?.itemId
#       #   if !m?
#       #     x.push i
#       # items: x
#       items: items

#   @route "editItem",
#     path: "/items/:_id/edit"
#     waitOn: ->
#       [
#         subs.subscribe 'items'
#       ]
#     data: ->
#       _id = @params._id
#       {
#         item: Items.findOne(_id)
#         pageTitle: 'Edit Item'
#       }

#   @route "buyItem",
#     path: "/buy/:_id"
#     fastRender: true
#     waitOn: ->
#       [
#         subs.subscribe 'items'
#         subs.subscribe 'orders'
#         subs.subscribe 'coupons'
#         subs.subscribe 'couponEarnings'
#         subs.subscribe ('user');
#         subs.subscribe ('files');
#       ]
#     data: ->
#       _id = @params._id
#       {
#         item: Items.findOne(_id)
#         pageTitle: 'Buy Item'
#       }


#   @route "checkout",
#     path: "/checkout"
#     fastRender: true
#     waitOn: ->
#       [
#         subs.subscribe 'items'
#         subs.subscribe 'orders'
#         subs.subscribe 'coupons'
#         subs.subscribe 'couponEarnings'
#         subs.subscribe ('user');
#         subs.subscribe ('files');
#       ]
#     data: ->
#       # _id = @params._id
#       {
#         cartItems: Items.find({'_id': { $in: Session.get("cartItems") || [] }}, {sort: {priority: -1}}).fetch()
#         pageTitle: 'Checkout'
#       }

#   @route 'insertItemForm',
#     path: "/items/new"
#     fastRender: true
#     onBeforeAction: ->
#       if Meteor.user() == null
#         Router.go 'atSignIn'
#       else
#         if Meteor.user().roles[0] == 'seller' || Meteor.user().roles[1] == 'admin'
#           @render 'insertItemForm'
#         else
#           Router.go '/'
#       this.next()
#     waitOn: ->
#       [
#         subs.subscribe('brands')
#         subs.subscribe('items')
#         subs.subscribe ('user')
#         subs.subscribe ('files')
#         subs.subscribe ('selections')
#       ]
#     data: ->
#       { items: Items.find({owner: Meteor.userId()}, sort: priority: -1).fetch() }

#   @route 'insertItemFormAdmin',
#     path: "/dashboard/new"
#     fastRender: true
#     onBeforeAction: ->
#       if Meteor.user() == null
#         Router.go 'atSignIn'
#       else
#         if Meteor.user().roles[1] == 'admin'
#           @render 'insertItemFormAdmin'
#         else
#           Router.go '/'
#       this.next()
#     waitOn: ->
#       [
#         subs.subscribe('brands')
#         subs.subscribe('selections')
#         subs.subscribe('items')
#       ]
#     data: ->
#       { items: Items.find({owner: Meteor.userId()}, sort: priority: -1).fetch() }

#   @route 'selections',
#     path: "/selections"
#     fastRender: true
#     onBeforeAction: ->
#       if Meteor.user() == null
#         Router.go 'atSignIn'
#       else
#         if Meteor.user().roles[1] == 'admin'
#           @render 'selectionAdmin'
#         else
#           Router.go '/'
#       this.next()
#     waitOn: ->
#       [
#         subs.subscribe('selections')
#         subs.subscribe('items')
#       ]
#     data: ->
#       { selections: Selections.find().fetch() }

#   @route 'brands',
#     path: "/brands"
#     onBeforeAction: ->
#       if Meteor.user() == null
#         Router.go 'atSignIn'
#       else
#         if Meteor.user().roles[1] == 'admin'
#           @render 'brandAdmin'
#         else
#           Router.go '/'
#       this.next()
#     waitOn: ->
#       [
#         subs.subscribe('brands')
#       ]
#     data: ->
#       { brands: Brands.find().fetch() }


# Router.route '/items/:_id', (->
#   @render 'show_item'
#   # Render the same template as '/projects' route
# ),
#   name: 'item'
#   fastRender: true
#   waitOn:(paramId) ->
#     _id = @params._id
#     [
#         subs.subscribe 'singleItem', _id
#         subs.subscribe ('user');
#     ]
#   data: ->
#     _id = @params._id
#     item: Items.findOne(_id)

# Router.route '/selection/:_id', (->
#   @render 'selectionPage'
# ),
#   name: 'homeId'
#   onBeforeAction: ->
#     $('#hero12').addClass('animated fadeOutUp')
#     $('#hero12').remove()
#     @next()
#   waitOn: ->
#     _id = @params._id
#     [
#         subs.subscribe ('clientItems')
#         subs.subscribe('selections')
#     ]
#   data: ->
#     _id = @params._id
#     itemLimit = Items.find({selection: _id, ready: true},{sort: {priority: -1}}).count();
#     if itemLimit > 2
#       if Utils.isMobile()
#         itemLimit = ReturnInMultiples itemLimit, 2
#       else
#          itemLimit = ReturnInMultiples itemLimit, 3
#     items: Items.find({selection: _id, ready: true},{limit: itemLimit},{sort: {priority: -1}}).fetch()
#     selection: Selections.findOne(_id)


# Router.route 'category/:_id', (->
#   @render 'categoryPage'
# ),
#   name: 'homeCat'
#   onBeforeAction: ->
#     $('#hero12').addClass('animated fadeOutUp');
#     $('#hero12').remove();
#     Session.set 'category', @params._id
#     @next()
#   waitOn: ->
#     _id = @params._id
#     [
#       subs.subscribe 'clientItems'
#     ]
#   data: ->
#     _id = @params._id
#     itemLimit = Items.find({category: _id, ready: true},{sort: {priority: -1}}).count();
#     if itemLimit > 2
#       if Utils.isMobile()
#         itemLimit = ReturnInMultiples itemLimit, 2
#       else
#          itemLimit = ReturnInMultiples itemLimit, 3
#     items: Items.find({category: _id, ready: true},{limit: itemLimit},{sort: {priority: -1}}).fetch()




# Router.route '/invites', (->
#   @render 'invites'
# ),
#   name: 'invites'
#   fastRender: true
#   waitOn: ->
#     [
#         subs.subscribe 'invites'
#     ]
#   data: ->
#     _id = @params._id
#     items: Invites.find({},{sort: {createdAt: -1}}).fetch()

# Router.route('signup',
#   path: '/signup'
#   template: 'signup'
#   onBeforeAction: ->
#     Session.set 'currentRoute', 'signup'
#     # Clear out the beta token on the /signup route without a token parameter
#     # so if we switch from /signup/:token, the token doesn't copy over.
#     Session.set 'betaToken', ''
#     @next()
# )

# Router.route('signup/:token',
#   path: '/signup/:token'
#   template: 'sellerSignUp'
#   onBeforeAction: ->
#     Session.set 'currentRoute', 'signup'
#     # Tell Iron Router to look at our :token parameter and assign it to a
#     # session variable so that we can access it in our template.
#     Session.set 'betaToken', @params.token
#     @next()
#   data: ->
#     betaToken = @params.token
# )


Router.route 'static_index',
  path: "/testing"
  where: 'server'
  action: ->
    contents = Assets.getText('index.html')
    this.response.setHeader("Content-Type", "text/html")
    this.response.end(contents)