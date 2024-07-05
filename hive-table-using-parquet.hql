DROP TABLE IF EXISTS ${HIVE_SCHEMA_NAME}/POSN;

CREATE EXTERNAL TABLE IF NOT EXISTS ${HIVE_SCHEMA_NAME}/POSN(
rowkey String,
executionDt bigint,
count String,
domain String
)
PARTITIONED BY (PRODUCT_CODE String,POSN_AS_OF_DT bigint,PD_TYP_CD String, InputFileName String)
STORED AS PARQUET
LOCATION '${HDFS_BASE_PATH}/{HIVE_SCHEMA_NAME}/POSN';

set hive.msck.repair.batch.size=100;
set hive.msck.path.validation=ignore;
MSCK REPAIR TABLE ${HIVE_SCHEMA_NAME}/POSN;