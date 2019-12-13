-ifndef(_hbase_types_included).
-define(_hbase_types_included, yeah).

-define(HBASE_TDELETETYPE_DELETE_COLUMN, 0).
-define(HBASE_TDELETETYPE_DELETE_COLUMNS, 1).
-define(HBASE_TDELETETYPE_DELETE_FAMILY, 2).
-define(HBASE_TDELETETYPE_DELETE_FAMILY_VERSION, 3).

-define(HBASE_TDURABILITY_USE_DEFAULT, 0).
-define(HBASE_TDURABILITY_SKIP_WAL, 1).
-define(HBASE_TDURABILITY_ASYNC_WAL, 2).
-define(HBASE_TDURABILITY_SYNC_WAL, 3).
-define(HBASE_TDURABILITY_FSYNC_WAL, 4).

-define(HBASE_TCONSISTENCY_STRONG, 1).
-define(HBASE_TCONSISTENCY_TIMELINE, 2).

-define(HBASE_TREADTYPE_DEFAULT, 1).
-define(HBASE_TREADTYPE_STREAM, 2).
-define(HBASE_TREADTYPE_PREAD, 3).

-define(HBASE_TCOMPAREOP_LESS, 0).
-define(HBASE_TCOMPAREOP_LESS_OR_EQUAL, 1).
-define(HBASE_TCOMPAREOP_EQUAL, 2).
-define(HBASE_TCOMPAREOP_NOT_EQUAL, 3).
-define(HBASE_TCOMPAREOP_GREATER_OR_EQUAL, 4).
-define(HBASE_TCOMPAREOP_GREATER, 5).
-define(HBASE_TCOMPAREOP_NO_OP, 6).

-define(HBASE_TBLOOMFILTERTYPE_NONE, 0).
-define(HBASE_TBLOOMFILTERTYPE_ROW, 1).
-define(HBASE_TBLOOMFILTERTYPE_ROWCOL, 2).
-define(HBASE_TBLOOMFILTERTYPE_ROWPREFIX_FIXED_LENGTH, 3).

-define(HBASE_TCOMPRESSIONALGORITHM_LZO, 0).
-define(HBASE_TCOMPRESSIONALGORITHM_GZ, 1).
-define(HBASE_TCOMPRESSIONALGORITHM_NONE, 2).
-define(HBASE_TCOMPRESSIONALGORITHM_SNAPPY, 3).
-define(HBASE_TCOMPRESSIONALGORITHM_LZ4, 4).
-define(HBASE_TCOMPRESSIONALGORITHM_BZIP2, 5).
-define(HBASE_TCOMPRESSIONALGORITHM_ZSTD, 6).

-define(HBASE_TDATABLOCKENCODING_NONE, 0).
-define(HBASE_TDATABLOCKENCODING_PREFIX, 2).
-define(HBASE_TDATABLOCKENCODING_DIFF, 3).
-define(HBASE_TDATABLOCKENCODING_FAST_DIFF, 4).
-define(HBASE_TDATABLOCKENCODING_ROW_INDEX_V1, 7).

-define(HBASE_TKEEPDELETEDCELLS_FALSE, 0).
-define(HBASE_TKEEPDELETEDCELLS_TRUE, 1).
-define(HBASE_TKEEPDELETEDCELLS_TTL, 2).

%% struct 'TTimeRange'

-record('TTimeRange', {'minStamp' :: integer(),
                       'maxStamp' :: integer()}).
-type 'TTimeRange'() :: #'TTimeRange'{}.

%% struct 'TColumn'

-record('TColumn', {'family' :: string() | binary(),
                    'qualifier' :: string() | binary() | 'undefined',
                    'timestamp' :: integer() | 'undefined'}).
-type 'TColumn'() :: #'TColumn'{}.

%% struct 'TColumnValue'

-record('TColumnValue', {'family' :: string() | binary(),
                         'qualifier' :: string() | binary(),
                         'value' :: string() | binary(),
                         'timestamp' :: integer() | 'undefined',
                         'tags' :: string() | binary() | 'undefined',
                         'type' :: integer() | 'undefined'}).
-type 'TColumnValue'() :: #'TColumnValue'{}.

%% struct 'TColumnIncrement'

-record('TColumnIncrement', {'family' :: string() | binary(),
                             'qualifier' :: string() | binary(),
                             'amount' = 1 :: integer() | 'undefined'}).
-type 'TColumnIncrement'() :: #'TColumnIncrement'{}.

%% struct 'TResult'

-record('TResult', {'row' :: string() | binary() | 'undefined',
                    'columnValues' = [] :: list(),
                    'stale' = false :: boolean() | 'undefined',
                    'partial' = false :: boolean() | 'undefined'}).
-type 'TResult'() :: #'TResult'{}.

%% struct 'TAuthorization'

-record('TAuthorization', {'labels' :: list() | 'undefined'}).
-type 'TAuthorization'() :: #'TAuthorization'{}.

%% struct 'TCellVisibility'

-record('TCellVisibility', {'expression' :: string() | binary() | 'undefined'}).
-type 'TCellVisibility'() :: #'TCellVisibility'{}.

%% struct 'TGet'

-record('TGet', {'row' :: string() | binary(),
                 'columns' :: list() | 'undefined',
                 'timestamp' :: integer() | 'undefined',
                 'timeRange' :: 'TTimeRange'() | 'undefined',
                 'maxVersions' :: integer() | 'undefined',
                 'filterString' :: string() | binary() | 'undefined',
                 'attributes' :: dict:dict() | 'undefined',
                 'authorizations' :: 'TAuthorization'() | 'undefined',
                 'consistency' :: integer() | 'undefined',
                 'targetReplicaId' :: integer() | 'undefined',
                 'cacheBlocks' :: boolean() | 'undefined',
                 'storeLimit' :: integer() | 'undefined',
                 'storeOffset' :: integer() | 'undefined',
                 'existence_only' :: boolean() | 'undefined',
                 'filterBytes' :: string() | binary() | 'undefined'}).
-type 'TGet'() :: #'TGet'{}.

%% struct 'TPut'

-record('TPut', {'row' :: string() | binary(),
                 'columnValues' = [] :: list(),
                 'timestamp' :: integer() | 'undefined',
                 'attributes' :: dict:dict() | 'undefined',
                 'durability' :: integer() | 'undefined',
                 'cellVisibility' :: 'TCellVisibility'() | 'undefined'}).
-type 'TPut'() :: #'TPut'{}.

%% struct 'TDelete'

-record('TDelete', {'row' :: string() | binary(),
                    'columns' :: list() | 'undefined',
                    'timestamp' :: integer() | 'undefined',
                    'deleteType' = 1 :: integer() | 'undefined',
                    'attributes' :: dict:dict() | 'undefined',
                    'durability' :: integer() | 'undefined'}).
-type 'TDelete'() :: #'TDelete'{}.

%% struct 'TIncrement'

-record('TIncrement', {'row' :: string() | binary(),
                       'columns' = [] :: list(),
                       'attributes' :: dict:dict() | 'undefined',
                       'durability' :: integer() | 'undefined',
                       'cellVisibility' :: 'TCellVisibility'() | 'undefined',
                       'returnResults' :: boolean() | 'undefined'}).
-type 'TIncrement'() :: #'TIncrement'{}.

%% struct 'TAppend'

-record('TAppend', {'row' :: string() | binary(),
                    'columns' = [] :: list(),
                    'attributes' :: dict:dict() | 'undefined',
                    'durability' :: integer() | 'undefined',
                    'cellVisibility' :: 'TCellVisibility'() | 'undefined',
                    'returnResults' :: boolean() | 'undefined'}).
-type 'TAppend'() :: #'TAppend'{}.

%% struct 'TScan'

-record('TScan', {'startRow' :: string() | binary() | 'undefined',
                  'stopRow' :: string() | binary() | 'undefined',
                  'columns' :: list() | 'undefined',
                  'caching' :: integer() | 'undefined',
                  'maxVersions' = 1 :: integer() | 'undefined',
                  'timeRange' :: 'TTimeRange'() | 'undefined',
                  'filterString' :: string() | binary() | 'undefined',
                  'batchSize' :: integer() | 'undefined',
                  'attributes' :: dict:dict() | 'undefined',
                  'authorizations' :: 'TAuthorization'() | 'undefined',
                  'reversed' :: boolean() | 'undefined',
                  'cacheBlocks' :: boolean() | 'undefined',
                  'colFamTimeRangeMap' :: dict:dict() | 'undefined',
                  'readType' :: integer() | 'undefined',
                  'limit' :: integer() | 'undefined',
                  'consistency' :: integer() | 'undefined',
                  'targetReplicaId' :: integer() | 'undefined',
                  'filterBytes' :: string() | binary() | 'undefined'}).
-type 'TScan'() :: #'TScan'{}.

%% struct 'TMutation'

-record('TMutation', {'put' :: 'TPut'() | 'undefined',
                      'deleteSingle' :: 'TDelete'() | 'undefined'}).
-type 'TMutation'() :: #'TMutation'{}.

%% struct 'TRowMutations'

-record('TRowMutations', {'row' :: string() | binary(),
                          'mutations' = [] :: list()}).
-type 'TRowMutations'() :: #'TRowMutations'{}.

%% struct 'THRegionInfo'

-record('THRegionInfo', {'regionId' :: integer(),
                         'tableName' :: string() | binary(),
                         'startKey' :: string() | binary() | 'undefined',
                         'endKey' :: string() | binary() | 'undefined',
                         'offline' :: boolean() | 'undefined',
                         'split' :: boolean() | 'undefined',
                         'replicaId' :: integer() | 'undefined'}).
-type 'THRegionInfo'() :: #'THRegionInfo'{}.

%% struct 'TServerName'

-record('TServerName', {'hostName' :: string() | binary(),
                        'port' :: integer() | 'undefined',
                        'startCode' :: integer() | 'undefined'}).
-type 'TServerName'() :: #'TServerName'{}.

%% struct 'THRegionLocation'

-record('THRegionLocation', {'serverName' = #'TServerName'{} :: 'TServerName'(),
                             'regionInfo' = #'THRegionInfo'{} :: 'THRegionInfo'()}).
-type 'THRegionLocation'() :: #'THRegionLocation'{}.

%% struct 'TTableName'

-record('TTableName', {'ns' :: string() | binary() | 'undefined',
                       'qualifier' :: string() | binary()}).
-type 'TTableName'() :: #'TTableName'{}.

%% struct 'TColumnFamilyDescriptor'

-record('TColumnFamilyDescriptor', {'name' :: string() | binary(),
                                    'attributes' :: dict:dict() | 'undefined',
                                    'configuration' :: dict:dict() | 'undefined',
                                    'blockSize' :: integer() | 'undefined',
                                    'bloomnFilterType' :: integer() | 'undefined',
                                    'compressionType' :: integer() | 'undefined',
                                    'dfsReplication' :: integer() | 'undefined',
                                    'dataBlockEncoding' :: integer() | 'undefined',
                                    'keepDeletedCells' :: integer() | 'undefined',
                                    'maxVersions' :: integer() | 'undefined',
                                    'minVersions' :: integer() | 'undefined',
                                    'scope' :: integer() | 'undefined',
                                    'timeToLive' :: integer() | 'undefined',
                                    'blockCacheEnabled' :: boolean() | 'undefined',
                                    'cacheBloomsOnWrite' :: boolean() | 'undefined',
                                    'cacheDataOnWrite' :: boolean() | 'undefined',
                                    'cacheIndexesOnWrite' :: boolean() | 'undefined',
                                    'compressTags' :: boolean() | 'undefined',
                                    'evictBlocksOnClose' :: boolean() | 'undefined',
                                    'inMemory' :: boolean() | 'undefined'}).
-type 'TColumnFamilyDescriptor'() :: #'TColumnFamilyDescriptor'{}.

%% struct 'TTableDescriptor'

-record('TTableDescriptor', {'tableName' = #'TTableName'{} :: 'TTableName'(),
                             'columns' :: list() | 'undefined',
                             'attributes' :: dict:dict() | 'undefined',
                             'durability' :: integer() | 'undefined'}).
-type 'TTableDescriptor'() :: #'TTableDescriptor'{}.

%% struct 'TNamespaceDescriptor'

-record('TNamespaceDescriptor', {'name' :: string() | binary(),
                                 'configuration' :: dict:dict() | 'undefined'}).
-type 'TNamespaceDescriptor'() :: #'TNamespaceDescriptor'{}.

%% struct 'TIOError'

-record('TIOError', {'message' :: string() | binary() | 'undefined'}).
-type 'TIOError'() :: #'TIOError'{}.

%% struct 'TIllegalArgument'

-record('TIllegalArgument', {'message' :: string() | binary() | 'undefined'}).
-type 'TIllegalArgument'() :: #'TIllegalArgument'{}.

-endif.
