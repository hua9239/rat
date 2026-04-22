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
        headers: {
            "X-AjaxPro-Method": "SaveProfile"
        },
        "method": "POST",
        "credentials": "include",
        body: JSON.stringify(payload)
    });
})();