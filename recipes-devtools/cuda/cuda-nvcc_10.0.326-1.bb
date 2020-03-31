require cuda-shared-binaries-${PV}.inc

FILES_${PN} = "${prefix}/local/cuda-${CUDA_VERSION}"
FILES_${PN}-dev = ""
INSANE_SKIP_${PN} = "libdir dev-so"

BBCLASSEXTEND = "native nativesdk"
