App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    console.log('ChatroomChannel Connected')

  disconnected: ->
    console.log('ChatroomChannel Disconnected')

  received: (data) ->
    console.log('Chatroom receive', data)
    $('#message-container').append data.modified_message
    scroll_bottom();
