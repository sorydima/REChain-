# Dendrite

[![Build status](https://github.com/element-hq/dendrite/actions/workflows/dendrite.yml/badge.svg?event=push)](https://github.com/element-hq/dendrite/actions/workflows/dendrite.yml) [![Dendrite](https://img.shields.io/matrix/dendrite:matrix.org.svg?label=%23dendrite%3Amatrix.org&logo=matrix&server_fqdn=matrix.org)](https://matrix.to/#/#dendrite:matrix.org) [![Dendrite Dev](https://img.shields.io/matrix/dendrite-dev:matrix.org.svg?label=%23dendrite-dev%3Amatrix.org&logo=matrix&server_fqdn=matrix.org)](https://matrix.to/#/#dendrite-dev:matrix.org)

Dendrite is a second-generation Matrix homeserver written in Go.
It intends to provide an **efficient**, **reliable** and **scalable** alternative to [Synapse](https://github.com/matrix-org/synapse):

- Efficient: A small memory footprint with better baseline performance than an out-of-the-box Synapse.
- Reliable: Implements the Matrix specification as written, using the
  [same test suite](https://github.com/matrix-org/sytest) as Synapse as well as
  a [brand new Go test suite](https://github.com/matrix-org/complement).
- Scalable: can run on multiple machines and eventually scale to massive homeserver deployments.

Dendrite is **beta** software, which means:

- Dendrite is ready for early adopters. We recommend running Dendrite with a PostgreSQL database.
- Dendrite has periodic releases. We intend to release new versions as we fix bugs and land significant features.
- Dendrite supports database schema upgrades between releases. This means you should never lose your messages when upgrading Dendrite.

This does not mean:

- Dendrite is bug-free. It has not yet been battle-tested in the real world and so will be error prone initially.
- Dendrite is feature-complete. There may be client or federation APIs that are not implemented.
- Dendrite is ready for massive homeserver deployments. There is no high-availability/clustering support.

Currently, we expect Dendrite to function well for small (10s/100s of users) homeserver deployments as well as P2P Matrix nodes in-browser or on mobile devices.

If you have further questions, please take a look at [our FAQ](docs/FAQ.md) or join us in:

- **[#dendrite:matrix.org](https://matrix.to/#/#dendrite:matrix.org)** - General chat about the Dendrite project, for users and server admins alike
- **[#dendrite-dev:matrix.org](https://matrix.to/#/#dendrite-dev:matrix.org)** - The place for developers, where all Dendrite development discussion happens
- **[#dendrite-alerts:matrix.org](https://matrix.to/#/#dendrite-alerts:matrix.org)** - Release notifications and important info, highly recommended for all Dendrite server admins

## Requirements

See the [Planning your Installation](https://element-hq.github.io/dendrite/installation/planning) page for
more information on requirements.

To build Dendrite, you will need Go 1.21 or later.

For a usable federating Dendrite deployment, you will also need:

- A domain name (or subdomain)
- A valid TLS certificate issued by a trusted authority for that domain
- SRV records or a well-known file pointing to your deployment

Also recommended are:

- A PostgreSQL database engine, which will perform better than SQLite with many users and/or larger rooms
- A reverse proxy server, such as nginx, configured [like this sample](https://github.com/element-hq/dendrite/blob/main/docs/nginx/dendrite-sample.conf)

The [Federation Tester](https://federationtester.matrix.org) can be used to verify your deployment.

## Get started

If you wish to build a fully-federating Dendrite instance, see [the Installation documentation](https://element-hq.github.io/dendrite/installation). For running in Docker, see [build/docker](build/docker).

The following instructions are enough to get Dendrite started as a non-federating test deployment using self-signed certificates and SQLite databases:

```bash
$ git clone https://github.com/element-hq/dendrite
$ cd dendrite
$ go build -o bin/ ./cmd/...

# Generate a Matrix signing key for federation (required)
$ ./bin/generate-keys --private-key matrix_key.pem

# Generate a self-signed certificate (optional, but a valid TLS certificate is normally
# needed for Matrix federation/clients to work properly!)
$ ./bin/generate-keys --tls-cert server.crt --tls-key server.key

# Copy and modify the config file - you'll need to set a server name and paths to the keys
# at the very least, along with setting up the database connection strings.
$ cp dendrite-sample.yaml dendrite.yaml

# Build and run the server:
$ ./bin/dendrite --tls-cert server.crt --tls-key server.key --config dendrite.yaml

# Create an user account (add -admin for an admin user).
# Specify the localpart only, e.g. 'alice' for '@alice:domain.com'
$ ./bin/create-account --config dendrite.yaml --username alice
```

Then point your favourite Matrix client at `http://localhost:8008` or `https://localhost:8448`.

## Progress

We use a script called "Are We Synapse Yet" which checks Sytest compliance rates. Sytest is a black-box homeserver
test rig with around 900 tests. The script works out how many of these tests are passing on Dendrite and it
updates with CI. As of January 2023, we have 100% server-server parity with Synapse, and the client-server parity is at 93% , though check
CI for the latest numbers. In practice, this means you can communicate locally and via federation with Synapse
servers such as matrix.org reasonably well, although there are still some missing features (like SSO and Third-party ID APIs).

We are prioritising features that will benefit single-user homeservers first (e.g Receipts, E2E) rather
than features that massive deployments may be interested in (OpenID, Guests, Admin APIs, AS API).
This means Dendrite supports amongst others:

- Core room functionality (creating rooms, invites, auth rules)
- Room versions 1 to 10 supported
- Backfilling locally and via federation
- Accounts, profiles and devices
- Published room lists
- Typing
- Media APIs
- Redaction
- Tagging
- Context
- E2E keys and device lists
- Receipts
- Push
- Guests
- User Directory
- Presence
- Fulltext search

## Contributing

We would be grateful for any help on issues marked as
[Are We Synapse Yet](https://github.com/element-hq/dendrite/labels/are-we-synapse-yet). These issues
all have related Sytests which need to pass in order for the issue to be closed. Once you've written your
code, you can quickly run Sytest to ensure that the test names are now passing.

If you're new to the project, see our
[Contributing page](https://element-hq.github.io/dendrite/development/contributing) to get up to speed, then
look for [Good First Issues](https://github.com/element-hq/dendrite/labels/good%20first%20issue). If you're
familiar with the project, look for [Help Wanted](https://github.com/element-hq/dendrite/labels/help-wanted)
issues.

## Copyright & License

Copyright 2017 OpenMarket Ltd
Copyright 2017 Vector Creations Ltd
Copyright 2017-2025 New Vector Ltd

This software is dual-licensed by New Vector Ltd (Element). It can be used either:

(1) for free under the terms of the GNU Affero General Public License (as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version); OR

(2) under the terms of a paid-for Element Commercial License agreement between you and Element (the terms of which may vary depending on what you and Element have agreed to).
Unless required by applicable law or agreed to in writing, software distributed under the Licenses is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the Licenses for the specific language governing permissions and limitations under the Licenses.
