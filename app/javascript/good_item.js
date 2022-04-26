function post (){
  const submit = document.getElementById("favorite-btn");
  submit.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `${location.pathname}/good_items`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const good_item_count = XHR.response.good_item_count;
      const value = document.getElementById("good_item_count")
      value.innerHTML = `お気に入り ${good_item_count}`
    };
  });
};

window.addEventListener('load',post);