@subs = new SubsManager()

Router.configure
  routeControllerNameConverter: "camelCase"
  trackPageView: true
  onBeforeAction: ->
    # Redirect to set username if required
    # if Config.username and Meteor.userId() and not Meteor.user().username
    #   @redirect '/setUserName'
    @next()


# Router.waitOn ->
#   subs.subscribe 'user'
#   subs.subscribe 'files'
#   subs.subscribe 'selections'

Router.onAfterAction ->
  if window?
    window.scrollTo(0,0)
  if @ready()
    Meteor.isReadyForSpiderable = true
  # Remove modal
  if window?
    $bd =  $('.modal-backdrop')
    $bd.removeClass('in')
    setTimeout ->
      $bd.remove()
    , 300
#To allow non-logged in users to access more routes, add it in the config file
Router.plugin 'ensureSignedIn', except: [
  'home'
  'static_index'
]

