Meteor.methods {
  childLike : (playItemId , isLike , scene , age)->
    if Meteor.user()
      insertResult = ChildLike.insert {
        playItemId : playItemId,
        like : isLike,
        scene : scene,
        age : age
      }

      insertResult

    else
      {}
}