FROM store/oracle/serverjre:8
LABEL maintainer="Laird Nelson <ljnelson@microbean.org>" org.microbean.docker.repository.name="microbean/base"
USER root
RUN yum --assumeyes update && \
    yum --assumeyes install gzip tar && \
    yum clean all
RUN groupadd --system microbean --gid 1000 && \
    useradd --uid 1000 --system --gid microbean --create-home --home-dir /home/microbean --shell /sbin/nologin --comment "MicroBean user" microbean && \
    chmod 755 /home/microbean
USER microbean
ENV HOME /home/microbean
WORKDIR ${HOME}
RUN mkdir ${HOME}/.microbean
