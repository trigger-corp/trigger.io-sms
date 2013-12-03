forge['sms'] = {
        'send': function (params, success, error) {
                if (params.to && typeof params.to == "string") {
                        params.to = [params.to]
                };
                var data = {
                        body: params.body || "",
                        to: params.to || []
                };
                forge.internal.call("sms.send", data, success, error);
        }
};
