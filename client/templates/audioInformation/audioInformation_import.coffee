Template.audioInformationImport.helpers {
  hasPermission : ()->userGroupPermission[Meteor.users.findOne(Meteor.userId).profile.group]("audioInformation","manage")

  uploads : ()-> Uploads.find()
}

Template.audioInformationImport.events {
  "change #audioinformation-import-data" : (event, template)->
    files = event.target.files
    for file in files
      Uploads.insert file, (error, fileObject)->
        if error
          console.log error
        else
          console.log fileObject
}
