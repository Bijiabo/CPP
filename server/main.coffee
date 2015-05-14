#threads_a_gogo = Npm.require "threads_a_gogo"


#public collections
Meteor.publish "posts",()->Posts.find()
Meteor.publish "sensors",()->sensors.find()
Meteor.publish "audioInfo",()->AudioInfo.find()

Meteor.startup