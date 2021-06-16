import consumer from "./consumer"


 document.addEventListener('turbolinks:load', () =>{
    const room_element = document.getElementById('room-id');
    const room_id = room_element.getAttribute('data-room-id');
    console.log(consumer.subscriptions)

    consumer.subscriptions.subscriptions.forEach((subscription) => {
      consumer.subscriptions.remove(subscription)
    })
 


    //consumer.subscriptions.create({channel: "RoomChannel", room_id: 1}, 
    consumer.subscriptions.create({channel: "RoomChannel", room_id: room_id},{ 

      connected() {
      	console.log("connected to " + room_id)
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        console.log("disconnected from " + room_id)


    // Called when the subscription has been terminated by the server
     },

      received(data) {
    // Called when there's incoming data on the websocket for this channel
      const user_element = document.getElementById('user-id');
      const user_id = Number(user_element.getAttribute('data-user-id'));

      let html;

      if (user_id === data.message.user_id) {
        html = data.mine}
      else {
        html = data.theirs
      }

      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + html
      /*s


      let html;
      const user_id = Number($("#user_id").attr("data_user_id"));
      const data_user_id = Number(data.message.user_id);
      if(user_id === data_user_id)
      {
        html = data.mine;
      }
      else
      {
        html = data.theirs;
      }
      const messages = document.getElementById("messages");
      messages.innerHTML =  messages.innerHTML + html;
      var scroll=$('#messages');
      scroll.animate({scrollTop: scroll.prop("scrollHeight")});
      */
    
     }
    });

/*
var submit_messages;

$(document).on('turbolinks:load',function()
{
  var objDiv = document.getElementById("messages");
  objDiv.scrollTop = objDiv.scrollHeight;
  submit_messages();
});

submit_messages = function() {
  $('form').on('submit',function(){
    $('#message_content').on('keyup',function(){
      if (event.keyCode === 13)
      {
        event.target.value = "";
        event.preventDefault();
      }
    })
  });
}
*/

})