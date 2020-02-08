CONTAINER_CSV_DIRS ??= ""
CONTAINER_CSV_BASENAME ??= "${PN}"
CONTAINER_CSV_PKGNAME ?= "${CONTAINER_CSV_BASENAME}-container-csv"

stage_container_csv_dirs() {    
    outfile=${D}${sysconfdir}/nvidia-container-runtime/host-files-for-container.d/${PN}.csv
    install -d ${D}${sysconfdir}/nvidia-container-runtime/host-files-for-container.d
    rm -f ${outfile}.tmp
    touch ${outfile}.tmp
    for d in $@; do
	for f in $(cd ${D}$d; ls -1); do
	    # Skip static libraries
	    sfx=`echo $f | cut -c $(expr ${#f} - 1)-`
	    [ "${sfx}" != ".a" ] || continue
	    if [ -d ${D}$d/$f ]; then
	        echo "dir, $d/$f" >> ${outfile}.tmp
	    elif [ -L ${D}$d/$f ]; then
	        echo "sym, $d/$f" >> ${outfile}.tmp
	    elif [ -f ${D}$d/$f ]; then
	        echo "lib, $d/$f" >> ${outfile}.tmp
	    else
		bbwarn "Unrecognized file type for container CSV: $d/$f"
	    fi
	done
    done
    sort -u ${outfile}.tmp > ${outfile}
    chmod 0644 ${outfile}
    rm ${outfile}.tmp
}

populate_container_csv() {
    [ -z "${CONTAINER_CSV_DIRS}" ] || stage_container_csv_dirs ${CONTAINER_CSV_DIRS}
}
do_install[postfuncs] += "populate_container_csv"

PACKAGES =+ "${CONTAINER_CSV_PKGNAME}"
FILES_${CONTAINER_CSV_PKGNAME} = "${sysconfdir}/nvidia-container-runtime"
