#!/bin/python3
import os
import shutil
import stat
import sys
import pwd

"""
A minimal Python script that creates the directory /mnt/_OUTPUT, changes
its ownership to the current user, and sets the permissions to drwxrwxr-x
"""

###############################################################################
# Settings
# --------
# Directory path
dir_path = '/mnt/_OUTPUT'
###############################################################################

# Check if the directory already exists
if os.path.exists(dir_path):
    print(f"Directory {dir_path} already exists. Exiting with success.")
    sys.exit(0)  # Return 0 if directory exists

# Create the directory if it doesn't exist
os.makedirs(dir_path, exist_ok=True)

# Get the current user
current_user = os.getlogin()

# Change ownership to the current user (this can be done after directory creation)
shutil.chown(dir_path, user=current_user)
# Get the current user's group (the default group associated with the user)
current_group = pwd.getpwnam(current_user).pw_gid

# Change ownership and group to the current user and group
shutil.chown(dir_path, user=current_user, group=current_group)

# Set permissions to drwxrwxr-x
os.chmod(dir_path, stat.S_IRWXU | stat.S_IRWXG | stat.S_IROTH | stat.S_IXOTH)

print(f"Directory {dir_path} created with correct permissions and ownership.")
