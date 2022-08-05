FROM centos:7

#Install munge and mariadb for slurm and slurm
RUN mkdir /slurm_rpm && mkdir /var/log/slurm/
COPY ./etc/slurm_rpm/ /slurm_rpm/
RUN useradd slurm
RUN mkdir /opt/SLURM && chown -R -H slurm /opt/SLURM
RUN yum install epel-release munge munge-libs munge-devel libnsl mariadb mariadb-devel -y
RUN yum install ./slurm_rpm/* -y
COPY ./etc/munge/* /etc/munge/

#Cleanup after install
RUN rm -d -r /slurm_rpm
##RUN yum clean all
##This ^ command makes the image heavyer for some reason...##
RUN rm -d -r /var/cache/*
RUN rm /tmp/*
RUN touch /etc/hostname
RUN echo "slurm_db_daemon" > /etc/hostname

COPY /etc/script.sh /script.sh
CMD [ "/script.sh" ]
