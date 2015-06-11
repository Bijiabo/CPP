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
      ###
      if UserPlayLists.find({ userId : Meteor.userId() , mode : mode}).count() is 0
        audioInformationCursor = AudioInfo.find({}, {limit:10})
        audioInformationIdArray = audioInformationCursor.map (item)->item._id
        for i in [9..0]
          UserPlayLists.insert {
            userId : Meteor.userId()
            playItemId : audioInformationIdArray[i]
            mode : mode
          }
      ###

      userPlayListIdArray = UserPlayLists.find({
        mode : mode
        userId : Meteor.userId()
      }).map (item)->item.playItemId

      info = AudioInfo.find({_id : {$in : userPlayListIdArray}})
      console.log info.length
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

# 获取模式下所有播放列表
  getAllPlayListForMode : (mode) ->
    if !mode then mode = "inDoor"

    AudioInfo.find().fetch()

# 用户添加模式
  addModeByUser : (mode)->
    if Meteor.user()
      data = UserModes.insert {
        userId : Meteor.userId()
        key : "custom"+ new Date()
        name : mode
        type : "custom"
      }

      {
        error : false
        data : data
      }
    else
      {
        error : true
        data : "未登录"
      }

# 用户删除模式
  removeModeByUser : (modeKey)->
    if Meteor.user()
      data = UserModes.remove {
        key : modeKey
        userId : Meteor.userId()
      }

      {
        error : false
        data : data
      }
    else
      {
        error : true
        data : "未登录"
      }

# 用户添加新音频到相应模式下
  addNewAudioForModeByUser : (mode, playItemId)->
    if Meteor.user()
      UserPlayLists.upsert {
          userId : Meteor.userId()
          playItemId : playItemId
          mode : mode
        },
        {
          $set : {
            userId : Meteor.userId()
            playItemId : playItemId
            mode : mode
          }
        },
        true,
        (err,res)->
          return {
            error : err
            res : res
          }

    else
      {
      error : true
      data : "未登录"
      }

# 用户删除相应模式下音频
  removePlayListItemInModeByUser : (mode, playListItemId)->
    if Meteor.user()

      data = UserPlayLists.remove {
        userId : Meteor.userId()
        playItemId : playListItemId
        mode : mode
      }

      console.log data

      {
        error : false
        data : data
      }
    else
      {
        error : true
        data : "未登录"
      }


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