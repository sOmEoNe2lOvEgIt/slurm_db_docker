docker rm  $(docker stop $(docker ps -a -q --filter ancestor="slurm_db_daemon" --format="{{.ID}}"& )& ) &
docker image rm -f slurm_db_daemon &
docker build -t slurm_db_daemon .