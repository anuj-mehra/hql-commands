DROP TABLE IF EXISTS ${HIVE_SCHEMA_NAME}.POSN;

CREATE EXTERNAL TABLE ${HIVE_SCHEMA_NAME}.POSN
PARTITIONED BY (businessDt string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.avro.AvroSerDe'
STORED AS
INPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.avro.AvroContainerOutputFormat'
Location '${HDFS_BASE_LOCATION}/POSN'
TBLPROPERTIES ('avro.schema.url'='${HDFS_BASE_LOCATION}/POSN/posn.avsc');

set hive.msck.path.validation=ignore;
MSCK REPAIR TABLE ${HIVE_SCHEMA_NAME}.POSN;
