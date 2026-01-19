/*
    ==============================================================================================================
	MySQL vs SQLserver
    MySQL does not have the same logical grouping that Microsoft SQLserver has. There for going to create dw_bronze, dw_silver and dw_gold to represent schemas which are
    there own databases.
    
    ** DONT THINK DATAWAREHOUSE DB IS NEEDED HERE AS THERE IS NO HIERARCHY FOR SCHEMAS INSIDE OF DATAWAREHOUSE LIKE SQLSERVER WILL UPDATE IF NEEDED **
    
    ==============================================================================================================
    Script Purpose:
		Checks first to see if there is a database with the same naming convention. If there isnt create the databases.
        creates the databases which are three layers of the medalion design pattern bronze layer, silver layer , gold layer.
*/

-- CREATE DATABASE IF NOT EXISTS DataWareHouse; dont think you are needed bud --
-- DROP DATABASE DataWareHouse; --
CREATE DATABASE IF NOT EXISTS dw_bronze;
CREATE DATABASE IF NOT EXISTS dw_silver;
CREATE DATABASE IF NOT EXISTS dw_gold;



