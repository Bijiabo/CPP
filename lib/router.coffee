Router.configure({
  "layoutTemplate":"layout"
  "loadingTemplate":"loading"
  "notFoundTemplate": "notFound"
  "waitOn":()->
    Meteor.subscribe("sensors")
})

Router.route "postsList", {
  path : "/"
  waitOn : ()->
    Meteor.subscribe("posts")
  action : ()->
    this.render("postsList")

}

requireLogin = ()->
  if !Meteor.user()
    if Meteor.loggingIn() then @render(@loadingTemplate) else @render("accessDenied")
  else
    @next()

#posts
Router.route "/posts/:_id", "name":"postPage", "data":()->Posts.findOne @params._id
Router.route "/posts/:_id/edit", "name":"postEdit", "data":()->Posts.findOne @params._id
Router.route "/submit","name":"postSubmit"

#sensors
Router.route "/sensors/collect", "name":"sensorCollect", "data":()->sensors.findOne()
Router.route "/sensors/client", "name":"sensorClient", "data":()->sensors.findOne()

#audio information
@audioInformationPath = "audioInformation"
Router.route "/"+audioInformationPath, "name":"audioInformationHome"
Router.route "/"+audioInformationPath+"/import", "name":"audioInformationImport"
Router.route "/"+audioInformationPath+"/replenish/:_id?", "name":"audioInformationReplenish"
Router.route "/"+audioInformationPath+"/soundQuality/:_id?", "name":"audioInformationSoundQuality"
Router.route "/"+audioInformationPath+"/important/:_id?", "name":"audioInformationImportant"

#manage
@managePath = "manage"
Router.route "/" + managePath, "name":"manageHome"
Router.route "/" + managePath + "/members", "name":"manageMembers"


Router.onBeforeAction "dataNotFound", "only":"postPage"
Router.onBeforeAction requireLogin, "only":"postSubmit"