FROM registry.access.redhat.com/rhscl/redis-32-rhel7:latest

COPY redis-master.conf ${HOME}/redis-master/redis.conf
COPY run.sh ${REDIS_PREFIX}/bin/run.sh
ADD scripts ${CONTAINER_SCRIPTS_PATH}

USER root

RUN chmod -R 777 ${HOME}/redis-*

USER 1001

COPY Dockerfile $HOME/Dockerfile

#######################################################################
##### We have to expose image metada as label and ENV
#######################################################################
LABEL br.com.santander.imageowner="Corporate Techonology" \
      br.com.santander.description="Redis 3.2 runtime for node microservices" \
      br.com.santander.components="Redis Server" \
      br.com.santander.image="marceloagmelo/redis-3.2:1.0.0.RELEASE"

ENV br.com.santander.imageowner="Corporate Techonology"
ENV br.com.santander.description="Redis 3.2 runtime for node microservices"
ENV br.com.santander.components="Redis Server"
ENV br.com.santander.image="marceloagmelo/redis-3.2:1.0.0.RELEASE"


CMD [ "run.sh" ]
