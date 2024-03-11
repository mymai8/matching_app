import consumer from "./consumer"

if(location.pathname.match(/\/students\/\d/)){
  
  consumer.subscriptions.create({
    channel: "ChatChannel",
    student_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      const html = `
        <div class="chat">
          <p class="user-info">${data.user.nickname}： </p>
          <p>${data.chat.text}</p>
        </div>`
      const chats = document.getElementById("chats")
      chats.insertAdjacentHTML('beforeend', html)
      const chatForm = document.getElementById("chat-form")
      chatForm.reset();
    }
  })
}