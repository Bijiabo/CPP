Meteor.subscribe "uploads"

Template.audioInformationImport.onCreated = ()->

Template.audioInformationImport.helpers {
  log : ()-> console.log this

  hasPermission : ()->userGroupPermission[Meteor.users.findOne(Meteor.userId).profile.group]("audioInformation","manage")

  uploads : ()-> UploadsStore.find()

  fileData : (url, id)->
    ###
    Meteor.http.get url , (error, result)->
      $("#file-data-textarea-"+id).text JSON.stringify result.data
    ###

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
