#!/bin/sh
chmod 600 /etc/slurm/slurmdbd.conf
chmod 700 etc/munge/munge.key
chown slurm:slurm /etc/slurm/slurmdbd.conf
chown 999 /etc/munge/munge.key
su -s /bin/bash -c "munged --key-file /etc/munge/munge.key" munge
slurmdbd -D