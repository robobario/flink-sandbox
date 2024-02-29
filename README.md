1. `docker-compose down && docker-compose up`
Starts flink, hadoop, kafka. Flink UI available on host on localhost:8081

2. create kafka topics 

```
docker run --network flink-sandbox_default -it --entrypoint /bin/bash apache/kafka:3.7.0
$ /opt/kafka/bin/kafka-topics.sh --bootstrap-server broker1:9092 --topic output-topic --create
$ /opt/kafka/bin/kafka-topics.sh --bootstrap-server broker1:9092 --topic input-topic --create
```

3. build job
```
cd hello-world-kafka
mvn clean install -DskipTests
```

4. submit and start `hello-world-kafka/target/hello-world-kafka-1.0-SNAPSHOT.jar`

5. push messages into kafka
```
docker run --network flink-sandbox_default -it --entrypoint /bin/bash apache/kafka:3.7.0
$ /opt/kafka/bin/kafka-console-producer.sh --bootstrap-server broker1:9092 --topic input-topic
a
a
a
b
b
a
```

6. consume from `output-topic` similar command to above and see results like:
```
a:3
b:2
a:1
```

you will need to keep pushing records into kafka to drive events/watermarks, or nothing will be
emitted. the job is trying to group them into keyed 10 second windows with a 20 second tolerance
for late events.
