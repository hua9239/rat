(function () {
  const payload = {
    dt: {
      Columns: [
        ["URL", "System.String"],
        ["showURL", "System.Int32"],
        ["showEmail", "System.Int32"],
        ["showPhone", "System.Int32"]
      ],
      Rows: [["", "0", "2", "2"]]
    }
  };

  fetch("https://icas.pccu.edu.tw/cfp/ajaxpro/CourseFP.AjaxMethods,App_Code.ashx", {
    method: "POST",
    credentials: "include",
    headers: {
      "Content-Type": "text/plain; charset=UTF-8",
      "X-AjaxPro-Method": "SaveProfile"
    },
    body: JSON.stringify(payload)
  });
})();