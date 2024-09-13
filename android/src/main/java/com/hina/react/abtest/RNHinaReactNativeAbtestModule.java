
package com.hina.react.abtest;

import android.text.TextUtils;
import android.util.Log;

import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.hina.analytics.abtest.HinaABTest;
import com.hina.analytics.abtest.HinaABTestConfig;
import com.hina.analytics.abtest.OnABTestReceivedData;

import org.json.JSONObject;

public class RNHinaReactNativeAbtestModule extends ReactContextBaseJavaModule {
  private static final String LOGTAG = "HA.RN.ABTest";
  private final ReactApplicationContext reactContext;

  public RNHinaReactNativeAbtestModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNHinaReactNativeAbtest";
  }

  @ReactMethod
  public void init(String url) {
    if (getCurrentActivity() == null) {
      return;
    }
    try {
      if (!TextUtils.isEmpty(url)) {
        // 确保先初始化“海纳嗨数埋点SDK”
        // A/B Testing SDK 初始化
        HinaABTestConfig abTestConfigOptions = new HinaABTestConfig(url);
        HinaABTest.init(getCurrentActivity(), abTestConfigOptions);
      } else {
        Log.i(LOGTAG, "ABTest SDK init failed: url is empty");
      }
    } catch (Exception e) {
      Log.i(LOGTAG, "ABTest SDK init failed:" + e.getMessage());
    }
  }

  @ReactMethod
  public void fetchCacheABTest(ReadableMap params, Promise promise) {
    if (promise == null) {
      return;
    }
    try {
      JSONObject jsonObject = RNUtils.convertToJSONObject(params);
      if (jsonObject != null) {
        String paramName = jsonObject.getString("paramName");
        Object defaultValue = jsonObject.get("defaultValue");
        Object result = HinaABTest.getInstance().fetchCacheABTest(paramName, defaultValue);
        callback(promise, result);
      }
    } catch (Exception e) {
      e.printStackTrace();
      Log.e(LOGTAG, e.toString() + "");
      promise.reject("fetchCacheABTest failed", e);
    }
  }

  @ReactMethod
  public void asyncFetchABTest(ReadableMap params, Promise promise) {
    if (promise == null) {
      return;
    }
    try {
      JSONObject jsonObject = RNUtils.convertToJSONObject(params);
      if (jsonObject != null) {
        String paramName = jsonObject.getString("paramName");
        Object defaultValue = jsonObject.get("defaultValue");
        HinaABTest.getInstance().asyncFetchABTest(paramName, defaultValue, new OnABTestReceivedData<Object>() {
          @Override
          public void onResult(Object result) {
            callback(promise, result);
          }
        });
      }
    } catch (Exception e) {
      e.printStackTrace();
      Log.e(LOGTAG, e.toString() + "");
      promise.reject("asyncFetchABTest failed", e);
    }
  }

  @ReactMethod
  public void fastFetchABTest(ReadableMap params, Promise promise) {
    if (promise == null) {
      return;
    }
    try {
      JSONObject jsonObject = RNUtils.convertToJSONObject(params);
      if (jsonObject != null) {
        String paramName = jsonObject.getString("paramName");
        Object defaultValue = jsonObject.get("defaultValue");
        HinaABTest.getInstance().fastFetchABTest(paramName, defaultValue, new OnABTestReceivedData<Object>() {
          @Override
          public void onResult(Object result) {
            callback(promise, result);
          }
        });
      }
    } catch (Exception e) {
      e.printStackTrace();
      Log.e(LOGTAG, e.toString() + "");
      promise.reject("fastFetchABTest failed", e);
    }
  }

  private void callback(Promise promise, Object result) {
    try {
      if (result instanceof JSONObject) {
        WritableMap map = RNUtils.convertToMap((JSONObject) result);
        if (map != null) {
          promise.resolve(map);
          return;
        }
      }
      promise.resolve(result);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}