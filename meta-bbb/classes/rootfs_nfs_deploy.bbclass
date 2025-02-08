# Set custom rootfs deploy directory with machine-specific subdirectory
ROOTFS_NFS_DEPLOY_DIR ??= "${ROOTFS_NFS}"

# Ensure rootfs is cleaned and copied **after the full build**
do_populate_lic_deploy:append() {
    bb.build.exec_func('nfs_rootfs_deploy', d)
}

# Function to extract the newly built rootfs to the target directory
python nfs_rootfs_deploy() {
    import shutil
    import os
    import tarfile
    import subprocess

    machine = d.getVar('MACHINE')
    deploy_dir = d.getVar('DEPLOY_DIR_IMAGE')
    rootfs_nfs_dir = d.getVar('ROOTFS_NFS_DEPLOY_DIR')
    image_name = d.getVar('IMAGE_BASENAME')

    rootfs_tarball = os.path.join(deploy_dir, f"{image_name}-{machine}.rootfs.tar.xz")

    # Resolve symlink properly
    rootfs_tarball = os.path.realpath(rootfs_tarball)

    if not os.path.exists(rootfs_tarball):
        bb.warn(f"❌ Rootfs tarball not found: {rootfs_tarball}")
        return

    bb.note(f"✅ Extracting rootfs from {rootfs_tarball} to {rootfs_nfs_dir}")

    # Create a temporary directory to extract the rootfs
    tmp_rootfs = os.path.join(deploy_dir, "tmp_rootfs")
    os.makedirs(tmp_rootfs, exist_ok=True)

    # Extract rootfs.tar.xz into tmp_rootfs
    with tarfile.open(rootfs_tarball, "r:xz") as tar:
        for member in tar.getmembers():
            # Extract each member manually to ensure overwriting
            tar.extract(member, tmp_rootfs)

    # Extract rootfs tarball to the target directory, forcibly overwriting if necessary
    with tarfile.open(rootfs_tarball, "r:xz") as tar:
        for member in tar.getmembers():
            # Extract each member manually to ensure overwriting
            tar.extract(member, rootfs_nfs_dir)

    # Sync with rsync to ensure complete mirror, including deletions
    rsync_cmd = f"rsync  -a --delete --ignore-times {tmp_rootfs}/ {rootfs_nfs_dir}/"
    subprocess.run(rsync_cmd, shell=True, check=True)

    # Cleanup temporary extraction directory
    shutil.rmtree(tmp_rootfs, ignore_errors=True)

    #bb.warn(f"✅ Rootfs extracted successfully to {rootfs_nfs_dir}")
}

