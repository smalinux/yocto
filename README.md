
## nfsroot

Start the update server:

```
# nfs-export-updater --debug <my-rootfs-image> <exportdir>
nfs-export-updater --debug core-image-bbb
```

This will

- extract the rootfs tar archive to the folder `<exportdir>` if this does not exist yet.
  If the argument is omitted, the default folder name `nfsroot-<image>-${MACHINE}` will be used instead.
- start a unfsd instance on this folder

To update the nfsroot, it's sufficient to just build the recipe in question.
To copy files into the nfsroot, use `nfs-cp`, e.g.
```
nfs-cp ~/nfsroot/myboard fstab /etc/fstab
```


## Feature List
- [x] runqemu support
- [ ] systemd
- [ ] opk (runtime package management)
- [ ] A/B updates
- [ ] Secure Boot
- [ ] barebox bootloader and uboot
- [x] nfsroot: NFS dev cycle
- [ ] Docker
- [ ] kas
- [ ] initramfs
- [ ] umpf
- [ ] licenses/BoM
- [ ] Unit testing or QA

