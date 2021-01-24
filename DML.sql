
truncate table dq_category;


insert into dq_category (code, name, description, sort_order, insert_user) 
values('CONST','Consistency','There are no contradictions in data across data warehouse.',10,'dev');
insert into dq_category (code, name, description, sort_order, insert_user) 
values('ACCUR','Accuracy','Data is correct compared to reliable source.',20,'dev');
insert into dq_category (code, name, description, sort_order, insert_user) 
values('COMPL','Completeness','Data is missing.',30,'dev');
insert into dq_category (code, name, description, sort_order, insert_user) 
values('AUDIT','Auditability','It is possible to trace changes on data.',40,'dev');
insert into dq_category (code, name, description, sort_order, insert_user) 
values('ORDER','Orderliness','Data is in correct format and structure.',50,'dev');
insert into dq_category (code, name, description, sort_order, insert_user) 
values('UNIQU','Uniqueness','There are no duplicate records for data.',60,'dev');
insert into dq_category (code, name, description, sort_order, insert_user) 
values('TIMEL','Timeliness','Data represents reality for a given timestamp.',70,'dev');

commit;

select * from dq_category;


insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');
insert into dq_subcategory (code, name, description, category_code, sort_order, insert_user) 
values('DUPLI','Duplicate values','Finding duplicate values in data','UNIQU',10,'dev');


