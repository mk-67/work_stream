const buildHTML = (XHR) => {
  const item = XHR.response.memo;
  const html = `
    <div class="memo">
      <div class="memo-date">
        投稿日時：${item.created_at}
      </div>
      <div class="memo-content">
        ${item.content}
      </div>
    </div>`;
  return html;
};

function memo (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "channel_id/posts", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      list.insertAdjacentHTML("afterend", buildHTML(XHR));
      formText.value = "";
    };
  });
 };
 
 window.addEventListener('load', memo);