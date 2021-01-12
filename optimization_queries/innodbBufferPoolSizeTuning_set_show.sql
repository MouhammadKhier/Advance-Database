-- '8388608'
-- SELECT @@innodb_buffer_pool_size;
-- SELECT CEILING(Total_InnoDB_Bytes*1.6/POWER(1024,3)) RIBPS FROM
-- (SELECT SUM(data_length+index_length) Total_InnoDB_Bytes
-- FROM information_schema.tables WHERE engine='InnoDB') A;
-- SELECT @@innodb_buffer_pool_size/1024/1024/1024;
set global innodb_buffer_pool_size=2*1024;