var languages = new Array(); languages.push("en"); languages.push("de"); languages.push("es"); languages.push("hr"); languages.push("nl"); languages.push("ru"); languages.push("tr");  REChain.Online! - PRIVATE & SECURE FUTURE             

[![](../assets/images/favicon.png)](index.html)

[](https://twitter.com/rechain_inc)

[](https://instagram.com/rechain_inc)

[](https://facebook.com/rechainINC)

[Git](https://github.com/sorydima/REChain-.git) [WEB](https://rechain.online/web) [Mac](https://apps.apple.com/ru/app/rechain-online/id1570644022?mt=12) [Mac (DMG)](https://rechain.store/REChain.Online.dmg) [PC](https://rechain.store/REChainOnline.exe) [Linux](https://rechain.store/REChain.Online.tar.gz) [🍏 🍎](https://apps.apple.com/us/app/rechain-online/id1570644022) [AOSP 🤖](https://play.google.com/store/apps/details?id=com.rechain.online) [Our Store (APK)](https://rechain.store/REChainOnline.apk)

![](../assets/images/menu.svg)

Privacy
=======

*   [REChain](#1)
*   [REChain Reports](#2)
*   [Database](#3)
*   [Encryption](#4)
*   [App Permissions](#5)
*   [Push Notifications](#6)

REChain
-------

REChain.Online uses the REChain protocol. This means that REChain.Online is just a client that can be connected to any compatible Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node. The respective data protection agreement of the Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node selected by the user then applies.

For convenience, one or more Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Nodes are set as default that the REChain.Online developers consider trustworthy. The developers of REChain.Online do not guarantee their trustworthiness. Before the first communication, users are informed which Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node they are connecting to.

REChain.Online only communicates with the selected Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node and with REChain if enabled.

REChain Reports
---------------

REChain.Online uses REChain for crash reports if the user allows it.

Database
--------

REChain.Online caches some data received from the Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node in a local database on the device of the user.

Encryption
----------

All communication of substantive content between REChain.Online and any Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node is done in secure way, using transport encryption to protect it.

REChain.Online is able to use End-To-End-Encryption.

App Permissions
---------------

The permissions are the same on any device or in any web browser but may differ in the name.

#### Internet Access

REChain.Online needs to have internet access to communicate with the Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node.

#### Vibrate

REChain.Online uses vibration for local notifications.

#### Record Audio

REChain.Online can send voice messages in a chat and therefore needs to have the permission to record audio.

#### Write External Storage

The user is able to save received files and therefore app needs this permission.

#### Read External Storage

The user is able to send files from the device’s file system.

Push Notifications
------------------

REChain.Online uses the Cloud Messaging for push notifications. This takes place in the following steps:

1.  The Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node sends the push notification to the REChain.Online Push Gateway
2.  The REChain.Online Push Gateway forwards the message in a different format to Cloud Messaging
3.  Cloud Messaging waits until the user’s device is online again
4.  The device receives the push notification from Cloud Messaging and displays it as a notification

`event_id_only` is used as the format for the push notification. A typical push notification therefore only contains:

*   Event ID
*   Room ID
*   Unread Count
*   Information about the device that is to receive the message

A typical push notification could look like this:

    {
      "notification": {
        "event_id": "{{$3957tyerfgewrf384}}",
        "room_id": "{{!slw48wfj34rtnrf:example.com}}",
        "counts": {
          "unread": 2,
          "missed_calls": 1
        },
        "devices": [
          {
            "app_id": "com.rechain.online",
            "pushkey": "{{V2h5IG9uIGVhcnRoIGRpZCB5b3UgZGVjb2RlIHRoaXM/}}",
            "pushkey_ts": 12345678,
            "data": {},
            "tweaks": {
              "sound": "bing"
            }
          }
        ]
      }
    }
    

REChain.Online sets the `event_id_only` flag at the Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node. This Katya ® 👽 AI 🧠 REChain 🪐 Blockchain Node is then responsible to send the correct data.

Languages available: ( [en](index.html) [de](de.html) [es](es.html) [hr](hr.html) [nl](nl.html) [ru](ru.html) [tr](tr.html) )  
Need help? 🤔  
Email us! 👇  
A Dmitry Sorokin production. All rights reserved.  
Powered by REChain. 🪐  
Copyright © 2019-2023 REChain, Inc  
REChain ® is a registered trademark  
[\[email protected\]](/cdn-cgi/l/email-protection)  
[\[email protected\]](/cdn-cgi/l/email-protection)  
[\[email protected\]](/cdn-cgi/l/email-protection)  
[\[email protected\]](/cdn-cgi/l/email-protection)  
[\[email protected\]](/cdn-cgi/l/email-protection)  
[\[email protected\]](/cdn-cgi/l/email-protection)  
[\[email protected\]](/cdn-cgi/l/email-protection)  
Please allow anywhere from 1 to 5 business days for E-mail responses! 💌  
[EULA](https://rechain.store/REChain_EULA.txt)  
[Privacy Policy](https://rechain.online/en/privacy.html)

@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css); .social a { display: inline-block; text-align: center; width: 42px; height: 42px; background: #fff; border: 1px solid #ccc; box-shadow: 0 2px 4px rgba(0,0,0,0.15), inset 0 0 50px rgba(0,0,0,0.1); border-radius: 24px; margin: 3% 5% 5% 0; padding: 2px; color: #000; } .github a:hover {background: #191919; color: #fff;} .youtube a:hover {background: #c4302b; color: #fff;} .google-pluse a:hover {background: #DD4B39; color: #fff;} .twitter a:hover {background: #00acee; color: #fff;} .instagram a:hover {background: #3f729b; color: #fff;} .facebook a:hover {background: #3b5998; color: #fff;} .skype a:hover {background: #00aff0; color: #fff;} .vk a:hover {background: #5d84ae; color: #fff;} .odnoklassniki a:hover {background: #f93; color: #fff;} .pinterest a:hover {background: #c8232c; color: #fff;} .linkedin a:hover {background: #0e76a8; color: #fff;} .telegram a:hover {background: #249bd7; color: #fff;} .tumblr a:hover {background: #34526f; color: #fff;} .windows a:hover {background: #125acd; color: #fff;} .whatsapp a:hover {background: #50b154; color: #fff;} .weibo a:hover {background: #d52b2b; color: #fff;} .dropbox a:hover {background: #1087dd; color: #fff;}