# SPDX-FileCopyrightText: 2017-Present Dmitry Sorokin
# SPDX-FileCopyrightText: 2017-Present Contributors to the REChain

# SPDX-License-Identifier: AGPL-3.0-or-later

choco install flutter cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
refreshenv

flutter config --no-analytics
