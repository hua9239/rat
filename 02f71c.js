(function () {
  fetch("https://icas.pccu.edu.tw/cfp/ajaxpro/CourseFP.AjaxMethods,App_Code.ashx", {
    "headers": {
      "x-ajaxpro-method": "GetYYMList"
    },
    "method": "POST",
    "mode": "cors",
    "credentials": "include"
  })
    .then(res => res.json())
    .then(data => console.log(data.value.Welcome.slice(0, 3)));
})();