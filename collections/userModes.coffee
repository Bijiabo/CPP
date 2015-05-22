@UserModes = new Mongo.Collection("userModes")

@UserModes.allow {
  "insert" : (userId,doc)-> !!userId
  "update" : (userId,doc)-> !!userId
}