do_install_append() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)};    then
        install -d ${D}${sysconfdir}/init.d
        install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
    fi
}

RRECOMMENDS_${PN}_append = " kernel-module-br-netfilter kernel-module-xt-addrtype kernel-module-xt-conntrack"
