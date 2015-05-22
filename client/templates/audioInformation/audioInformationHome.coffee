formData = [
  {
    label : "this is a label"
    controlTag : "input"
    controlType : "text"
    placeHolder : "this is place holder"
    value : "this is the default value"
  }

  {
    label : "this is a label"
    controlTag : "textarea"
    placeHolder : "this is place holder"
    value : "this is the default value"
  }

]

generateHtml = (data)->
  htmlCache = ""
  for item in data
    switch item.controlTag
      when "input"
        htmlString = '<input value="' + item.value + '" type="' + item.controlType + '">'
        htmlCache += htmlString
      when "textarea" then htmlCache += ("<textarea>" + item.value + "</textarea>")
      else console.log "xxx"
    htmlCache+= "<hr/>"

  $("#test").html htmlCache

Template.audioInformationHome.rendered = () ->
  console.log "audio information home page created."
  generateHtml formData

Template.audioInformationHome.helpers {
  formData : formData

  isInput : (controlTag)-> controlTag is "input"
  isTextArea : (controlTag)-> controlTag is "textarea"
}