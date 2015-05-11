Meteor.subscribe "uploads"

Template.audioInformationImport.onCreated = ()->

Template.audioInformationImport.helpers {
  log : ()-> console.log this

  hasPermission : ()->userGroupPermission[Meteor.users.findOne(Meteor.userId).profile.group]("audioInformation","manage")

  uploads : ()-> UploadsStore.find()
}

Template.audioInformationImport.events {
  "change #audioinformation-import-data" : (event, template)->
    files = event.target.files
    for file in files
      UploadsStore.insert file, (error, fileObject)->
        if error
          console.log error
        else
          console.log fileObject
}
