import consumer from "./consumer"

if(location.pathname.match(/\/items\/\d/)){

consumer.subscriptions.create({
  channel: "CommentChannel",
  item_id: location.pathname.match(/\d+/)[0]
},{
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <div class="comment">
        <div class="upper-comment">
          <div class="comment-user">
            ${data.user.nickname}
          </div>
          <div class="comment-date">
            ${data.comment.created_at.slice(0,10)}
          </div>
        </div>
        <div class="lower-comment">
          <div class="comment-content">
            ${data.comment.text}
          </div>
        </div>
      </div>`
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
  }
});
}