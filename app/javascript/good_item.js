function create (){
  const submit = document.getElementById("favorite-btn");
  submit.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", form.action, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if( XHR.response.judge == "false" ){
        destroy(formData, XHR)
        return;
      };
      const value = document.getElementById("good_item_count")
      value.innerHTML = `お気に入り ${XHR.response.goodItemCount}`
    };
  });
};

function destroy(formData, XHR){
  XHR.open("DELETE", `/items/${XHR.response.itemId}/good_items/${XHR.response.goodItemId}`, true);
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    const value = document.getElementById("good_item_count")
    value.innerHTML = `お気に入り ${XHR.response.goodItemCount}`
  };
};

window.addEventListener('load',create);

