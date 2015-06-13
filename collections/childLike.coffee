@ChildLike = new Mongo.Collection("childLike")

@ChildLike.allow {
  "insert" : (userId,doc)-> !!userId
  "update" : (userId,doc)-> !!userId
}