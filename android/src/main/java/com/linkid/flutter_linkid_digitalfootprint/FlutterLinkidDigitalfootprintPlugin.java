package com.linkid.flutter_linkid_digitalfootprint;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.Log;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import com.linkid.digitalfootprint.DigitalFootprint;

import java.util.Map;
import java.util.Objects;

/**
 * FlutterLinkidDigitalfootprintPlugin
 */
public class FlutterLinkidDigitalfootprintPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context context;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_linkid_digitalfootprint");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
//        Log.d("Method", call.method);
        try {
            if (call.method.equals("getPlatformVersion")) {
                result.success("Android " + android.os.Build.VERSION.RELEASE);
            } else if (call.method.equals("initService")) {
                if (call.hasArgument("tenantId")) {
                    String tenantId = call.argument("tenantId");
                    String apiKey = call.argument("apiKey");
                    String url = call.argument("url");
                    DigitalFootprint.initService(context, tenantId, apiKey, url);
                    result.success(true);
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("saveInputEvent")) {
                if (call.hasArgument("data")) {
                    Map<String, Object> data = call.argument("data");
                    if (data != null) {
                        DigitalFootprint.saveInputEvent(data);
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("logEvent")) {
                if (call.hasArgument("eventName")) {
                    String eventName = call.argument("eventName");
                    Map<String, Object> data = call.argument("data");
                    if (eventName != null && eventName != "") {
                        DigitalFootprint.logEvent(eventName, data);
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("startScreenFlow")) {
                if (call.hasArgument("screenName")) {
                    String screenName = call.argument("screenName");
                    if (screenName != null && screenName != "") {
                        DigitalFootprint.startScreenFlow(screenName);
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("endScreenFlow")) {
                if (call.hasArgument("screenName")) {
                    String screenName = call.argument("screenName");
                    Map<String, Object> data = call.argument("data");
                    if (screenName != null && screenName != "") {
                        DigitalFootprint.endScreenFlow(screenName, data);
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("setCurrentScreen")) {
                if (call.hasArgument("screenName")) {
                    String screenName = call.argument("screenName");
                    Map<String, Object> data = call.argument("data");
                    if (screenName != null && screenName != "") {
                        DigitalFootprint.setCurrentScreen(screenName, data);
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("setReferralId")) {
                if (call.hasArgument("referralId")) {
                    String referralId = call.argument("referralId");
                    if (referralId != null && referralId != "") {
                        DigitalFootprint.setReferralId(referralId);
                        result.success(true);
                    } else {
                        result.success(false);
                    }
                } else {
                    result.success(false);
                }
            } else if (call.method.equals("setShowLog")) {
                if (call.hasArgument("showLog")) {
                    boolean showLog = call.argument("showLog");
                    DigitalFootprint.setShowLog(showLog);
                    result.success(true);
                } else {
                    result.success(false);
                }
            } else {
                result.notImplemented();
            }
        } catch (Exception e) {
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        context = binding.getActivity().getApplicationContext();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        context = null;

    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        context = binding.getActivity().getApplicationContext();
    }

    @Override
    public void onDetachedFromActivity() {
        context = null;
    }
}
