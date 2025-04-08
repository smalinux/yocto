
Build the system image:

    # source env.sh
    $ bitbake core-image-bbb

## nfsroot

Start the update server:

    $ nfs-export-updater --debug core-image-bbb

This will

- extract the rootfs tar archive to the folder `<exportdir>` if this does not exist yet.
  If the argument is omitted, the default folder name `nfsroot-<image>-${MACHINE}` will be used instead.
- start a unfsd instance on this folder

To update the nfsroot, it's sufficient to just build the recipe in question.
To copy files into the nfsroot, use `nfs-cp`, e.g.
```
nfs-cp ~/nfsroot/myboard fstab /etc/fstab
```


## Rauc

### Build and Install The Demo Bundle

To build the bundle, run:

    $ bitbake core-image-bbb
    $ bitbake update-bundle

Copy the generated bundle to the target system via nc, scp or an attached USB stick.

On the target, you can then install the bundle:

    # rauc install /path/to/bundle.raucb

First Flash & Run:

    $ bmaptool copy /path/to/core-image-minimal-bbb.wic.xz /dev/sdX
    $ scp update-bundle-bbb.raucb root@192.168.0.19:/tmp/


Then power-on the board and log in.
To see that RAUC is configured correctly and can interact with the bootloader,
run:

    # rauc status


## Feature List
- [x] runqemu support
- [x] systemd
- [x] Audio Support using ALSA & USB [PR #12](https://github.com/smalinux/yocto/pull/12)
- [ ] eMMC
- [ ] opk (runtime package management)
    - [ ] nginx (http & tftp server)
- [x] Rauc: OTA firware update, A/B updates
- [x] nfsroot: NFS dev cycle
- [ ] Secure Boot
- [ ] barebox layer / uboot layer
- [ ] Docker
    - [ ] CI/CD
- [ ] kas
- [ ] initramfs
- [ ] umpf
- [ ] licenses/BoM
- [ ] testing
    - [ ] Labgrid
    - [ ] Testing/TDD

