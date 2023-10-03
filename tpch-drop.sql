DROP TABLE IF EXISTS PART CASCADE;
CREATE TABLE PART (

	P_PARTKEY		SERIAL PRIMARY KEY,
	P_NAME			VARCHAR(55),
	P_MFGR			CHAR(25),
	P_BRAND			CHAR(10),
	P_TYPE			VARCHAR(25),
	P_SIZE			INTEGER,
	P_CONTAINER		CHAR(10),
	P_RETAILPRICE	DECIMAL,
	P_COMMENT		VARCHAR(23)
);

DROP TABLE IF EXISTS SUPPLIER CASCADE;
CREATE TABLE SUPPLIER (
	S_SUPPKEY		SERIAL PRIMARY KEY,
	S_NAME			CHAR(25),
	S_ADDRESS		VARCHAR(40),
	S_NATIONKEY		BIGINT NOT NULL,
	S_PHONE			CHAR(15),
	S_ACCTBAL		DECIMAL,
	S_COMMENT		VARCHAR(101)
);

DROP TABLE IF EXISTS PARTSUPP CASCADE;
CREATE TABLE PARTSUPP (
	PS_PARTKEY		BIGINT NOT NULL,
	PS_SUPPKEY		BIGINT NOT NULL,
	PS_AVAILQTY		INTEGER,
	PS_SUPPLYCOST	DECIMAL,
	PS_COMMENT		VARCHAR(199),
	PRIMARY KEY (PS_PARTKEY, PS_SUPPKEY)
);

DROP TABLE IF EXISTS CUSTOMER CASCADE;
CREATE TABLE CUSTOMER (
	C_CUSTKEY		SERIAL PRIMARY KEY,
	C_NAME			VARCHAR(25),
	C_ADDRESS		VARCHAR(40),
	C_NATIONKEY		BIGINT NOT NULL,
	C_PHONE			CHAR(15),
	C_ACCTBAL		DECIMAL,
	C_MKTSEGMENT	CHAR(10),
	C_COMMENT		VARCHAR(117)
);

DROP TABLE IF EXISTS ORDERS CASCADE;
CREATE TABLE ORDERS (
	O_ORDERKEY		SERIAL PRIMARY KEY,
	O_CUSTKEY		BIGINT NOT NULL,
	O_ORDERSTATUS	CHAR(1),
	O_TOTALPRICE	DECIMAL,
	O_ORDERDATE		DATE,
	O_ORDERPRIORITY	CHAR(15),
	O_CLERK			CHAR(15),
	O_SHIPPRIORITY	INTEGER,
	O_COMMENT		VARCHAR(79)
);

DROP TABLE IF EXISTS LINEITEM CASCADE;
CREATE TABLE LINEITEM (
	L_ORDERKEY		BIGINT NOT NULL,
	L_PARTKEY		BIGINT NOT NULL,
	L_SUPPKEY		BIGINT NOT NULL,
	L_LINENUMBER	INTEGER,
	L_QUANTITY		DECIMAL,
	L_EXTENDEDPRICE	DECIMAL,
	L_DISCOUNT		DECIMAL,
	L_TAX			DECIMAL,
	L_RETURNFLAG	CHAR(1),
	L_LINESTATUS	CHAR(1),
	L_SHIPDATE		DATE,
	L_COMMITDATE	DATE,
	L_RECEIPTDATE	DATE,
	L_SHIPINSTRUCT	CHAR(25),
	L_SHIPMODE		CHAR(10),
	L_COMMENT		VARCHAR(44),
	PRIMARY KEY (L_ORDERKEY, L_LINENUMBER)
);

DROP TABLE IF EXISTS NATION CASCADE;
CREATE TABLE NATION (
	N_NATIONKEY		SERIAL PRIMARY KEY,
	N_NAME			CHAR(25),
	N_REGIONKEY		BIGINT NOT NULL,
	N_COMMENT		VARCHAR(152)
);

DROP TABLE IF EXISTS REGION CASCADE;
CREATE TABLE REGION (
	R_REGIONKEY	SERIAL PRIMARY KEY,
	R_NAME		CHAR(25),
	R_COMMENT	VARCHAR(152)
);
