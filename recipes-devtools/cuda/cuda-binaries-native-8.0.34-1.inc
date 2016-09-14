LICENSE = "Proprietary"
LIC_FILES_CHKSUM = "file://usr/share/doc/cuda-repo-ubuntu1404-8-0-local/copyright;md5=e68945343dffbb690e4ee319f64bd25a"

SRC_URI = "http://developer.download.nvidia.com/devzone/devcenter/mobile/jetpack_l4t/006/linux-x64/cuda-repo-ubuntu1404-8-0-local_${PV}_amd64.deb"
SRC_URI[md5sum] = "2752954461c8fbf0033064e4d7fb7362"
SRC_URI[sha256sum] = "78f2baaabae72708c1c082f52dc7740b7db69234a28efe593b60b98bfbce5ed7"

S = "${TMPDIR}/work-shared/cuda-binaries-native-${PV}-${PR}"
B = "${WORKDIR}/build"

inherit native

INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"