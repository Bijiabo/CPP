threads_a_gogo = Npm.require "threads_a_gogo"

#public collections
Meteor.publish "posts",()->Posts.find()
Meteor.publish "sensors",()->sensors.find()
Meteor.publish "audioInfo",()->AudioInfo.find()
Meteor.publish "user", ()->
  if this.userId
    Meteor.users.findOne this.userId, {fields : {
      services : false
      createdAt : false
    }}
  else
    null

#user manage
Meteor.publish "userTemp",()->
  if this.userId
    user = Meteor.users.findOne this.userId
    if user.profile.group == "administrator"
      Meteor.users.find {}, {fields : {
        services : false
        createdAt : false
      }}
    else
      null
  else
    null

Meteor.users.allow {
  update : (userId, doc, fields, modifier)->
    if Meteor.user().profile.group is "administrator"
      return true
    else
      return false
}

#set the first user as administrator
Accounts.onCreateUser (options,user)->
  userCount = Meteor.users.find({}).count()
  if options.profile
    if userCount==0 then options.profile.group = "administrator"
    user.profile = options.profile
  return user


Meteor.startup