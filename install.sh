#!/bin/sh

export directory_path=pwd

resources/download_data.sh

kafka/bin/kafka-topics.sh \
        --create \
        --zookeeper localhost:2181 \
        --replication-factor 1 \
        --partitions 1 \
        --topic flight_delay_classification_request

./resources/import_distances.sh

python3 resources/train_spark_mllib_model.py .

cd flight_prediction
sbt compile
sbt package

cd target/scala-2.11

../../../spark/bin/spark-submit --master local --class es.upm.dit.ging.predictor.MakePrediction --packages org.mongodb.spark:mongo-spark-connector_2.11:2.4.1,org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0  flight_prediction_2.11-0.1.jar
