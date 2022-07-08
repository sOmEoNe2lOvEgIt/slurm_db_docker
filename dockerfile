FROM centos:7

#Install munge and mariadb for slurm
RUN yum install epel-release -y
RUN yum install munge munge-libs munge-devel libnsl mariadb mariadb-devel -y
COPY ./etc/munge/* /etc/munge/

#Import necessary rpms
RUN mkdir /slurm_rpm && mkdir /var/log/slurm/
COPY ./etc/slurm_rpm/ /slurm_rpm/

#Install slurm and plugins from imported rpms
RUN useradd slurm
RUN mkdir /opt/SLURM && chown -R -H slurm /opt/SLURM
RUN yum install ./slurm_rpm/* -y

#Cleanup after install
RUN rm -d -r /slurm_rpm
##RUN yum clean all
##This ^ command makes the image heavyer for some reason...##
RUN rm -d -r /var/cache/*
RUN rm /tmp/*
RUN touch /etc/hostname
RUN echo "slurm_db_daemon" > /etc/hostname

CMD [ "slurmdbd", "-D" ] 