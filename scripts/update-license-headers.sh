#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
# SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

# SPDX-License-Identifier: AGPL-3.0-or-later

find . -type f \
    -not -path "*/.*" \
    -not -path "*/*.json" \
    -not -path "*/pubspec.lock" \
    -not -path "*/build/*" \
    -not -path "*/assets/*" \
    -not -path "*/lib/l10n/*" \
    -not -path "*/android/*" \
    -not -path "*/ios/*" \
    -not -path "*/linux/*" \
    -not -path "*/macos/*" \
    -not -path "*/LICENSE" \
    -not -path "*/LICENSES/*" \
    -not -path "*/integration_test/synapse/*" \
    -not -path "*/integration_test/data/*" \
    -not -path "*/snap/*" \
    -not -path "*/web/*" \
    -not -path "*/windows/*" \
    -not -path "*/test/metadata/*" \
    -exec reuse annotate \
    --copyright="Dmitry Sorokin" \
    --copyright="Contributors to the REChain" \
    --license="AGPL-3.0-or-later" \
    --year="2017-Present" \
    --merge-copyrights \
    {} +