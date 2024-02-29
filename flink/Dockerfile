FROM flink
RUN set -ex; apt-get update; apt-get -y install curl tar
RUN curl --silent https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz | tar -zxf - && mv hadoop-3.3.6 /hadoop
COPY entry.sh /entry.sh
ENTRYPOINT ["/entry.sh"]
