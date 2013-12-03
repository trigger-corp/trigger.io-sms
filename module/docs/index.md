``sms``: SMS messaging
======================

The ``forge.sms`` namespace allows you to prompt the user to send SMS messages from your app.

##API

!method: forge.sms.send(params, success, error)
!param: params `object` data to pre-fill SMS message with, contains ``body`` which is the content of the message, and ``to`` as either a string or array of phone numbers to send to.
!param: success `function()` callback to be invoked when no errors occur
!description: Send an SMS message, optionally with one or more recipients and a message pre-filled in.
!platforms: iOS, Android
!param: error `function(content)` called with details of any error which may occur

**Example**:

    forge.sms.send({
      body: "Hello, World!",
      to: ["123457869", "328592835"]
    }, function () {
      alert("Message sent");
    });
