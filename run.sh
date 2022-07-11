echo -e "\033[0;31m"
docker rm  $(docker stop $(docker ps -a -q --filter ancestor="slurm_db_daemon" --format="{{.ID}}"))
echo -e "\033[0;32m###########_Starting slurm_dbd container_###########\033[0;0m"
docker run --name="slurm_db_daemon" --hostname="slurm_db_daemon" --network slurm-network -v /home/slurm_db_daemon_docker/etc/slurm_conf:/etc/slurm slurm_db_daemon