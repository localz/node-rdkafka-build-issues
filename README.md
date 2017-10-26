Repository to reproduce an issue where v2.1.1 of node-rdkafka will not build in docker. v2.1.0 does work.

Error in v2.1.1:

```
Step 10/10 : RUN cd /tmp && npm install
 ---> Running in 6e5b6a9cc67d
npm WARN lifecycle node-rdkafka@2.1.1~preinstall: cannot run in wd %s %s (wd=%s) node-rdkafka@2.1.1 node util/configure /tmp/node_modules/.staging/node-rdkafka-19cf018d

> node-rdkafka@2.1.1 install /tmp/node_modules/node-rdkafka
> node-gyp rebuild

make: Entering directory '/tmp/node_modules/node-rdkafka/build'
  CXX(target) Release/obj.target/node-librdkafka/src/binding.o
  CXX(target) Release/obj.target/node-librdkafka/src/callbacks.o
  CXX(target) Release/obj.target/node-librdkafka/src/common.o
  CXX(target) Release/obj.target/node-librdkafka/src/config.o
  CXX(target) Release/obj.target/node-librdkafka/src/connection.o
  CXX(target) Release/obj.target/node-librdkafka/src/errors.o
  CXX(target) Release/obj.target/node-librdkafka/src/kafka-consumer.o
../src/kafka-consumer.cc: In member function 'NodeKafka::Baton NodeKafka::KafkaConsumer::Seek(const RdKafka::TopicPartition&, int)':
../src/kafka-consumer.cc:281:38: error: 'class RdKafka::KafkaConsumer' has no member named 'seek'
   RdKafka::ErrorCode err = consumer->seek(partition, timeout_ms);
                                      ^~~~
../src/kafka-consumer.cc: In member function 'NodeKafka::Baton NodeKafka::KafkaConsumer::OffsetsStore(std::vector<RdKafka::TopicPartition*>&)':
../src/kafka-consumer.cc:388:40: error: 'class RdKafka::KafkaConsumer' has no member named 'offsets_store'; did you mean 'offsetsForTimes'?
     RdKafka::ErrorCode err = consumer->offsets_store(toppars);
                                        ^~~~~~~~~~~~~
```

#Steps to reproduce

`docker build .`