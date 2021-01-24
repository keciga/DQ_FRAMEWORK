
drop table DQ_HIERARCHY_NODE;
drop table DQ_HIERARCHY;
drop table DQ_HIERARCHY_TYPE;
--drop table DQ_TEST_CASE;
drop table DQ_SUBCATEGORY;
drop table DQ_CATEGORY;

create table DQ_HIERARCHY_TYPE
(
CODE varchar2(50),
NAME varchar2(1000) NOT NULL,
DESCRIPTION varchar2(4000),
ACTIVE number(1) default 1 NOT NULL, 
SORT_ORDER number(5),
INSERT_DATE date  default sysdate,
INSERT_USER varchar2(50),
UPDATE_DATE date,
UPDATE_USER varchar2(50),
  CONSTRAINT chk_dq_hier_type_active CHECK (ACTIVE in (0,1)),
  constraint pk_DQ_HIERARCHY_TYPE primary key (CODE)
);
comment on table DQ_HIERARCHY_TYPE is 'Types of hierarchies.' ;
comment on column DQ_HIERARCHY_TYPE.CODE is 'Unique code representing hierarchy type.' ;
comment on column DQ_HIERARCHY_TYPE.NAME is 'Hierarchy type name' ;
comment on column DQ_HIERARCHY_TYPE.DESCRIPTION is 'Hierarchy type description' ;
comment on column DQ_HIERARCHY_TYPE.ACTIVE is 'Is record active or not (0/1).' ;
comment on column DQ_HIERARCHY_TYPE.SORT_ORDER is 'Sort order for display on front end' ;
comment on column DQ_HIERARCHY_TYPE.INSERT_DATE is 'Date and time of record creation in database';
comment on column DQ_HIERARCHY_TYPE.INSERT_USER is 'User that created the record';
comment on column DQ_HIERARCHY_TYPE.UPDATE_DATE is 'Date and time of record modification in database';
comment on column DQ_HIERARCHY_TYPE.UPDATE_USER is 'User that modified the record';

create table DQ_HIERARCHY
(
CODE varchar2(50),
NAME varchar2(1000) NOT NULL,
DESCRIPTION varchar2(4000),
HIERARCHY_TYPE_CODE varchar2(50) NOT NULL,
ACTIVE number(1) default 1 NOT NULL, 
SORT_ORDER number(5),
INSERT_DATE date  default sysdate,
INSERT_USER varchar2(50),
UPDATE_DATE date,
UPDATE_USER varchar2(50),
  CONSTRAINT chk_dq_hier_active CHECK (ACTIVE in (0,1)),
  constraint pk_DQ_HIERARCHY primary key (CODE),
  constraint fk_DQ_HIER_DQ_HIER_TYPE foreign key (HIERARCHY_TYPE_CODE) references DQ_HIERARCHY_TYPE(CODE)
);
comment on table DQ_HIERARCHY is 'Hierarchies by project, databse schema, ETL process, ...' ;
comment on column DQ_HIERARCHY.CODE is 'Unique code representing hierarchy.' ;
comment on column DQ_HIERARCHY.NAME is 'Hierarchy name' ;
comment on column DQ_HIERARCHY.DESCRIPTION is 'Hierarchy description' ;
comment on column DQ_HIERARCHY.HIERARCHY_TYPE_CODE is 'Reference to hierarchy type - foreign key to DQ_HIERARCHY_TYPE.CODE' ;
comment on column DQ_HIERARCHY.ACTIVE is 'Is record active or not (0/1).' ;
comment on column DQ_HIERARCHY.SORT_ORDER is 'Sort order for display on front end' ;
comment on column DQ_HIERARCHY.INSERT_DATE is 'Date and time of record creation in database';
comment on column DQ_HIERARCHY.INSERT_USER is 'User that created the record';
comment on column DQ_HIERARCHY.UPDATE_DATE is 'Date and time of record modification in database';
comment on column DQ_HIERARCHY.UPDATE_USER is 'User that modified the record';



create table DQ_HIERARCHY_NODE
(
CODE varchar2(50),
NAME varchar2(1000) NOT NULL,
DESCRIPTION varchar2(4000),
PARENT_CODE varchar2(50),
HIERARCHY_CODE varchar2(50) NOT NULL,
ACTIVE number(1) default 1 NOT NULL, 
SORT_ORDER number(5),
INSERT_DATE date  default sysdate,
INSERT_USER varchar2(50),
UPDATE_DATE date,
UPDATE_USER varchar2(50),
  CONSTRAINT chk_dq_hier_node_active CHECK (ACTIVE in (0,1)),
  constraint pk_DQ_HIERARCHY_NODE primary key (CODE),
  constraint fk_DQ_HIER_NODE_DQ_HIER_NODE foreign key (PARENT_CODE) references DQ_HIERARCHY_NODE(CODE),
  constraint fk_DQ_HIER_NODE_DQ_HIER foreign key (HIERARCHY_CODE) references DQ_HIERARCHY(CODE)
);

comment on table DQ_HIERARCHY_NODE is 'Nodes that hierarchy is made of.' ;
comment on column DQ_HIERARCHY_NODE.CODE is 'Position in hierarchy tree - primary key. Code representing node in hierarchy. Has to be unique across all hierarchies' ;
comment on column DQ_HIERARCHY_NODE.NAME is 'Hierarchy node name' ;
comment on column DQ_HIERARCHY_NODE.DESCRIPTION is 'Hierarchy node description' ;
comment on column DQ_HIERARCHY_NODE.PARENT_CODE is 'Reference to parent node - self referencing foreign key to DQ_HIERARCHY_NODE.CODE' ;
comment on column DQ_HIERARCHY_NODE.HIERARCHY_CODE is 'Reference to hierarchy - foreign key to DQ_HIERARCHY.CODE' ;
comment on column DQ_HIERARCHY_NODE.ACTIVE is 'Is record active or not (0/1).' ;
comment on column DQ_HIERARCHY_NODE.SORT_ORDER is 'Sort order for display on front end' ;
comment on column DQ_HIERARCHY_NODE.INSERT_DATE is 'Date and time of record creation in database';
comment on column DQ_HIERARCHY_NODE.INSERT_USER is 'User that created the record';
comment on column DQ_HIERARCHY_NODE.UPDATE_DATE is 'Date and time of record modification in database';
comment on column DQ_HIERARCHY_NODE.UPDATE_USER is 'User that modified the record';




create table DQ_CATEGORY
(
CODE varchar2(50),
NAME varchar2(1000) NOT NULL,
DESCRIPTION varchar2(4000),
ACTIVE number(1) default 1 NOT NULL, 
SORT_ORDER number(5),
INSERT_DATE date default sysdate,
INSERT_USER varchar2(50),
UPDATE_DATE date,
UPDATE_USER varchar2(50),
  CONSTRAINT chk_dq_category_active CHECK (ACTIVE in (0,1)),
  constraint pk_DQ_CATEGORY primary key (CODE)
);
comment on table DQ_CATEGORY is 'Categories of data quality that are monitored and measured.' ;
comment on column DQ_CATEGORY.CODE is 'Unique code representing data quality category.' ;
comment on column DQ_CATEGORY.NAME is 'Category name' ;
comment on column DQ_CATEGORY.DESCRIPTION is 'Category description' ;
comment on column DQ_CATEGORY.ACTIVE is 'Is record active or not (0/1).' ;
comment on column DQ_CATEGORY.SORT_ORDER is 'Sort order for display on front end' ;
comment on column DQ_CATEGORY.INSERT_DATE is 'Date and time of record creation in database';
comment on column DQ_CATEGORY.INSERT_USER is 'User that created the record';
comment on column DQ_CATEGORY.UPDATE_DATE is 'Date and time of record modification in database';
comment on column DQ_CATEGORY.UPDATE_USER is 'User that modified the record';


create table DQ_SUBCATEGORY
(
CODE varchar2(50),
NAME varchar2(1000) NOT NULL,
DESCRIPTION varchar2(4000),
CATEGORY_CODE varchar2(50),
ACTIVE number(1) default 1 NOT NULL, 
SORT_ORDER number(5),
INSERT_DATE date default sysdate,
INSERT_USER varchar2(50),
UPDATE_DATE date,
UPDATE_USER varchar2(50),
  CONSTRAINT chk_dq_subcategory_active CHECK (ACTIVE in (0,1)),
  constraint pk_DQ_SUBCATEGORY primary key (CODE),
  constraint fk_DQ_SUBCAT_DQ_CAT foreign key (CATEGORY_CODE) references DQ_CATEGORY(CODE)
);

comment on table DQ_SUBCATEGORY is 'Subcategories of data quality that are monitored and measured.' ;
comment on column DQ_SUBCATEGORY.CODE is 'Unique code representing data quality subcategory.' ;
comment on column DQ_SUBCATEGORY.NAME is 'Subcategory name' ;
comment on column DQ_SUBCATEGORY.DESCRIPTION is 'Subcategory description' ;
comment on column DQ_SUBCATEGORY.CATEGORY_CODE is 'Reference to category - foreign key to DQ_CATEGORY.CODE' ;
comment on column DQ_SUBCATEGORY.ACTIVE is 'Is record active or not (0/1).' ;
comment on column DQ_SUBCATEGORY.SORT_ORDER is 'Sort order for display on front end' ;
comment on column DQ_SUBCATEGORY.INSERT_DATE is 'Date and time of record creation in database';
comment on column DQ_SUBCATEGORY.INSERT_USER is 'User that created the record';
comment on column DQ_SUBCATEGORY.UPDATE_DATE is 'Date and time of record modification in database';
comment on column DQ_SUBCATEGORY.UPDATE_USER is 'User that modified the record';
