#public collections
Meteor.publish "posts",()->Posts.find()

Meteor.publish "sensors",()->sensors.find()

Meteor.publish "audioInfo",()->AudioInfo.find()

Meteor.publish "userModes",() -> UserModes.find { "userId" : this.userId }

Meteor.publish "userPlayLists",() -> UserPlayLists.find { "userId" : this.userId }