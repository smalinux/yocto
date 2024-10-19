#/bin/python3
import shutil
import sys
path = sys.argv[1]
#
# How to use it: example:
# $ python3 ./available_space.py /home
#

min_desk_size = 100 # aka 100 giga



# -----------------------------------------------------------------------------
def desk_space():
    total, used, free = shutil.disk_usage(path)
    #print("Total: %d GiB" % (total // (2**30)))
    #print("Used: %d GiB" % (used // (2**30)))
    #print("Free: %d GiB" % (free // (2**30)))
    free = free // (2**30)

    if (free < min_desk_size):
        print(sys.argv[0], ": You don't have enough free disk space for poky")
        return sys.stderr

def main():
    ret = desk_space()
    if (ret):
        return sys.stderr

if __name__ == "__main__":
    main()
