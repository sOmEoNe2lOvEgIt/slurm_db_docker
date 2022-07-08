#!/bin/sh
chown 999 /etc/munge/munge.key
su -s /bin/bash -c "munged --key-file /etc/munge/munge.key" munge
slurmdbd -D