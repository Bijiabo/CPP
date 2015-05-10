@AudioInfo = new Mongo.Collection("audioInfo")
#stateLess or flux
@AudioInfoFlowType =  "flux" #"stateLess"

if @AudioInfo.find().count() == 0 && Meteor.isServer
  @AudioInfo.insert {
    name  : "audioName"
    author  : "Audio Author"
    description : "Audio Descrption"
    quality : "Audio Quality"
    influence : {
      "0-1" : {
        sleep : "Influence to child -->> Age : 0-1 , Mode : Sleep"
        normal : "Influence to child -->> Age : 0-1 , Mode : Normal"
      }

      "1-2" : {
        sleep : "Influence to child -->> Age : 1-2 , Mode : Sleep"
        normal : "Influence to child -->> Age : 1-2 , Mode : Normal"
      }
    }
  }

@AudioInfo.allow {
  "insert" : (userId,doc)-> !!userId
  "update" : ()->true
}