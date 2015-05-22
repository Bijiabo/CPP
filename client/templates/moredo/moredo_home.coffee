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
      for modeItem in publicConfig.defaultModes
        modeItem.userId = Meteor.userId()
        UserModes.insert modeItem

    UserModes.find()
}