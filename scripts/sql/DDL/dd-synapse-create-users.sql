-- The following need to be run from the MASTER database
--
CREATE LOGIN atscale_agg_user 
	WITH PASSWORD = '@scale800';

CREATE LOGIN atscale_query_user 
	WITH PASSWORD = '@scale800';
	
-- The following need to be run from the BENCHMARK database
--
CREATE USER atscale_agg_user
	FOR LOGIN atscale_agg_user
	WITH DEFAULT_SCHEMA = tpcds10t;

EXEC sp_addrolemember 'db_owner', 'atscale_agg_user';
EXEC sp_addrolemember 'largerc', 'atscale_agg_user';

CREATE USER atscale_query_user
	FOR LOGIN atscale_query_user
	WITH DEFAULT_SCHEMA = tpcds10t;

-- Add user to the database owner role
EXEC sp_addrolemember 'db_owner', 'atscale_query_user';
EXEC sp_addrolemember N'db_owner', N'atscale_query_user';