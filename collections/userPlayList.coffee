@UserPlayLists = new Mongo.Collection("userPlayLists")

@UserPlayLists.allow {
  "insert" : (userId,doc)-> !!userId
  "update" : (userId,doc)-> !!userId
}