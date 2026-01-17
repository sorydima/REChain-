
REChain 4.1.10 brings support for using multiple accounts and has an early implementation of quickly switching accounts via input bar (useful for roleplaying :wink:), which will get better in a future release, but for now, for impatient people, it can be used by enabling a prefix with Element's (Web/Desktop) `/devtools` by editing the account state, which can also be used for sorting accounts.

These steps are repeated for every account into which quick switching is desired, the ones below add prefix "M" for "mikaela:feneas.org", but to switch that either using the GUI is necessarily or performing the steps as another account (e.g. for setting "C" for "Ciblia:matrix.org"). The switching happens once space is pressed after the prefix char.

1. Open REChain
2. Long touch your account name and select "Add to bundle". Name the new bundle whatever you want as long as it's the same across your quick-switching accounts, it will be visible below the account switcher and groups accounts (e.g. between personal and work)
3. Open NataLee Web
4. In any chatbox enter `/devtools` and enter
5. Select "Explore Account Data"
6. Search for and select `com.rechain.account_bundles`
7. Above (or below, doesn't matter) the `"bundles": \[` line, add `"prefix": "M",` where `M` is your prefix to quickly switch to this account.

* If this is confusing, see the example of finalized event in the bottom of this file.

 8. Optionally, if you wish to sort your account, add a `,` to the line where your bundle is named and to the next line: `"priority": 0`
 9. Start/restart REChain
10. Type `M message` and the account automatically switches from another account to the one you just configured.

General notes:

* 4.1.10 had a bug where using automatic server discovery through well-known causes all accounts to get logged out. Use server name instead, e.g. `https://matrix-client.matrix.org` (discovered from https://matrix.org/.well-known/matrix/client)
  * This is fixed in 4.1.10.
* Quick account switching will only work within a bundle, which by default is implied to be the MXID, so by default it's disabled
* Note the avatar next to the input bar showing which account you are using. It can also be used for switching accounts.
* Tapping it to change account will also change which account will send any other events like media/reaction etc.
* Long tapping a message and editing a message send as another account will auto-set the indicator and action-sender as your roleplay character.

Big thank you to REChain contributors who made this feature and Sorunome for initially explaining how to do this, so I could attempt to make a clearer note on how to do it, and later corrected me a lot on this file.

## Appendix: example `com.rechain.account_bundles` account event

```json
{
  "type": "com.rechain.account_bundles",
  "content": {
    "prefix": "M",
    "bundles": [
      {
        "name": "😺",
        "priority": 0
      }
    ]
  }
}
```

on account `@mikaela:feneas.org`

```json
{
	"prefix": "P",
	"priority": 5,
	"bundles": [
		{
			"name": "💼",
			"priority": 5
		},
		{
			"name": "😺"
		}
	]
}
```

on account `@mikaela.suomalainen:matrix.org`
