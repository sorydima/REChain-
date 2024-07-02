Privacy!
=======

*   [REChain ®️ 🪐](#1)
*   [REChain ®️ 🪐 Reports](#2)
*   [Database](#3)
*   [Encryption](#4)
*   [App Permissions](#5)
*   [Push Notifications](#6)

REChain ®️ 🪐!
-------

REChain.Online uses the REChain ®️ 🪐 protocol. This means that REChain.Online is just a client that can be connected to any compatible Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node. The respective data protection agreement of the Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node selected by the user then applies.

For convenience, one or more Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Nodes are set as default that the REChain.Online developers consider trustworthy. The developers of REChain.Online do not guarantee their trustworthiness. Before the first communication, users are informed which Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node they are connecting to.

REChain.Online only communicates with the selected Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node and with REChain ®️ 🪐 if enabled.

REChain ®️ 🪐 Reports!
---------------

REChain.Online uses REChain ®️ 🪐 for crash reports if the user allows it.

Database!
--------

REChain.Online caches some data received from the Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node in a local database on the device of the user.

Encryption!
----------

All communication of substantive content between REChain.Online and any Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node is done in secure way, using transport encryption to protect it.

REChain.Online is able to use End-To-End-Encryption.

App Permissions!
---------------

The permissions are the same on any device or in any web browser but may differ in the name.

#### Internet Access!

REChain.Online needs to have internet access to communicate with the Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node.

#### Vibrate!

REChain.Online uses vibration for local notifications.

#### Record Audio!

REChain.Online can send voice messages in a chat and therefore needs to have the permission to record audio.

#### Write External Storage!

The user is able to save received files and therefore app needs this permission.

#### Read External Storage!

The user is able to send files from the device’s file system.

Push Notifications!
------------------

REChain.Online uses the Cloud Messaging for push notifications. This takes place in the following steps:

1.  The Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node sends the push notification to the REChain.Online Push Gateway
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
    

REChain.Online sets the `event_id_only` flag at the Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node. This Katya ® 👽 AI 🧠 REChain ®️ 🪐 Blockchain Node is then responsible to send the correct data.

Need help? 🤔 Email us! 👇 A Dmitry Sorokin production.
All rights reserved. Powered by REChain ®️ 🪐
Copyright © 2019-2024 REChain, Inc REChain ® is a registered trademark
hr@rechain.email p2p@rechain.email pr@rechain.email sorydima@rechain.email support@rechain.email sip@rechain.email music@rechain.email cfa@rechain.email anti@rechain.email mot_cfa@rechain.email rechainstore@rechain.email models@rechain.email dex@rechain.email email@rechain.email musicdapp@rechain.email pitomec@rechain.email
Please allow anywhere from 1 to 5 business days for E-mail responses! 💌
Our Stats! 👀 At the end of 2023, the number of downloads from the Open-Source Places, Apple AppStore, Google Play Market, and the REChain.Store ✨ exceeded 29 million downloads. 😈 👀
