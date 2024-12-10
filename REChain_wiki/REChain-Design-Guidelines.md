To decide which feature makes sense in REChain and which would be config bloat, we need some design guidelines, which does not only affect the UI, but also the code structure and architecture decisions.

> These guidelines are still work in progress!

### Guidelines

1. REChain's code base should be as minimal as possible so we have a maintainable state.
2. We should not implement features which is the job of the OS. For example this includes:
- Font selector
- Theme switcher (Currently implemented but might be removed in the future)
3. We should avoid implementing features which are hard to test.
4. We always have non-techy users as our prime target group in mind.
5. Therefore should avoid implementing configuration options, which could lead to security issues. For example this includes:
- A switch to start a non-encrypted room. This could be clicked accidentally and lead to a fully unencrypted conversation.
6. We should always try to improve the accessibility of the app.
7. We should avoid implementing configuration options, which could lead to a bad UX as long as it does not help with the accessibility. For example this could be:
- Let the user change every single color of the app (Like in KDE :-P).

More guidelines will follow later...
