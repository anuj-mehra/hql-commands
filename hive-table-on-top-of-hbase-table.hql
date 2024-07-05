DROP TABLE IF EXISTS ${HIVE_SCHEMA_NAME}.tran;

CREATE EXTERNAL TABLE IF NOT EXISTS ${HIVE_SCHEMA_NAME}.tran(
rowkey String,
processdt String,
count String,
domain String
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES("hbase.columns.mapping" = ":key,cf:processdt,cf:count,cf:domain")
TBLPROPERTIES("hbase.table.name" = "${HBASE_NAMESPACE}.hbase_tran","hbase.table.default.storage.type"="binary");

set hive.msck.path.validation=ignore;
MSCK REPAIR TABLE ${HIVE_SCHEMA_NAME}.tran;