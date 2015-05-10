applicationPermissionList = {
  audioInformation : [ "edit", "manage" ]
  manage : [ "manage" ]
  posts : [ "edit", "manage" ]
}

checkPermission = {
  basicEditor : (targetApplication, nowApplication, permission)->
    if targetApplication is nowApplication and permission is "edit" then true else false

  applicationManager :  (targetApplication, nowApplication, permission)->
    if targetApplication is nowApplication and permission in applicationPermissionList[nowApplication] then true else false
}

@userGroupPermission = {
  "member" : ()->false
  "administrator" : ()->true


  # audio information application group
  "audioInformationEditor" : (application , permission)->
    checkPermission.basicEditor(application, "audioInformation", permission)

  "audioInformationManager" : (application , permission)->
    checkPermission.applicationManager application , "audioInformation" , permission

  # post application group
  "postsMember" : (application , permission)->
    checkPermission.basicEditor(application, "posts", permission)

  "postsManager" : (application , permission)->
    checkPermission.applicationManager application , "posts" , permission
}

@userGroup = ()->
  for groupName, groupPermissionFunc of userGroupPermission
    groupName