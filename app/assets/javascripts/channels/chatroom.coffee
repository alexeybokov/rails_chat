App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    @install
    console.log('Connected')

  disconnected: ->
    console.log('Disconnected')

  received: (data) ->
    $('#message-container').append data.modified_message
    scroll_bottom();

  update: ->
    if @documentIsActive then @appear() else @away()
    return

  install: ->
    window.addEventListener 'focus', @update
    window.addEventListener 'blur', @update
    document.addEventListener 'turbolinks:load', @update
    document.addEventListener 'visibilitychange', @update
    return

  appear: ->
    @perform 'appear', appearing_on: @appearingOn
    return

  perform: ->

  appearingOn: ->

