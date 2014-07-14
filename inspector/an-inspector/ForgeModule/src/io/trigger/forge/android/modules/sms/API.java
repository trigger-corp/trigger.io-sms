package io.trigger.forge.android.modules.sms;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeLog;
import io.trigger.forge.android.core.ForgeParam;
import io.trigger.forge.android.core.ForgeTask;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;

import com.google.gson.JsonArray;

public class API {
    public static void send(final ForgeTask task, @ForgeParam("to") final JsonArray to, @ForgeParam("body") final String body) {

        StringBuilder recipients = new StringBuilder();
        for (int i = 0; i < to.size(); i++) {
            recipients.append(to.get(i).getAsString());
            if (i < to.size() - 1) {
                recipients.append(", ");
            }
        }

        Intent intent = null;
        if (Build.VERSION.SDK_INT >= 19) {
            intent = new Intent(Intent.ACTION_SENDTO, Uri.parse("smsto:" + recipients.toString()));
        } else {
            intent = new Intent(Intent.ACTION_VIEW);
            intent.setType("vnd.android-dir/mms-sms");
            intent.putExtra("address", recipients.toString());
        }

        try {
            intent.putExtra("sms_body", body);
            ForgeApp.getActivity().startActivity(intent);
            task.success();
        } catch (ActivityNotFoundException e) {
            task.error("SMS not available", "UNAVAILABLE", null);
        }
    }
}
