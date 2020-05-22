App.appearence = App.cable.subscriptions.create "AppearenceChannel",
  initialized: ->
    console.log("Init AppearenceChannel")
    @update = @update.bind(this)
    return

  connected: ->
    console.log('AppearenceChannel Connected')
    @install()
    @update()

  disconnected: ->

  received: (data) ->
     console.log('Received', data)

     eventType = data.event
     nickName = data.nickname

     if eventType == 'appear'
       document.getElementById('status_' + nickName).innerHTML = 'Online'
     else
       document.getElementById('status_' + nickName).innerHTML = ''

#       userStatus = document.getElementById('#status_' + nickName)
#       newStatus = document.createTextNode("Online")
#       userStatus.appendChild newStatus

#       notice = document.createElement('p')
#       noticeText = document.createTextNode(nickName + " " + action)
#       notice.appendChild noticeText
#       document.getElementById('messages').appendChild notice

#     $('#user_' + nickName).addClass 'online'

#     scroll_bottom();



#     $('message-container').append data.nickname
#    $('#users-list').append data.modified_message
#  received: (data) ->
#    # Called when there's incoming data on the websocket for this channel

  update: ->
    if @documentIsActive then @appear() else @away()
    return

  install: ->
    window.addEventListener 'focus', @update
    window.addEventListener 'blur', @update
    document.addEventListener 'turbolinks:load', @update
    document.addEventListener 'visibilitychange', @update
    return

  uninstall: ->
    window.removeEventListener 'focus', @update
    window.removeEventListener 'blur', @update
    document.removeEventListener 'turbolinks:load', @update
    document.removeEventListener 'visibilitychange', @update
    return

  appear: ->
    @perform "appear"
    return

  away: ->
    @perform "away"
    return

  documentIsActive: ->
    document.visibilityState == 'visible' and document.hasFocus()
#
#  appearingOn: ->
#    element = document.querySelector('[users-list]')
#    if element then element.getAttribute('users-list') else null

