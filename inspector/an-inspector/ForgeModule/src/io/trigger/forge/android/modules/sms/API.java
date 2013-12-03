package io.trigger.forge.android.modules.sms;

import io.trigger.forge.android.core.ForgeApp;
import io.trigger.forge.android.core.ForgeParam;
import io.trigger.forge.android.core.ForgeTask;
import android.content.ActivityNotFoundException;
import android.content.Intent;

import com.google.gson.JsonArray;

public class API {
	public static void send(final ForgeTask task, @ForgeParam("to") final JsonArray to, @ForgeParam("body") final String body) {
		Intent intent = new Intent(Intent.ACTION_VIEW);
		intent.setType("vnd.android-dir/mms-sms");
		try {
			intent.putExtra("sms_body", body);
			StringBuilder toStr = new StringBuilder();
			for (int i = 0; i < to.size(); i++) {
				toStr.append(to.get(i).getAsString());
				if (i < to.size() - 1) {
					toStr.append(", ");
				}
			}
			intent.putExtra("address", toStr.toString());
			ForgeApp.getActivity().startActivity(intent);
			task.success();
		} catch (ActivityNotFoundException e) {
			task.error("SMS not available", "UNAVAILABLE", null);
		}
	}
}
