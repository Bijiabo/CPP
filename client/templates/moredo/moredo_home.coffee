defaultModes = [
  {
    key : "beforeSleep"
    name : "睡前"
    type : "default"
  },

  {
    key : "inDoor"
    name : "室内"
    type : "default"
  },

  {
    key : "outDoor"
    name : "户外"
    type : "default"
  },

]

Template.moredoHome.helpers {
  playList : ()->
    defaultModeForUserPlayLists = "outDoor"
    audioInformationCursor = AudioInfo.find({}, {limit:10})
    audioInformationIdArray = audioInformationCursor.map (item)->item._id

    #insert default data
    if UserPlayLists.find().count() is 0 and Meteor.user()
      for i in [9..0]
        UserPlayLists.insert {
          userId : Meteor.userId()
          playItemId : audioInformationIdArray[i]
          mode : defaultModeForUserPlayLists
        }


    userPlayListIdArray = UserPlayLists.find({mode : defaultModeForUserPlayLists}).map (item)->item.playItemId
    info = AudioInfo.find({_id : {$in : userPlayListIdArray}})
    info


  mode : ()->
    if UserModes.find().count() == 0 and Meteor.user()
      for modeItem in defaultModes
        modeItem.userId = Meteor.userId()
        UserModes.insert modeItem

    UserModes.find()
}