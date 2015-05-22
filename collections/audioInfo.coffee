@AudioInfo = new Mongo.Collection("audioInfo")
#stateLess or flux
@AudioInfoFlowType =  "flux" #"stateLess"

if @AudioInfo.find().count() == 0 && Meteor.isServer
  for i in [10..1]
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

      resource : [
        {
          url : "http://xxxxxxx"
          usable : true
          speed : "high"
        },

        {
          url : "http://xxxxxxx"
          usable : false
          speed : "high"
        },

        {
          url : "http://xxxxxxx"
          usable : true
          speed : "low"
        }
      ]

    }

@AudioInfo.allow {
  "insert" : (userId,doc)-> !!userId
  "update" : ()->true
}