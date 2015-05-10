Template.audioInformationReplenish.helpers {
  "name" : "audio name"
  "author" : "audio author"
  "type" : "audio type"
  "age" : "audio age"
  "intro" : "audio intro"
}

Template.audioInformationReplenish.events {
  "submit form#replenish" : (event) ->
    event.preventDefault()

    post = {
      name : $(event.target).find('[name=name]').val()
      author : $(event.target).find('[name=author]').val()
      type : $(event.target).find('[name=type]').val()
      age : $(event.target).find('[name=age]').val()
      intro : $(event.target).find('[name=intro]').val()
    }

    post._id = AudioInfo.insert(post)

    console.log(post)
    ###
    if AudioInfoFlowType == "stateLess"
      window.location.reload()
    else
      window.location.href = Meteor.absoluteUrl audioInformationPath+"/soundQuality/"+post._id
    ###
}