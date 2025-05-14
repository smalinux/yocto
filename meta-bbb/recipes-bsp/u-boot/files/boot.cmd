###############################################################################
# START: General
###############################################################################

setenv bootdelay 0
saveenv

# END: General
###############################################################################


###############################################################################
# START: NFS & TFTP boot:> run boot_net
###############################################################################

setenv serverip 192.168.0.134
setenv ipaddr 192.168.0.90
setenv image zImage
setenv fdt_file "am335x-boneblack.dtb"
setenv nfsroot "/srv/nfs/bbb,nfsvers=3,port=3048,udp,mountport=3048"
saveenv

## Boot using TFPT & NFS
#######################
setenv boot_net "\
    echo 'Booting from network (TFTP kernel + DTB, NFS rootfs)';\
    echo '---------------------------------------------------------------------';\
    tftpboot "${loadaddr}" "${image}";\
    tftpboot "${fdtaddr}" "${fdt_file}";\
    setenv netargs 'setenv bootargs console=${console} ${optargs} root=/dev/nfs rootwait ip=${ipaddr} nfsroot=${serverip}:${nfsroot},v3,tcp';\
    run netargs;\
    bootz "${loadaddr}" - "${fdtaddr}";
"

## Boot using TFPT & NFS + extra log at boot time
#######################
setenv boot_net_debug "\
    echo 'Booting from network (TFTP kernel + DTB, NFS rootfs + extra logs at boot time)';\
    echo '---------------------------------------------------------------------';\
    tftpboot "${loadaddr}" "${image}";\
    tftpboot "${fdtaddr}" "${fdt_file}";\
    setenv netargs 'setenv bootargs console=${console} ${optargs} root=/dev/nfs rootwait debug loglevel=7 earlyprintk ignore_loglevel initcall_debug nfsrootdebug ip=${ipaddr} nfsroot=${serverip}:${nfsroot},v3,tcp';\
    run netargs;\
    bootz "${loadaddr}" - "${fdtaddr}";
"

## Boot using TFPT & NFS + without any logs at boot time
#######################
setenv boot_net_quiet "\
    echo 'Booting from network (TFTP kernel + DTB, NFS rootfs + without any logs)';\
    echo '---------------------------------------------------------------------';\
    tftpboot "${loadaddr}" "${image}";\
    tftpboot "${loadaddr}" "${image}";\
    tftpboot "${fdtaddr}" "${fdt_file}";\
    setenv netargs 'setenv bootargs console=${console} ${optargs} root=/dev/nfs rootwait ip=${ipaddr} quiet nfsroot=${serverip}:${nfsroot},v3,tcp';\
    run netargs;\
    bootz "${loadaddr}" - "${fdtaddr}";
"

## Boot using TFPT only + take rootfs from sdcard (rauc slots)
#######################
setenv boot_tftp "\
    echo 'Booting from network (TFTP kernel + DTB + take rootfs from sdcard, rauc slots)';\
    echo '---------------------------------------------------------------------';\
    setenv bootargs 'console=${console} ${optargs} root=${bootpart} rw rootfstype=ext4 rootwait fixrtc rauc.slot=${raucslot}';\
    tftpboot "${loadaddr}" "${image}";\
    tftpboot "${fdtaddr}" "${fdt_file}";\
    bootz "${loadaddr}" - "${fdtaddr}";
"

## Adding boot_rauc command for default RAUC SD card boot
#######################
setenv boot_rauc "\
    echo 'Booting with RAUC from SD card';\
    echo '---------------------------------------------------------------------';\
    if mmc dev 0; then\
        if test ! -e mmc 0:2 ${bootdir}/uboot.env; then saveenv; fi;\
        part uuid ${bootdev} uuid;\
        load ${bootdev} ${loadaddr} /boot/zImage;\
        load ${bootdev} ${fdtaddr} /boot/${fdt_file};\
        bootz ${loadaddr} - ${fdtaddr};\
    else\
        echo 'Could not find mmc 0';\
        reset;\
    fi\
"

## Boot Menu
#######################
setenv boot_menu bootmenu
saveenv


# END: NFS & TFTP boot:> run boot_net
###############################################################################


###############################################################################
## start: boot_menu
###############################################################################
# Boot menu configuration
setenv bootmenu_0 "Default Boot (RAUC SD)=run boot_rauc"
setenv bootmenu_1 "TFTP kernel + NFS rootfs=run boot_net"
setenv bootmenu_2 "TFTP kernel + NFS rootfs (verbose)=run boot_net_debug"
setenv bootmenu_3 "TFTP kernel + NFS rootfs (quiet)=run boot_net_quiet"
setenv bootmenu_4 "TFTP kernel + SD rootfs=run boot_tftp"
setenv bootmenu_5 "Shell=echo '=== U-Boot Shell ==='"

# Title and prompt
setenv bootmenu_title "BBB Boot Menu (RAUC)"
setenv bootmenu_prompt "Select boot mode or press Enter for default:"

# Delay in seconds before booting default option
setenv bootmenu_delay -1

saveenv

## END: boot_menu
###############################################################################


###############################################################################
## START: RAUC script
###############################################################################
run findfdt;
test -n "${BOOT_ORDER}" || env set BOOT_ORDER "A B"
test -n "${BOOT_A_LEFT}" || env set BOOT_A_LEFT 3
test -n "${BOOT_B_LEFT}" || env set BOOT_B_LEFT 3
env set bootpart
env set bootdev
env set raucslot

for BOOT_SLOT in "${BOOT_ORDER}"; do
    if test "x${bootpart}" != "x"; then
        # stop checking after selecting a slot
    elif test "x${BOOT_SLOT}" = "xA"; then
        if itest ${BOOT_A_LEFT} -gt 0; then
            setexpr BOOT_A_LEFT ${BOOT_A_LEFT} - 1
            echo "Booting RAUC slot A"
            setenv bootpart "/dev/mmcblk0p2"
            setenv raucslot "A"
            setenv bootdev "mmc 0:2"
        fi
    elif test "x${BOOT_SLOT}" = "xB"; then
        if itest ${BOOT_B_LEFT} -gt 0; then
            setexpr BOOT_B_LEFT ${BOOT_B_LEFT} - 1
            echo "Booting RAUC slot B"
            setenv bootpart "/dev/mmcblk0p3"
            setenv raucslot "B"
            setenv bootdev "mmc 0:3"
        fi
    fi
done

if test -n "${bootpart}"; then
    setenv bootargs "console=${console} ${optargs} root=${bootpart} rw rootfstype=ext4 rootwait fixrtc rauc.slot=${raucslot}"
    saveenv
else
    echo "No valid RAUC slot found. Resetting attempts to 3"
    setenv BOOT_A_LEFT 3
    setenv BOOT_B_LEFT 3
    saveenv
    reset
fi

# Check if requested to run boot_net
if test "${boot_mode}" = "net"; then
    run boot_net
else
    # Normal boot from SD card
    if mmc dev 0; then
        if test ! -e mmc 0:2 ${bootdir}/uboot.env; then saveenv; fi;
        part uuid ${bootdev} uuid
        load ${bootdev} ${loadaddr} /boot/zImage
        load ${bootdev} ${fdtaddr} /boot/${fdt_file}
        bootz ${loadaddr} - ${fdtaddr}
    else
        echo "Could not find mmc 0"
        reset
    fi
fi

## END: RAUC script
###############################################################################
