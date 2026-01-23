# Copyright 2025 REChain Team
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="REChain - Decentralized Matrix Messenger"
HOMEPAGE="https://online.rechain.network"
SRC_URI="https://github.com/rechain/rechain/releases/download/${PV}/${PN}-${PV}-linux-x86_64.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

DEPEND="x11-libs/gtk+:3 dev-libs/openssl"
RDEPEND="${DEPEND}"

RESTRICT="strip"

src_unpack() {
    default
    mv "${WORKDIR}/${PN}-${PV}" "${S}" || die
}

src_install() {
    insinto /opt/${PN}
    doins -r data lib rechain_new
    fperms 755 /opt/${PN}/rechain_new
    
    dosym ../opt/${PN}/rechain_new /usr/bin/${PN}
    
    doicon com.rechain.online.svg
    domenu REChain.desktop
}

pkg_postinst() {
    elog "REChain has been installed to /opt/${PN}"
    elog "Run 'rechain' to start the application"
}
