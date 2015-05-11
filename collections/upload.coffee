#@Uploads = new Meteor.Collection("uploads")

if Meteor.isClient
  @UploadsStore = new FS.Collection "uploads", {
    stores: [new FS.Store.FileSystem("uploads-original")]
  }


#FS.debug = true

if Meteor.isServer

  path = Npm.require("path")
  filePath = path.resolve(".").split('.meteor')[0]

  @UploadsStore = new FS.Collection "uploads", {
    stores: [new FS.Store.FileSystem("uploads-original", {path: filePath +  "uploads"})]
  }

  UploadsStore.allow {
    insert : (userId, fileObj)->
      true
    update : (userId, fileObj)-> true
    remove : (userId, fileObj)->true
    download : (userId, fileObj)-> true
    fetch: []
  }

  Meteor.publish "uploads", ()->UploadsStore.find()