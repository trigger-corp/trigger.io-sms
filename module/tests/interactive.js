module("forge.sms");

if (forge.is.mobile()) {
	asyncTest("Send sms - no content", 1, function() {
		forge.sms.send({}, function () {
			askQuestion("Were you prompted to send an SMS with no prefilled content?", {
				Yes: function () {
					ok(true, "Success");
					start();
				}, 
				No: function () {
					ok(false, "User claims failure");
					start();
				}
			});
		}, function (e) {
			ok(false, "API call failure: "+e.message);
			start();
		});
	});

	asyncTest("Send sms - content", 1, function() {
		forge.sms.send({to: "1234565789", body: "Hello, world!"}, function () {
			askQuestion("Were you prompted to send an SMS saying 'Hello, world!' to '123456789'?", {
				Yes: function () {
					ok(true, "Success");
					start();
				}, 
				No: function () {
					ok(false, "User claims failure");
					start();
				}
			});
		}, function (e) {
			ok(false, "API call failure: "+e.message);
			start();
		});
	});
}
