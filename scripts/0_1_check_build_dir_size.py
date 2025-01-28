#!/bin/python3
import shutil

build_dir = "/mnt/_OUTPUT"

def check_available_space():
    # Get disk usage statistics for /mnt
    total, used, free = shutil.disk_usage(build_dir)
    # Convert free space to GB
    free_gb = free / (1024 ** 3)

    if free_gb < 100:
        print(f"\033[91mWarning: Available space on /mnt is less than 100 GB ({free_gb:.2f} GB)\033[0m")
        exit(1)
    else:
        print(f"Available space on /mnt is sufficient: {free_gb:.2f} GB")

check_available_space()

