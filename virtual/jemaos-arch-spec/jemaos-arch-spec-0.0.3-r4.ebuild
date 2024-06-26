# Copyright (c) 2022 Jema Technology.
# Distributed under the license specified in the root directory of this project.

EAPI="7"

DESCRIPTION="empty project"
HOMEPAGE="http://jemakey.com"

LICENSE="BSD"
SLOT="0"
KEYWORDS="*"
IUSE="+dual_boot"

RDEPEND="
    dual_boot? ( chromeos-base/dual-boot-installer )
    chromeos-base/bring-all-cpus-online
    chromeos-base/jemaos-hardware-tuner
    app-arch/zstd
"

DEPEND="${RDEPEND}"
