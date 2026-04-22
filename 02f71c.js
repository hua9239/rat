(function () {
    fetch("https://icas.pccu.edu.tw/cfp/ajaxpro/CourseFP.AjaxMethods,App_Code.ashx", {
        "headers": {
            "x-ajaxpro-method": "GetProfileEdit"
        },
        "method": "POST",
        "credentials": "include"
    })
        .then(res => res.text())
        .then(rawText => {
            const inner = rawText.match(/new Ajax\.Web\.DataTable\(([\s\S]*)\)/)[1];

            let depth = 0,
                splitIdx = -1;
            for (let i = 0; i < inner.length; i++) {
                if (inner[i] === '[') {
                    depth++;
                } else if (inner[i] === ']' && --depth === 0) {
                    splitIdx = i;
                    break;
                }
            }

            const columns = JSON.parse(inner.slice(0, splitIdx + 1));
            const rows = JSON.parse(inner.slice(splitIdx + 2));

            const data = Object.fromEntries(columns.map(([name], i) => [name, rows[0][i].trim()]));
            console.log(data);

            for (const [key, value] of Object.entries(data)) {
                console.log(`${key}: ${value}`);
            }
        });
})();