function create (){
  const submit = document.getElementById("favorite-btn");
  const id = document.getElementById("info_item_id")
  submit.addEventListener('click', (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `${id.value}/good_items`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const good_item_count = XHR.response.good_item_count;
      const value = document.getElementById("good_item_count")
      value.innerHTML = `お気に入り ${good_item_count}`
    };
  });
};
window.addEventListener('load',create);

function destroy(){
  const submitDestroy = document.getElementById("favorite-btn-destroy")
  const id = document.getElementById("info_id")
  const item_id = document.getElementById("info_item_id")
  submitDestroy.addEventListener('click',(e)=>{
    e.preventDefault();
    const form = document.getElementById("form-destroy");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("DELETE", `/items/${item_id.value}/good_items/${id.value}`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const good_item_count = XHR.response.good_item_count;
      const value = document.getElementById("good_item_count")
      value.innerHTML = `お気に入り ${good_item_count}`
    }
  });
};
window.addEventListener('load',destroy);