# install Maven
apt-get update
apt-get install -y maven

# remove
apt-get purge -y confluent-kafka-connect-hdfs

# build and install
mvn -DskipTests clean package
mv target/$(ls target | grep package) /build
mv /build/share/doc/kafka-connect-hdfs /usr/share/docs
mv /build/share/java/kafka-connect-hdfs /usr/share/java
mvn clean && rm -rf /build

# remove Maven and clean up
apt-get purge -y maven
apt-get -y autoremove
apt-get clean
rm -rf ~/.m2 /var/lib/apt/lists/*
