#threads_a_gogo = Npm.require "threads_a_gogo"
fs = Npm.require "fs"
path = Npm.require('path')
uploadDocumentPath = path.resolve(".").split('.meteor')[0]+"uploads/"

Meteor.methods {
  helloWorld : () -> "hello,world!"

#获取用户播放列表
  getPlayList : (mode) ->
    if !mode then mode="inDoor"

    if Meteor.user()
      if UserPlayLists.find({userId : Meteor.userId()}).count() is 0
        audioInformationCursor = AudioInfo.find({}, {limit:10})
        audioInformationIdArray = audioInformationCursor.map (item)->item._id
        for i in [9..0]
          UserPlayLists.insert {
            userId : Meteor.userId()
            playItemId : audioInformationIdArray[i]
            mode : mode
          }

      userPlayListIdArray = UserPlayLists.find({
        mode : mode
        userId : Meteor.userId()
      }).map (item)->item.playItemId
      info = AudioInfo.find({_id : {$in : userPlayListIdArray}})
      info.fetch()
    else
      []

# 获取用户模式
  getModeList : ()->
    if Meteor.user()
      if UserModes.find().count() is 0
        for modeItem in publicConfig.defaultModes
          modeItem.userId = Meteor.userId()
          UserModes.insert modeItem

      UserModes.find {userId : Meteor.userId()}
      .fetch()
    else
      []
      

# 导入数据至数据库
  importAudioInformationData : ()->
    console.log "import audio information data"
    dataItem = UploadsStore.findOne({},{sort : {"_id":"desc"}})
    fileName = dataItem.copies["uploads-original"].key
    filePath = uploadDocumentPath+""+fileName
    if fs.existsSync filePath
      data = fs.readFileSync filePath, "utf-8", "r"
      data = JSON.parse data

      insertIdArray = for item in data
        AudioInfo.insert  item, (error,id)->
          if error is null
            UploadsStore.remove {_id : dataItem._id}

      {
        error : false
        data : {
          insertIdArray : insertIdArray
        }
      }

    else
      {
        error : true
        data : undefined
      }

}

Meteor.startup