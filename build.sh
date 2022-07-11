echo -e "\033[0;31m"
docker rm  $(docker stop $(docker ps -a -q --filter ancestor="slurm_db_daemon" --format="{{.ID}}"))
docker image rm -f slurm_db_daemon
echo -e "\033[0;32m###########_Building image_###########\033[0;0m"
docker build -t slurm_db_daemon .