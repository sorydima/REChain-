REChain is available in A LOT of App Stores:

- PlayStore (Automatically on commits and on tags)
- F-Droid (Automatically on every tag but needs manually updated version code)
- Flathub (Automatically on tag)
- SnapStore (Automatically on commits and on tags)
- Docker (Automatically on tag)

## Steps for a new release
1. Update the version and bump the version code (necessary for F-Droid)
2. Update the changelog (Snippet autogen: `git log $(git describe --tags --abbrev=0)..HEAD --pretty=format:'- %s %C(bold blue)(%an)%Creset' --no-merges --no-decorate | sort -k2`)
3. Merge all changes into main
4. Publish a new release to iOS testflight - You can use `./scripts/release-ios-testflight.sh` for this
5. Test everything on iOS and Android!
6. Create the new Tag with the version in it -> For version 4.1.2 for example it would be: `v4.1.2`
7. Publish iOS using the web interface from AppStore Connect
