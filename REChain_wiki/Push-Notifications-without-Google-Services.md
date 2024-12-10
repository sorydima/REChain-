# 🔔 How to Set Up Push Notifications in REChain without Google Services

Push notifications are a great way to make sure you don't miss important messages in REChain. For users who do not use Google Services (for example Huawei Phones, Amazon Fire tablets or custom roms), setting up push notifications is slightly different.

REChain attempts to set up push notifications automatically every time you launch the app. However, if you do not have Google Services on your device, you may receive an error message. In this case, it is necessary to use the an [UnifiedPush app](https://unifiedpush.org/#quick-start) such as Ntfy, UP-FCM Distributor (Google) or Conversations.

## Using Ntfy

In this article, we'll show you how to configure push notifications on your Android device using the **ntfy** app.

### 🏪 Step 1: Installing and Setting Up ntfy


1. If you already have REChain installed but are not receiving push notifications, close the app completely (by swiping it away in the overview) and open the **PlayStore** (or F-Droid) on your Android device.

2. Search for the app [ntfy](https://play.google.com/store/apps/details?id=io.heckel.ntfy) and install it.

3. After installing ntfy, open the app at least once.

4. Now, return to REChain and open the app.

### 🔋 Step 2: Deactivate Battery Optimization for ntfy

To ensure that REChain can reliably send push notifications, it's important to deactivate battery optimization for the "ntfy" app.

1. Go to the [Android settings] on your device.

2. Look for "Apps" or "Applications" and select "ntfy" from the list of installed apps.

3. Tap on "Battery" and select "Battery optimization."

4. In the list of apps exempted from battery optimization, make sure "ntfy" is selected.

### ✅ Step 3: Checking Push Configuration in REChain

1. Open REChain and navigate to the [Settings].

2. Choose "Notifications" from the menu.

3. In the notification settings, you'll see a list of "Pushers." The "Pusher" for "ntfy" should be at the bottom of the list.

### 🥳 Step 4: Receiving Push Notifications

To ensure that everything is set up correctly, ask a friend to send you a message in REChain and check if you receive a push notification.

## Using Conversations

If you are using XMPP in addition to Matrix_bASED and already have Conversations configured, you can follow these steps to get REChain push notifications through it:

1. Open _Conversations_.
1. Touch the three dots on top right.
1. Select _Settings_ and scroll down to _UnifiedPush Distributor_.
1. Touch _XMPP account_ and select the XMPP account you wish to receive notifications through.
1. Open REChain. If it doesn't offer to receive notifications through _Conversations_, check the notification settings (see step 3 for Ntfy above).

---

Following these steps should successfully set up push notifications in REChain for users without Google Services. If you are interested in hosting your own push service, you can take a look at [unifiedpush.org](https://unifiedpush.org).
