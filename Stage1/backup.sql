prompt PL/SQL Developer Export Tables for user C##YONI@XE
prompt Created by Yoni on יום שלישי 28 מאי 2024
set feedback off
set define off

prompt Creating ACCIDENT...
create table ACCIDENT
(
  accidentid     INTEGER not null,
  dateofaccident DATE not null,
  damagelevel    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ACCIDENT
  add primary key (ACCIDENTID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating BASE...
create table BASE
(
  baseid    INTEGER not null,
  basename  VARCHAR2(30) not null,
  location_ VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table BASE
  add primary key (BASEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating SOLDIER...
create table SOLDIER
(
  soldierid   INTEGER not null,
  name_       VARCHAR2(30) not null,
  rank_       VARCHAR2(30) not null,
  dateofbirth DATE not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SOLDIER
  add primary key (SOLDIERID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating VEHICLE...
create table VEHICLE
(
  vehicleid      INTEGER not null,
  model_         VARCHAR2(30) not null,
  aquisitiondate DATE not null,
  status         VARCHAR2(30) not null,
  baseid         INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VEHICLE
  add primary key (VEHICLEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table VEHICLE
  add foreign key (BASEID)
  references BASE (BASEID);

prompt Creating DRIVEAT...
create table DRIVEAT
(
  dateofdrive DATE not null,
  soldierid   INTEGER not null,
  vehicleid   INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVEAT
  add primary key (SOLDIERID, VEHICLEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table DRIVEAT
  add foreign key (SOLDIERID)
  references SOLDIER (SOLDIERID);
alter table DRIVEAT
  add foreign key (VEHICLEID)
  references VEHICLE (VEHICLEID);

prompt Creating HADACCIDENT...
create table HADACCIDENT
(
  accidentid INTEGER not null,
  vehicleid  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HADACCIDENT
  add primary key (ACCIDENTID, VEHICLEID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HADACCIDENT
  add foreign key (ACCIDENTID)
  references ACCIDENT (ACCIDENTID);
alter table HADACCIDENT
  add foreign key (VEHICLEID)
  references VEHICLE (VEHICLEID);

prompt Creating TRIP...
create table TRIP
(
  tripid      INTEGER not null,
  tripdate    DATE not null,
  destination VARCHAR2(30) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TRIP
  add primary key (TRIPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating HADTRIP...
create table HADTRIP
(
  vehicleid INTEGER not null,
  tripid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HADTRIP
  add primary key (VEHICLEID, TRIPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HADTRIP
  add foreign key (VEHICLEID)
  references VEHICLE (VEHICLEID);
alter table HADTRIP
  add foreign key (TRIPID)
  references TRIP (TRIPID);

prompt Creating HASTRIPS...
create table HASTRIPS
(
  soldierid INTEGER not null,
  tripid    INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HASTRIPS
  add primary key (SOLDIERID, TRIPID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HASTRIPS
  add foreign key (SOLDIERID)
  references SOLDIER (SOLDIERID);
alter table HASTRIPS
  add foreign key (TRIPID)
  references TRIP (TRIPID);

prompt Creating MAINTENANCERECORD...
create table MAINTENANCERECORD
(
  recordid          INTEGER not null,
  dateofmaintenance DATE not null,
  description_      VARCHAR2(200) not null,
  vehicleid         INTEGER
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENANCERECORD
  add primary key (RECORDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTENANCERECORD
  add foreign key (VEHICLEID)
  references VEHICLE (VEHICLEID);

prompt Creating MADEMAINTENANCE...
create table MADEMAINTENANCE
(
  soldierid INTEGER not null,
  recordid  INTEGER not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MADEMAINTENANCE
  add primary key (SOLDIERID, RECORDID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MADEMAINTENANCE
  add foreign key (SOLDIERID)
  references SOLDIER (SOLDIERID);
alter table MADEMAINTENANCE
  add foreign key (RECORDID)
  references MAINTENANCERECORD (RECORDID);

prompt Disabling triggers for ACCIDENT...
alter table ACCIDENT disable all triggers;
prompt Disabling triggers for BASE...
alter table BASE disable all triggers;
prompt Disabling triggers for SOLDIER...
alter table SOLDIER disable all triggers;
prompt Disabling triggers for VEHICLE...
alter table VEHICLE disable all triggers;
prompt Disabling triggers for DRIVEAT...
alter table DRIVEAT disable all triggers;
prompt Disabling triggers for HADACCIDENT...
alter table HADACCIDENT disable all triggers;
prompt Disabling triggers for TRIP...
alter table TRIP disable all triggers;
prompt Disabling triggers for HADTRIP...
alter table HADTRIP disable all triggers;
prompt Disabling triggers for HASTRIPS...
alter table HASTRIPS disable all triggers;
prompt Disabling triggers for MAINTENANCERECORD...
alter table MAINTENANCERECORD disable all triggers;
prompt Disabling triggers for MADEMAINTENANCE...
alter table MADEMAINTENANCE disable all triggers;
prompt Disabling foreign key constraints for VEHICLE...
alter table VEHICLE disable constraint SYS_C008989;
prompt Disabling foreign key constraints for DRIVEAT...
alter table DRIVEAT disable constraint SYS_C008999;
alter table DRIVEAT disable constraint SYS_C009000;
prompt Disabling foreign key constraints for HADACCIDENT...
alter table HADACCIDENT disable constraint SYS_C009014;
alter table HADACCIDENT disable constraint SYS_C009015;
prompt Disabling foreign key constraints for HADTRIP...
alter table HADTRIP disable constraint SYS_C009004;
alter table HADTRIP disable constraint SYS_C009005;
prompt Disabling foreign key constraints for HASTRIPS...
alter table HASTRIPS disable constraint SYS_C008982;
alter table HASTRIPS disable constraint SYS_C008983;
prompt Disabling foreign key constraints for MAINTENANCERECORD...
alter table MAINTENANCERECORD disable constraint SYS_C008994;
prompt Disabling foreign key constraints for MADEMAINTENANCE...
alter table MADEMAINTENANCE disable constraint SYS_C009009;
alter table MADEMAINTENANCE disable constraint SYS_C009010;
prompt Deleting MADEMAINTENANCE...
delete from MADEMAINTENANCE;
commit;
prompt Deleting MAINTENANCERECORD...
delete from MAINTENANCERECORD;
commit;
prompt Deleting HASTRIPS...
delete from HASTRIPS;
commit;
prompt Deleting HADTRIP...
delete from HADTRIP;
commit;
prompt Deleting TRIP...
delete from TRIP;
commit;
prompt Deleting HADACCIDENT...
delete from HADACCIDENT;
commit;
prompt Deleting DRIVEAT...
delete from DRIVEAT;
commit;
prompt Deleting VEHICLE...
delete from VEHICLE;
commit;
prompt Deleting SOLDIER...
delete from SOLDIER;
commit;
prompt Deleting BASE...
delete from BASE;
commit;
prompt Deleting ACCIDENT...
delete from ACCIDENT;
commit;
prompt Loading ACCIDENT...
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (359152, to_date('07-02-1988', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (424456, to_date('04-07-1993', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (627774, to_date('16-08-1972', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (186827, to_date('22-07-1976', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (586375, to_date('17-10-2007', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (816255, to_date('20-06-1998', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (659443, to_date('21-09-1995', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (367367, to_date('07-12-2010', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (255955, to_date('22-09-2021', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (179332, to_date('14-02-2018', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (626449, to_date('15-03-1984', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (989369, to_date('16-03-1978', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (255822, to_date('19-02-1985', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (242958, to_date('10-07-1976', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (664716, to_date('14-04-2014', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (713374, to_date('18-06-2018', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (826566, to_date('17-09-2013', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (333126, to_date('24-04-1985', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (682499, to_date('19-08-1996', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (476116, to_date('06-06-1970', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (572734, to_date('08-04-2003', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (995913, to_date('10-10-2017', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (159341, to_date('14-05-2002', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (387145, to_date('09-06-2023', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (165158, to_date('23-01-2010', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (174546, to_date('23-06-2017', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (882435, to_date('24-05-1991', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (718212, to_date('11-02-2011', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (854361, to_date('24-02-1979', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (945215, to_date('06-12-2006', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (993522, to_date('28-05-1975', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (158714, to_date('14-01-2009', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (426211, to_date('11-01-2016', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (998855, to_date('12-12-1978', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (921782, to_date('17-11-2017', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (945672, to_date('26-09-2008', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (434369, to_date('29-04-2006', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (222981, to_date('10-04-2005', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (485222, to_date('02-10-2016', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (394431, to_date('12-01-1972', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (238665, to_date('11-02-1996', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (542465, to_date('17-04-2019', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (686613, to_date('31-01-1976', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (864927, to_date('06-01-1994', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (185814, to_date('05-08-1974', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (878691, to_date('01-01-1979', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (957269, to_date('10-01-2006', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (895775, to_date('02-02-1977', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (271663, to_date('27-09-1982', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (763772, to_date('06-09-1975', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (214989, to_date('21-11-1996', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (681887, to_date('03-04-2011', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (415927, to_date('28-08-2004', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (662216, to_date('25-07-2016', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (343185, to_date('31-05-1999', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (395678, to_date('24-10-1993', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (477571, to_date('26-11-2021', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (855814, to_date('08-07-1970', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (775493, to_date('17-06-2007', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (846248, to_date('04-09-2009', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (911227, to_date('27-06-2013', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (397424, to_date('01-09-2002', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (332162, to_date('07-05-2012', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (942948, to_date('20-05-2005', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (242887, to_date('14-03-2010', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (113853, to_date('15-10-1976', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (965496, to_date('07-11-2002', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (223286, to_date('03-06-2006', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (545373, to_date('16-12-1985', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (886767, to_date('05-08-1998', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (221363, to_date('12-07-2019', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (122232, to_date('25-07-2008', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (952432, to_date('16-10-2020', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (261173, to_date('30-01-1981', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (777835, to_date('20-09-1991', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (795321, to_date('16-11-1977', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (463176, to_date('11-11-1974', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (683572, to_date('17-07-1970', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (524537, to_date('22-03-2009', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (326838, to_date('13-09-2013', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (569359, to_date('09-06-1977', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (299198, to_date('19-07-1983', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (962169, to_date('15-04-1996', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (679212, to_date('04-09-2022', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (977922, to_date('30-03-1992', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (152544, to_date('17-12-2006', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (794184, to_date('17-04-1983', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (471742, to_date('23-05-1990', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (895124, to_date('19-06-1980', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (261858, to_date('06-12-1997', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (177419, to_date('18-01-1998', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (327714, to_date('20-05-1981', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (781445, to_date('26-05-2009', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (112753, to_date('22-07-1992', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (129517, to_date('04-07-2011', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (639898, to_date('23-02-1976', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (376945, to_date('20-10-1980', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (588415, to_date('24-03-1997', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (699581, to_date('22-01-1992', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (679315, to_date('18-10-1979', 'dd-mm-yyyy'), 3);
commit;
prompt 100 records committed...
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (653998, to_date('18-03-2011', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (642542, to_date('11-08-1988', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (679661, to_date('23-03-2014', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (273654, to_date('23-01-2022', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (268223, to_date('13-04-1997', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (819241, to_date('04-05-2022', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (453268, to_date('21-12-1986', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (433234, to_date('21-04-1994', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (838782, to_date('18-02-1996', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (125355, to_date('29-08-2015', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (716592, to_date('21-09-1979', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (811691, to_date('29-06-1975', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (533511, to_date('28-12-2007', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (363871, to_date('06-02-2019', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (576792, to_date('06-01-2005', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (923131, to_date('18-11-2014', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (713899, to_date('19-03-1976', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (918761, to_date('25-02-1999', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (254322, to_date('09-07-2018', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (356529, to_date('10-05-2023', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (282574, to_date('06-08-2004', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (751245, to_date('01-04-2001', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (421512, to_date('07-05-1973', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (861962, to_date('01-10-1990', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (926879, to_date('29-01-1977', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (119977, to_date('15-10-1986', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (999623, to_date('23-01-1983', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (766458, to_date('04-11-1985', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (462731, to_date('11-05-1992', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (887495, to_date('10-02-1996', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (478122, to_date('09-09-1995', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (738132, to_date('18-05-1993', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (318481, to_date('10-08-1983', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (338297, to_date('09-07-1985', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (324379, to_date('12-01-2011', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (429663, to_date('16-09-2022', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (728882, to_date('08-02-1990', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (288732, to_date('06-04-1990', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (555588, to_date('11-01-1972', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (521632, to_date('26-02-1999', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (125495, to_date('05-04-1994', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (138996, to_date('18-11-2015', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (467219, to_date('17-01-1982', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (227835, to_date('23-04-1981', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (924289, to_date('05-12-1975', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (625164, to_date('12-11-1983', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (791872, to_date('05-12-1978', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (534532, to_date('20-01-1998', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (562337, to_date('30-01-2021', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (964851, to_date('28-04-2003', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (365753, to_date('15-08-2006', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (683756, to_date('26-03-1994', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (189912, to_date('29-10-1995', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (477938, to_date('28-08-1990', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (455582, to_date('14-11-1997', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (229786, to_date('19-08-1993', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (367424, to_date('14-01-1981', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (755141, to_date('19-07-1995', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (714482, to_date('15-07-1991', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (982473, to_date('30-04-1990', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (341846, to_date('20-09-2000', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (841777, to_date('20-08-1983', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (132262, to_date('04-12-2023', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (351392, to_date('08-01-2003', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (344414, to_date('30-12-2021', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (499898, to_date('03-07-1999', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (884173, to_date('21-02-2020', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (584233, to_date('10-09-2020', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (255522, to_date('12-06-2009', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (872713, to_date('13-09-2003', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (626659, to_date('28-05-2011', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (799688, to_date('13-08-2002', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (784491, to_date('07-06-1979', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (343588, to_date('23-05-1981', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (327653, to_date('20-01-1972', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (889626, to_date('05-01-1987', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (473373, to_date('04-02-2000', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (918542, to_date('08-09-1996', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (166344, to_date('17-07-1982', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (885576, to_date('21-05-1982', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (986488, to_date('17-01-1974', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (879968, to_date('02-05-1975', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (677361, to_date('13-02-2012', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (923446, to_date('14-11-2021', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (248385, to_date('30-08-2018', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (754183, to_date('04-05-1976', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (834315, to_date('24-02-1973', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (956851, to_date('20-03-2000', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (547113, to_date('18-02-1977', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (177137, to_date('09-09-1974', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (893851, to_date('13-10-1992', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (948827, to_date('17-10-1999', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (564346, to_date('28-01-2016', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (392436, to_date('22-04-2024', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (493597, to_date('18-04-1978', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (967918, to_date('01-12-2018', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (321134, to_date('29-07-1973', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (777228, to_date('01-06-1986', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (223836, to_date('28-05-1997', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (927128, to_date('15-11-1971', 'dd-mm-yyyy'), 5);
commit;
prompt 200 records committed...
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (219977, to_date('01-03-2011', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (489956, to_date('04-07-2018', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (586766, to_date('17-08-2006', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (712958, to_date('16-11-2014', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (678444, to_date('01-03-2016', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (322876, to_date('17-09-1976', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (138597, to_date('04-04-2014', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (868738, to_date('14-10-2002', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (744623, to_date('07-01-1982', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (175468, to_date('06-06-2013', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (435172, to_date('18-09-1971', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (616831, to_date('23-01-1978', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (797237, to_date('12-04-2008', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (376768, to_date('11-09-1979', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (115991, to_date('11-11-1990', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (387633, to_date('18-10-2007', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (281466, to_date('22-08-1974', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (341592, to_date('25-10-2022', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (489935, to_date('11-01-2018', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (983522, to_date('11-09-2020', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (228841, to_date('22-07-1975', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (549813, to_date('25-09-1988', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (329812, to_date('29-12-1996', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (468774, to_date('03-02-1970', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (965186, to_date('12-04-1994', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (712426, to_date('30-08-2019', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (942271, to_date('26-08-1977', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (522916, to_date('02-12-1996', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (171343, to_date('10-07-2011', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (832414, to_date('11-10-2010', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (852894, to_date('06-05-2007', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (662413, to_date('03-02-1995', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (434325, to_date('10-06-2005', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (794527, to_date('16-07-1990', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (919553, to_date('19-03-2022', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (398715, to_date('16-10-1991', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (328497, to_date('26-12-2005', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (896935, to_date('10-01-2012', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (344916, to_date('09-03-2010', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (577327, to_date('26-06-1984', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (468214, to_date('20-03-1986', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (566418, to_date('10-12-1989', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (438142, to_date('17-12-2010', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (542679, to_date('09-04-1995', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (569338, to_date('27-12-1970', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (817244, to_date('09-04-1972', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (239657, to_date('17-05-2007', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (949191, to_date('11-07-2016', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (879339, to_date('08-08-1982', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (191129, to_date('13-04-1977', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (762448, to_date('15-09-1979', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (779462, to_date('03-12-2010', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (131672, to_date('27-06-1986', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (864341, to_date('15-07-1993', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (516311, to_date('09-05-2014', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (114899, to_date('27-01-2020', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (295961, to_date('07-11-1999', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (813523, to_date('18-11-1979', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (493176, to_date('04-11-1977', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (565371, to_date('20-07-2001', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (146987, to_date('12-01-1983', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (687367, to_date('10-02-1974', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (654661, to_date('23-10-2005', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (259151, to_date('18-11-1991', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (671246, to_date('21-06-2002', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (527289, to_date('25-04-1984', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (435913, to_date('08-01-2014', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (923835, to_date('15-11-1997', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (677447, to_date('30-05-2013', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (628748, to_date('11-11-1988', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (784845, to_date('09-01-1970', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (887155, to_date('18-08-1996', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (286112, to_date('16-11-2022', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (914646, to_date('30-09-1990', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (629315, to_date('23-10-2001', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (331665, to_date('12-11-1989', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (132966, to_date('04-01-1981', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (434452, to_date('29-07-2017', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (682274, to_date('05-07-2017', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (921815, to_date('02-12-2003', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (856831, to_date('29-05-1998', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (546823, to_date('30-11-2012', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (515586, to_date('10-01-1977', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (958646, to_date('30-01-1981', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (918371, to_date('12-02-2020', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (713316, to_date('14-04-1999', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (494121, to_date('18-09-2000', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (626357, to_date('05-12-1996', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (795223, to_date('24-08-1988', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (436888, to_date('25-10-2023', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (695169, to_date('23-01-1989', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (748975, to_date('28-08-1988', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (378149, to_date('13-12-2006', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (694734, to_date('09-04-1995', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (149489, to_date('30-12-2002', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (252937, to_date('03-06-1972', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (561887, to_date('07-06-2012', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (321927, to_date('08-01-2010', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (797191, to_date('27-03-1992', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (596261, to_date('26-12-1988', 'dd-mm-yyyy'), 8);
commit;
prompt 300 records committed...
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (276246, to_date('19-04-1994', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (321151, to_date('27-09-1971', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (122278, to_date('15-08-2012', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (339128, to_date('28-01-1995', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (852179, to_date('09-07-1993', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (351936, to_date('12-09-1971', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (838659, to_date('12-10-2008', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (627864, to_date('14-01-1972', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (927985, to_date('17-03-1994', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (568274, to_date('17-02-2017', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (294646, to_date('14-02-1977', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (773741, to_date('28-02-1980', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (853963, to_date('29-11-1977', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (337673, to_date('28-11-1976', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (579256, to_date('06-03-2020', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (563949, to_date('11-09-1995', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (322811, to_date('21-12-1977', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (826972, to_date('29-02-2016', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (454337, to_date('07-08-2020', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (737921, to_date('06-07-2019', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (618447, to_date('09-11-1970', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (944288, to_date('28-08-1998', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (113315, to_date('29-06-2021', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (896774, to_date('07-10-2022', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (219576, to_date('21-10-1984', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (514788, to_date('11-10-1975', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (862146, to_date('30-01-2009', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (591997, to_date('27-03-2001', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (766133, to_date('11-03-1991', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (837886, to_date('07-07-2023', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (546872, to_date('17-05-2021', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (789617, to_date('25-04-1975', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (676959, to_date('01-03-2013', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (664157, to_date('02-11-1970', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (178889, to_date('05-03-1985', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (656379, to_date('04-01-1990', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (196183, to_date('01-01-2017', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (958453, to_date('23-04-1997', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (817146, to_date('23-09-1987', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (263269, to_date('19-04-2006', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (988378, to_date('06-10-2020', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (873566, to_date('18-02-1981', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (538928, to_date('24-01-2005', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (237951, to_date('06-10-2009', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (531772, to_date('19-08-1985', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (396546, to_date('13-02-1988', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (386499, to_date('08-09-2010', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (965515, to_date('12-08-2010', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (983258, to_date('25-11-1978', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (937294, to_date('12-01-2000', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (499884, to_date('15-07-1975', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (198756, to_date('06-05-1989', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (376789, to_date('28-12-2010', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (478517, to_date('05-04-2023', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (657576, to_date('31-08-1976', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (567752, to_date('26-05-2005', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (593259, to_date('11-02-1981', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (959394, to_date('24-02-1980', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (882484, to_date('07-12-1979', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (628244, to_date('06-11-1979', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (198856, to_date('04-04-2003', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (898751, to_date('26-08-1980', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (515131, to_date('20-12-2002', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (136218, to_date('16-05-2021', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (692462, to_date('15-07-1971', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (271411, to_date('08-05-1996', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (316743, to_date('13-07-2006', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (691694, to_date('15-08-1991', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (479114, to_date('04-11-1994', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (757761, to_date('12-06-2023', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (119543, to_date('02-03-2003', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (798716, to_date('06-03-1994', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (885993, to_date('15-07-2016', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (297392, to_date('03-02-1974', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (327973, to_date('11-11-2002', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (756229, to_date('05-04-1994', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (522941, to_date('04-06-1977', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (196496, to_date('23-05-2002', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (619294, to_date('26-01-2013', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (994238, to_date('12-09-1981', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (664376, to_date('04-10-1978', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (787866, to_date('28-05-2015', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (192666, to_date('13-05-1984', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (352646, to_date('12-12-1970', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (559933, to_date('31-07-2010', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (361819, to_date('22-02-1999', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (889647, to_date('03-06-1973', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (585773, to_date('27-01-2001', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (988264, to_date('24-01-2006', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (772346, to_date('28-07-2018', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (631697, to_date('21-01-1980', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (477422, to_date('10-10-1972', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (931912, to_date('27-06-2004', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (175583, to_date('12-04-2000', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (456821, to_date('11-07-2001', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (477849, to_date('12-05-1974', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (912647, to_date('04-04-1988', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (723377, to_date('18-02-2004', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (456894, to_date('20-03-1978', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (893146, to_date('03-02-2010', 'dd-mm-yyyy'), 7);
commit;
prompt 400 records committed...
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (636129, to_date('25-07-1991', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (381943, to_date('16-12-2005', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (465911, to_date('15-12-2010', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (867387, to_date('11-03-2000', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (142721, to_date('19-09-1991', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (266435, to_date('14-03-2006', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (311686, to_date('12-09-1980', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (472492, to_date('02-03-1998', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (668634, to_date('22-10-2017', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (378128, to_date('04-08-1975', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (361321, to_date('10-03-1983', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (384873, to_date('19-06-1973', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (897141, to_date('24-09-1987', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (739832, to_date('20-02-2018', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (973547, to_date('12-12-2002', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (151546, to_date('04-07-1974', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (962242, to_date('24-10-1979', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (363168, to_date('30-10-1990', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (443774, to_date('14-12-2021', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (432793, to_date('23-12-2019', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (218356, to_date('06-07-2015', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (634678, to_date('29-07-1992', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (843352, to_date('25-08-2019', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (598615, to_date('16-03-1990', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (484674, to_date('27-01-2005', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (181279, to_date('04-12-1983', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (829926, to_date('28-11-1972', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (365574, to_date('15-06-2007', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (341441, to_date('11-03-2019', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (912529, to_date('15-05-2004', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (351136, to_date('29-01-2019', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (925489, to_date('13-04-2001', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (597974, to_date('07-05-2017', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (591155, to_date('13-05-2009', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (527246, to_date('12-04-2021', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (219759, to_date('14-03-1980', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (518627, to_date('25-10-2010', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (449953, to_date('23-12-1978', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (943912, to_date('04-02-2003', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (545673, to_date('03-05-1977', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (422616, to_date('22-04-2008', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (775655, to_date('24-03-1972', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (719836, to_date('21-07-1985', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (597494, to_date('07-02-1996', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (423413, to_date('03-01-2016', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (824267, to_date('05-06-2018', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (975672, to_date('19-02-1987', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (335329, to_date('16-03-2010', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (374381, to_date('16-03-1983', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (227131, to_date('03-07-2008', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (277638, to_date('14-10-2023', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (918794, to_date('19-12-2017', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (915598, to_date('23-08-2019', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (166476, to_date('02-01-2021', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (377799, to_date('24-03-2000', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (543868, to_date('30-12-1987', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (821527, to_date('15-03-2015', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (596664, to_date('08-02-1996', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (537482, to_date('21-08-1981', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (631187, to_date('07-03-2022', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (357835, to_date('10-03-2020', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (529933, to_date('02-04-2007', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (552414, to_date('23-04-1976', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (899699, to_date('19-05-1975', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (534749, to_date('22-09-1973', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (738972, to_date('10-07-1989', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (918373, to_date('30-12-1989', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (568286, to_date('20-09-1998', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (838656, to_date('12-05-1975', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (759726, to_date('11-04-2011', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (354835, to_date('29-07-1971', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (119715, to_date('16-04-1996', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (624953, to_date('10-06-2013', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (927183, to_date('01-07-2002', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (889794, to_date('09-01-1976', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (464975, to_date('19-06-2005', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (185379, to_date('10-06-2019', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (573835, to_date('13-02-1972', 'dd-mm-yyyy'), 7);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (569644, to_date('15-06-2001', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (438952, to_date('30-07-1979', 'dd-mm-yyyy'), 2);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (317135, to_date('10-08-1976', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (676887, to_date('09-01-2008', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (626498, to_date('07-02-1989', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (887651, to_date('24-03-2005', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (941766, to_date('26-04-1974', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (992392, to_date('22-05-2005', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (568627, to_date('26-04-1986', 'dd-mm-yyyy'), 8);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (254867, to_date('30-04-1976', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (163797, to_date('21-09-1990', 'dd-mm-yyyy'), 4);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (333831, to_date('04-09-1992', 'dd-mm-yyyy'), 9);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (253292, to_date('25-07-1983', 'dd-mm-yyyy'), 10);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (836533, to_date('25-05-1974', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (767795, to_date('11-06-2001', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (268762, to_date('17-12-2022', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (792793, to_date('04-02-2023', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (968831, to_date('24-11-1996', 'dd-mm-yyyy'), 1);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (668212, to_date('18-07-1979', 'dd-mm-yyyy'), 3);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (936656, to_date('13-12-2010', 'dd-mm-yyyy'), 6);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (698295, to_date('17-08-1981', 'dd-mm-yyyy'), 5);
insert into ACCIDENT (accidentid, dateofaccident, damagelevel)
values (695441, to_date('08-08-2011', 'dd-mm-yyyy'), 3);
commit;
prompt 500 records loaded
prompt Loading BASE...
insert into BASE (baseid, basename, location_)
values (716411, 'Wolfpack Camp', 'Galilee');
insert into BASE (baseid, basename, location_)
values (299961, 'Lion''s Den', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (21950, 'Thunderbolt Barracks', 'Holon');
insert into BASE (baseid, basename, location_)
values (618595, 'Shadow Ridge Base', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (155077, 'Spartan Citadel', 'Nesher');
insert into BASE (baseid, basename, location_)
values (522468, 'Thunderbolt Barracks', 'Qiryat Ono');
insert into BASE (baseid, basename, location_)
values (611132, 'Wolfpack Camp', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (656992, 'Phoenix Stronghold', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (755215, 'Wolfpack Camp', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (596693, 'Wolfpack Camp', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (647973, 'Spartan Citadel', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (286784, 'Thunderstrike Outpost', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (480786, 'Iron Fortress', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (238744, 'Shadow Ridge Base', 'Eilat');
insert into BASE (baseid, basename, location_)
values (267671, 'Lion''s Den', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (880598, 'Lion''s Den', 'Lod');
insert into BASE (baseid, basename, location_)
values (741586, 'Lion''s Den', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (250479, 'Shadow Ridge Base', 'Acre');
insert into BASE (baseid, basename, location_)
values (531268, 'Shadow Ridge Base', 'Beit She''an');
insert into BASE (baseid, basename, location_)
values (713497, 'Shadow Ridge Base', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (865889, 'Wolfpack Camp', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (426820, 'Eagle''s Nest', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (442496, 'Viper Valley Base', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (615770, 'Eagle''s Nest', 'Hadera');
insert into BASE (baseid, basename, location_)
values (895105, 'Phoenix Stronghold', 'Galilee');
insert into BASE (baseid, basename, location_)
values (899020, 'Thunderbolt Barracks', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (715708, 'Phoenix Stronghold', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (778941, 'Thunderbolt Barracks', 'Yavne');
insert into BASE (baseid, basename, location_)
values (633184, 'Shadow Ridge Base', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (551900, 'Eagle''s Nest', 'Eilat');
insert into BASE (baseid, basename, location_)
values (700167, 'Thunderstrike Outpost', 'Haifa');
insert into BASE (baseid, basename, location_)
values (446760, 'Wolfpack Camp', 'Eilat');
insert into BASE (baseid, basename, location_)
values (166454, 'Eagle''s Nest', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (661289, 'Shadow Ridge Base', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (455324, 'Thunderbolt Barracks', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (106290, 'Shadow Ridge Base', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (974212, 'Wolfpack Camp', 'Yavne');
insert into BASE (baseid, basename, location_)
values (911808, 'Thunderstrike Outpost', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (908103, 'Thunderbolt Barracks', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (100783, 'Thunderbolt Barracks', 'Dimona');
insert into BASE (baseid, basename, location_)
values (179934, 'Shadow Ridge Base', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (494318, 'Shadow Ridge Base', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (649718, 'Thunderbolt Barracks', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (927099, 'Shadow Ridge Base', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (976428, 'Phoenix Stronghold', 'Netanya');
insert into BASE (baseid, basename, location_)
values (880200, 'Thunderstrike Outpost', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (377741, 'Thunderstrike Outpost', 'Safed');
insert into BASE (baseid, basename, location_)
values (722229, 'Wolfpack Camp', 'Acre');
insert into BASE (baseid, basename, location_)
values (828472, 'Thunderstrike Outpost', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (551839, 'Iron Fortress', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (742032, 'Shadow Ridge Base', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (729081, 'Thunderbolt Barracks', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (34118, 'Wolfpack Camp', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (364577, 'Wolfpack Camp', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (46331, 'Wolfpack Camp', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (279354, 'Wolfpack Camp', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (942714, 'Phoenix Stronghold', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (834871, 'Shadow Ridge Base', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (47001, 'Eagle''s Nest', 'Safed');
insert into BASE (baseid, basename, location_)
values (305781, 'Iron Fortress', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (816236, 'Eagle''s Nest', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (399684, 'Thunderbolt Barracks', 'Sderot');
insert into BASE (baseid, basename, location_)
values (390291, 'Viper Valley Base', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (748905, 'Iron Fortress', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (683294, 'Spartan Citadel', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (642912, 'Iron Fortress', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (705122, 'Thunderstrike Outpost', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (641207, 'Wolfpack Camp', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (963848, 'Shadow Ridge Base', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (442587, 'Lion''s Den', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (330582, 'Iron Fortress', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (144504, 'Thunderbolt Barracks', 'Eilat');
insert into BASE (baseid, basename, location_)
values (2245, 'Eagle''s Nest', 'Yavne');
insert into BASE (baseid, basename, location_)
values (897006, 'Phoenix Stronghold', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (489684, 'Thunderbolt Barracks', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (954472, 'Spartan Citadel', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (836092, 'Iron Fortress', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (869324, 'Viper Valley Base', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (588125, 'Phoenix Stronghold', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (816168, 'Thunderbolt Barracks', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (310136, 'Lion''s Den', 'Galilee');
insert into BASE (baseid, basename, location_)
values (683034, 'Viper Valley Base', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (869543, 'Iron Fortress', 'Kiryat Gat');
insert into BASE (baseid, basename, location_)
values (929761, 'Iron Fortress', 'Acre');
insert into BASE (baseid, basename, location_)
values (47886, 'Eagle''s Nest', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (597826, 'Thunderbolt Barracks', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (68630, 'Lion''s Den', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (620780, 'Thunderstrike Outpost', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (682213, 'Lion''s Den', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (932705, 'Phoenix Stronghold', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (263152, 'Lion''s Den', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (140152, 'Thunderbolt Barracks', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (151647, 'Eagle''s Nest', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (6019, 'Phoenix Stronghold', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (62060, 'Spartan Citadel', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (255941, 'Thunderbolt Barracks', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (332743, 'Thunderstrike Outpost', 'Yehud');
insert into BASE (baseid, basename, location_)
values (408669, 'Thunderbolt Barracks', 'Nesher');
insert into BASE (baseid, basename, location_)
values (862885, 'Phoenix Stronghold', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (756586, 'Shadow Ridge Base', 'Acre');
commit;
prompt 100 records committed...
insert into BASE (baseid, basename, location_)
values (731509, 'Thunderbolt Barracks', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (496151, 'Thunderstrike Outpost', 'Holon');
insert into BASE (baseid, basename, location_)
values (969453, 'Phoenix Stronghold', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (859404, 'Spartan Citadel', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (623056, 'Spartan Citadel', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (847122, 'Wolfpack Camp', 'Yavne');
insert into BASE (baseid, basename, location_)
values (734636, 'Spartan Citadel', 'Netanya');
insert into BASE (baseid, basename, location_)
values (92483, 'Spartan Citadel', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (319095, 'Viper Valley Base', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (273935, 'Viper Valley Base', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (265293, 'Thunderstrike Outpost', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (759136, 'Phoenix Stronghold', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (513500, 'Wolfpack Camp', 'Acre');
insert into BASE (baseid, basename, location_)
values (216148, 'Wolfpack Camp', 'Galilee');
insert into BASE (baseid, basename, location_)
values (119855, 'Thunderstrike Outpost', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (368287, 'Iron Fortress', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (10248, 'Wolfpack Camp', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (120796, 'Wolfpack Camp', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (819635, 'Lion''s Den', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (23650, 'Iron Fortress', 'Qiryat Ono');
insert into BASE (baseid, basename, location_)
values (951081, 'Thunderstrike Outpost', 'Lod');
insert into BASE (baseid, basename, location_)
values (453395, 'Eagle''s Nest', 'Arad');
insert into BASE (baseid, basename, location_)
values (484085, 'Wolfpack Camp', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (784195, 'Thunderstrike Outpost', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (587660, 'Viper Valley Base', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (324460, 'Viper Valley Base', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (1245, 'Phoenix Stronghold', 'Eilat');
insert into BASE (baseid, basename, location_)
values (148409, 'Thunderbolt Barracks', 'Yavne');
insert into BASE (baseid, basename, location_)
values (50069, 'Wolfpack Camp', 'Dimona');
insert into BASE (baseid, basename, location_)
values (721322, 'Thunderbolt Barracks', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (759740, 'Thunderstrike Outpost', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (337680, 'Shadow Ridge Base', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (518587, 'Spartan Citadel', 'Dimona');
insert into BASE (baseid, basename, location_)
values (650932, 'Wolfpack Camp', 'Lod');
insert into BASE (baseid, basename, location_)
values (668822, 'Thunderstrike Outpost', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (188581, 'Eagle''s Nest', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (899114, 'Viper Valley Base', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (540629, 'Eagle''s Nest', 'Netanya');
insert into BASE (baseid, basename, location_)
values (868902, 'Iron Fortress', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (860013, 'Lion''s Den', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (701007, 'Thunderstrike Outpost', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (939397, 'Shadow Ridge Base', 'Sderot');
insert into BASE (baseid, basename, location_)
values (685117, 'Thunderstrike Outpost', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (668766, 'Thunderbolt Barracks', 'Netanya');
insert into BASE (baseid, basename, location_)
values (816153, 'Thunderbolt Barracks', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (866648, 'Thunderstrike Outpost', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (751870, 'Thunderbolt Barracks', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (342772, 'Thunderstrike Outpost', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (259781, 'Thunderbolt Barracks', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (227601, 'Wolfpack Camp', 'Netanya');
insert into BASE (baseid, basename, location_)
values (524939, 'Iron Fortress', 'Arad');
insert into BASE (baseid, basename, location_)
values (160036, 'Thunderstrike Outpost', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (233108, 'Iron Fortress', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (788357, 'Iron Fortress', 'Nesher');
insert into BASE (baseid, basename, location_)
values (2655, 'Lion''s Den', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (240640, 'Thunderstrike Outpost', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (74836, 'Spartan Citadel', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (847911, 'Iron Fortress', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (47639, 'Phoenix Stronghold', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (679720, 'Spartan Citadel', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (23321, 'Eagle''s Nest', 'Haifa');
insert into BASE (baseid, basename, location_)
values (336, 'Thunderstrike Outpost', 'Hadera');
insert into BASE (baseid, basename, location_)
values (913158, 'Thunderstrike Outpost', 'Arad');
insert into BASE (baseid, basename, location_)
values (876873, 'Iron Fortress', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (744868, 'Spartan Citadel', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (994218, 'Thunderbolt Barracks', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (476658, 'Eagle''s Nest', 'Lod');
insert into BASE (baseid, basename, location_)
values (397261, 'Eagle''s Nest', 'Holon');
insert into BASE (baseid, basename, location_)
values (77942, 'Thunderstrike Outpost', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (859250, 'Spartan Citadel', 'Holon');
insert into BASE (baseid, basename, location_)
values (767293, 'Thunderbolt Barracks', 'Eilat');
insert into BASE (baseid, basename, location_)
values (890899, 'Wolfpack Camp', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (293957, 'Spartan Citadel', 'Nesher');
insert into BASE (baseid, basename, location_)
values (328059, 'Lion''s Den', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (699634, 'Thunderstrike Outpost', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (706400, 'Lion''s Den', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (345685, 'Spartan Citadel', 'Netanya');
insert into BASE (baseid, basename, location_)
values (647129, 'Eagle''s Nest', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (620115, 'Wolfpack Camp', 'Eilat');
insert into BASE (baseid, basename, location_)
values (379958, 'Viper Valley Base', 'Qiryat Ono');
insert into BASE (baseid, basename, location_)
values (515315, 'Viper Valley Base', 'Holon');
insert into BASE (baseid, basename, location_)
values (922330, 'Iron Fortress', 'Qiryat Ono');
insert into BASE (baseid, basename, location_)
values (517793, 'Thunderbolt Barracks', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (549679, 'Shadow Ridge Base', 'Acre');
insert into BASE (baseid, basename, location_)
values (954755, 'Wolfpack Camp', 'Galilee');
insert into BASE (baseid, basename, location_)
values (594710, 'Wolfpack Camp', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (751023, 'Iron Fortress', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (309315, 'Spartan Citadel', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (775716, 'Thunderbolt Barracks', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (480859, 'Shadow Ridge Base', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (758840, 'Iron Fortress', 'Haifa');
insert into BASE (baseid, basename, location_)
values (38609, 'Spartan Citadel', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (376878, 'Eagle''s Nest', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (864124, 'Wolfpack Camp', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (384216, 'Viper Valley Base', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (84493, 'Lion''s Den', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (796180, 'Thunderstrike Outpost', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (623967, 'Phoenix Stronghold', 'Nesher');
insert into BASE (baseid, basename, location_)
values (725691, 'Thunderbolt Barracks', 'Netanya');
insert into BASE (baseid, basename, location_)
values (248440, 'Iron Fortress', 'Ma''alot-Tarshiha');
commit;
prompt 200 records committed...
insert into BASE (baseid, basename, location_)
values (885066, 'Wolfpack Camp', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (514129, 'Spartan Citadel', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (530876, 'Thunderstrike Outpost', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (961068, 'Thunderbolt Barracks', 'Dimona');
insert into BASE (baseid, basename, location_)
values (98592, 'Spartan Citadel', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (38757, 'Thunderbolt Barracks', 'Hadera');
insert into BASE (baseid, basename, location_)
values (47840, 'Phoenix Stronghold', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (602773, 'Shadow Ridge Base', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (336796, 'Eagle''s Nest', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (10979, 'Wolfpack Camp', 'Dimona');
insert into BASE (baseid, basename, location_)
values (349924, 'Thunderbolt Barracks', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (383721, 'Eagle''s Nest', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (465888, 'Phoenix Stronghold', 'Holon');
insert into BASE (baseid, basename, location_)
values (775138, 'Thunderstrike Outpost', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (612393, 'Eagle''s Nest', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (659078, 'Thunderstrike Outpost', 'Dimona');
insert into BASE (baseid, basename, location_)
values (799516, 'Shadow Ridge Base', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (84788, 'Phoenix Stronghold', 'Holon');
insert into BASE (baseid, basename, location_)
values (958966, 'Shadow Ridge Base', 'Lod');
insert into BASE (baseid, basename, location_)
values (858128, 'Phoenix Stronghold', 'Netanya');
insert into BASE (baseid, basename, location_)
values (614465, 'Lion''s Den', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (221486, 'Eagle''s Nest', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (487915, 'Thunderstrike Outpost', 'Lod');
insert into BASE (baseid, basename, location_)
values (205083, 'Thunderbolt Barracks', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (293141, 'Eagle''s Nest', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (877596, 'Thunderstrike Outpost', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (792649, 'Viper Valley Base', 'Lod');
insert into BASE (baseid, basename, location_)
values (53537, 'Lion''s Den', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (73272, 'Thunderstrike Outpost', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (620389, 'Eagle''s Nest', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (50445, 'Wolfpack Camp', 'Arad');
insert into BASE (baseid, basename, location_)
values (187898, 'Lion''s Den', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (413161, 'Eagle''s Nest', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (863003, 'Lion''s Den', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (452827, 'Thunderbolt Barracks', 'Holon');
insert into BASE (baseid, basename, location_)
values (178961, 'Eagle''s Nest', 'Eilat');
insert into BASE (baseid, basename, location_)
values (292308, 'Eagle''s Nest', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (836206, 'Thunderstrike Outpost', 'Holon');
insert into BASE (baseid, basename, location_)
values (587039, 'Viper Valley Base', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (76132, 'Shadow Ridge Base', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (231553, 'Shadow Ridge Base', 'Lod');
insert into BASE (baseid, basename, location_)
values (884030, 'Shadow Ridge Base', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (438314, 'Thunderstrike Outpost', 'Sderot');
insert into BASE (baseid, basename, location_)
values (447667, 'Eagle''s Nest', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (146017, 'Iron Fortress', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (989717, 'Shadow Ridge Base', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (433046, 'Thunderbolt Barracks', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (569207, 'Eagle''s Nest', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (499295, 'Viper Valley Base', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (874803, 'Thunderstrike Outpost', 'Haifa');
insert into BASE (baseid, basename, location_)
values (756998, 'Shadow Ridge Base', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (319961, 'Iron Fortress', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (678476, 'Shadow Ridge Base', 'Yavne');
insert into BASE (baseid, basename, location_)
values (959379, 'Wolfpack Camp', 'Netanya');
insert into BASE (baseid, basename, location_)
values (568920, 'Iron Fortress', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (858401, 'Iron Fortress', 'Holon');
insert into BASE (baseid, basename, location_)
values (968173, 'Lion''s Den', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (614710, 'Spartan Citadel', 'Hadera');
insert into BASE (baseid, basename, location_)
values (791323, 'Thunderstrike Outpost', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (989781, 'Thunderstrike Outpost', 'Yehud');
insert into BASE (baseid, basename, location_)
values (353864, 'Viper Valley Base', 'Safed');
insert into BASE (baseid, basename, location_)
values (674598, 'Eagle''s Nest', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (977819, 'Viper Valley Base', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (846475, 'Thunderstrike Outpost', 'Galilee');
insert into BASE (baseid, basename, location_)
values (827285, 'Spartan Citadel', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (455430, 'Shadow Ridge Base', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (340647, 'Lion''s Den', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (33375, 'Viper Valley Base', 'Nesher');
insert into BASE (baseid, basename, location_)
values (927868, 'Spartan Citadel', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (227870, 'Thunderstrike Outpost', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (144218, 'Eagle''s Nest', 'Safed');
insert into BASE (baseid, basename, location_)
values (475096, 'Iron Fortress', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (532513, 'Wolfpack Camp', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (403608, 'Wolfpack Camp', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (361210, 'Shadow Ridge Base', 'Arad');
insert into BASE (baseid, basename, location_)
values (480466, 'Viper Valley Base', 'Arad');
insert into BASE (baseid, basename, location_)
values (17709, 'Thunderbolt Barracks', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (447820, 'Shadow Ridge Base', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (814409, 'Thunderstrike Outpost', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (728458, 'Phoenix Stronghold', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (203945, 'Eagle''s Nest', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (751293, 'Wolfpack Camp', 'Galilee');
insert into BASE (baseid, basename, location_)
values (743851, 'Viper Valley Base', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (846536, 'Thunderstrike Outpost', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (701603, 'Eagle''s Nest', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (273863, 'Wolfpack Camp', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (714309, 'Thunderstrike Outpost', 'Nesher');
insert into BASE (baseid, basename, location_)
values (931588, 'Lion''s Den', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (353648, 'Viper Valley Base', 'Kiryat Gat');
insert into BASE (baseid, basename, location_)
values (352561, 'Phoenix Stronghold', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (530515, 'Eagle''s Nest', 'Negev Desert');
insert into BASE (baseid, basename, location_)
values (449558, 'Lion''s Den', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (485586, 'Eagle''s Nest', 'Dimona');
insert into BASE (baseid, basename, location_)
values (488616, 'Eagle''s Nest', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (43092, 'Viper Valley Base', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (509396, 'Iron Fortress', 'Arad');
insert into BASE (baseid, basename, location_)
values (402382, 'Lion''s Den', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (395961, 'Viper Valley Base', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (699803, 'Iron Fortress', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (786247, 'Wolfpack Camp', 'Qiryat Yam');
commit;
prompt 300 records committed...
insert into BASE (baseid, basename, location_)
values (1615, 'Shadow Ridge Base', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (604306, 'Phoenix Stronghold', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (186088, 'Eagle''s Nest', 'Kiryat Gat');
insert into BASE (baseid, basename, location_)
values (543705, 'Wolfpack Camp', 'Arad');
insert into BASE (baseid, basename, location_)
values (573438, 'Eagle''s Nest', 'Bat Yam');
insert into BASE (baseid, basename, location_)
values (345659, 'Spartan Citadel', 'Holon');
insert into BASE (baseid, basename, location_)
values (407361, 'Thunderbolt Barracks', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (709185, 'Wolfpack Camp', 'Nesher');
insert into BASE (baseid, basename, location_)
values (357321, 'Phoenix Stronghold', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (40654, 'Phoenix Stronghold', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (528153, 'Viper Valley Base', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (469677, 'Eagle''s Nest', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (108645, 'Viper Valley Base', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (281045, 'Iron Fortress', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (774812, 'Thunderbolt Barracks', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (584448, 'Iron Fortress', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (710007, 'Phoenix Stronghold', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (666126, 'Viper Valley Base', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (240754, 'Eagle''s Nest', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (773846, 'Spartan Citadel', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (671613, 'Wolfpack Camp', 'Sderot');
insert into BASE (baseid, basename, location_)
values (200059, 'Viper Valley Base', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (888325, 'Shadow Ridge Base', 'Nesher');
insert into BASE (baseid, basename, location_)
values (146757, 'Thunderstrike Outpost', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (682789, 'Thunderbolt Barracks', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (973763, 'Shadow Ridge Base', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (554496, 'Phoenix Stronghold', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (344138, 'Eagle''s Nest', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (535678, 'Thunderbolt Barracks', 'Holon');
insert into BASE (baseid, basename, location_)
values (118229, 'Iron Fortress', 'Beit She''an');
insert into BASE (baseid, basename, location_)
values (82511, 'Iron Fortress', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (784254, 'Eagle''s Nest', 'Netanya');
insert into BASE (baseid, basename, location_)
values (191406, 'Shadow Ridge Base', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (965900, 'Phoenix Stronghold', 'Nesher');
insert into BASE (baseid, basename, location_)
values (439580, 'Thunderbolt Barracks', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (275277, 'Viper Valley Base', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (860827, 'Iron Fortress', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (151706, 'Eagle''s Nest', 'Haifa');
insert into BASE (baseid, basename, location_)
values (750472, 'Lion''s Den', 'Nesher');
insert into BASE (baseid, basename, location_)
values (83008, 'Lion''s Den', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (815890, 'Iron Fortress', 'Yehud');
insert into BASE (baseid, basename, location_)
values (972135, 'Lion''s Den', 'Haifa');
insert into BASE (baseid, basename, location_)
values (41866, 'Shadow Ridge Base', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (688633, 'Wolfpack Camp', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (680356, 'Thunderbolt Barracks', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (957716, 'Viper Valley Base', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (749779, 'Spartan Citadel', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (891761, 'Phoenix Stronghold', 'Dead Sea');
insert into BASE (baseid, basename, location_)
values (154392, 'Phoenix Stronghold', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (646127, 'Phoenix Stronghold', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (375123, 'Spartan Citadel', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (931041, 'Viper Valley Base', 'Holon');
insert into BASE (baseid, basename, location_)
values (377985, 'Lion''s Den', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (363757, 'Phoenix Stronghold', 'Galilee');
insert into BASE (baseid, basename, location_)
values (876383, 'Wolfpack Camp', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (62223, 'Shadow Ridge Base', 'Eilat');
insert into BASE (baseid, basename, location_)
values (33710, 'Iron Fortress', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (490738, 'Phoenix Stronghold', 'Acre');
insert into BASE (baseid, basename, location_)
values (985349, 'Spartan Citadel', 'Beit She''an');
insert into BASE (baseid, basename, location_)
values (964343, 'Shadow Ridge Base', 'Holon');
insert into BASE (baseid, basename, location_)
values (858069, 'Wolfpack Camp', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (675567, 'Thunderstrike Outpost', 'Eilat');
insert into BASE (baseid, basename, location_)
values (754671, 'Eagle''s Nest', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (914132, 'Iron Fortress', 'Eilat');
insert into BASE (baseid, basename, location_)
values (463085, 'Wolfpack Camp', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (623670, 'Iron Fortress', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (902274, 'Lion''s Den', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (999177, 'Thunderbolt Barracks', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (642815, 'Thunderstrike Outpost', 'Eilat');
insert into BASE (baseid, basename, location_)
values (221094, 'Iron Fortress', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (611059, 'Thunderstrike Outpost', 'Arad');
insert into BASE (baseid, basename, location_)
values (860364, 'Spartan Citadel', 'Ramat Hasharon');
insert into BASE (baseid, basename, location_)
values (359188, 'Wolfpack Camp', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (688663, 'Phoenix Stronghold', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (124184, 'Spartan Citadel', 'Sderot');
insert into BASE (baseid, basename, location_)
values (692776, 'Iron Fortress', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (939572, 'Shadow Ridge Base', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (756864, 'Thunderbolt Barracks', 'Yehud');
insert into BASE (baseid, basename, location_)
values (266734, 'Lion''s Den', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (537740, 'Phoenix Stronghold', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (633859, 'Viper Valley Base', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (546581, 'Phoenix Stronghold', 'Safed');
insert into BASE (baseid, basename, location_)
values (56401, 'Iron Fortress', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (454026, 'Phoenix Stronghold', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (531798, 'Thunderstrike Outpost', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (304359, 'Spartan Citadel', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (345748, 'Thunderstrike Outpost', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (202720, 'Lion''s Den', 'Kiryat Malachi');
insert into BASE (baseid, basename, location_)
values (779320, 'Thunderstrike Outpost', 'Beit She''an');
insert into BASE (baseid, basename, location_)
values (881261, 'Phoenix Stronghold', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (672678, 'Shadow Ridge Base', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (386597, 'Eagle''s Nest', 'Holon');
insert into BASE (baseid, basename, location_)
values (962591, 'Spartan Citadel', 'Beit She''an');
insert into BASE (baseid, basename, location_)
values (106764, 'Thunderstrike Outpost', 'Yehud');
insert into BASE (baseid, basename, location_)
values (249816, 'Eagle''s Nest', 'Sderot');
insert into BASE (baseid, basename, location_)
values (629041, 'Viper Valley Base', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (719061, 'Thunderbolt Barracks', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (160633, 'Viper Valley Base', 'Jaffa');
insert into BASE (baseid, basename, location_)
values (624230, 'Lion''s Den', 'Ra''anana');
insert into BASE (baseid, basename, location_)
values (502795, 'Lion''s Den', 'Beer Sheva');
commit;
prompt 400 records committed...
insert into BASE (baseid, basename, location_)
values (962423, 'Spartan Citadel', 'Kiryat Gat');
insert into BASE (baseid, basename, location_)
values (503871, 'Thunderbolt Barracks', 'Rosh HaAyin');
insert into BASE (baseid, basename, location_)
values (325138, 'Shadow Ridge Base', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (649739, 'Spartan Citadel', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (281344, 'Wolfpack Camp', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (450193, 'Viper Valley Base', 'Galilee');
insert into BASE (baseid, basename, location_)
values (17547, 'Eagle''s Nest', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (725850, 'Thunderbolt Barracks', 'Qiryat Shemona');
insert into BASE (baseid, basename, location_)
values (731, 'Iron Fortress', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (476517, 'Phoenix Stronghold', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (728389, 'Shadow Ridge Base', 'Dimona');
insert into BASE (baseid, basename, location_)
values (525734, 'Lion''s Den', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (734284, 'Wolfpack Camp', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (657775, 'Thunderstrike Outpost', 'Nesher');
insert into BASE (baseid, basename, location_)
values (445026, 'Thunderbolt Barracks', 'Hadera');
insert into BASE (baseid, basename, location_)
values (49918, 'Wolfpack Camp', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (501100, 'Thunderbolt Barracks', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (10798, 'Thunderbolt Barracks', 'Yehud');
insert into BASE (baseid, basename, location_)
values (662779, 'Viper Valley Base', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (760245, 'Thunderbolt Barracks', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (240523, 'Eagle''s Nest', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (842106, 'Thunderbolt Barracks', 'Safed');
insert into BASE (baseid, basename, location_)
values (818365, 'Shadow Ridge Base', 'Hadera');
insert into BASE (baseid, basename, location_)
values (964050, 'Wolfpack Camp', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (94161, 'Thunderstrike Outpost', 'Acre');
insert into BASE (baseid, basename, location_)
values (354922, 'Thunderstrike Outpost', 'Safed');
insert into BASE (baseid, basename, location_)
values (760471, 'Thunderstrike Outpost', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (140504, 'Viper Valley Base', 'Acre');
insert into BASE (baseid, basename, location_)
values (277631, 'Lion''s Den', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (937314, 'Spartan Citadel', 'Ashkelon');
insert into BASE (baseid, basename, location_)
values (856459, 'Shadow Ridge Base', 'Herzliya');
insert into BASE (baseid, basename, location_)
values (856492, 'Thunderbolt Barracks', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (342517, 'Iron Fortress', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (466247, 'Viper Valley Base', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (807194, 'Shadow Ridge Base', 'Galilee');
insert into BASE (baseid, basename, location_)
values (586970, 'Shadow Ridge Base', 'Acre');
insert into BASE (baseid, basename, location_)
values (7739, 'Eagle''s Nest', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (629855, 'Viper Valley Base', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (498703, 'Viper Valley Base', 'Tzfat');
insert into BASE (baseid, basename, location_)
values (104527, 'Spartan Citadel', 'Sderot');
insert into BASE (baseid, basename, location_)
values (878311, 'Lion''s Den', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (426031, 'Eagle''s Nest', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (661884, 'Spartan Citadel', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (826560, 'Phoenix Stronghold', 'Haifa');
insert into BASE (baseid, basename, location_)
values (554828, 'Thunderstrike Outpost', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (756250, 'Lion''s Den', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (308227, 'Iron Fortress', 'Qiryat Ono');
insert into BASE (baseid, basename, location_)
values (658283, 'Shadow Ridge Base', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (491038, 'Wolfpack Camp', 'Nazareth');
insert into BASE (baseid, basename, location_)
values (410059, 'Wolfpack Camp', 'Acre');
insert into BASE (baseid, basename, location_)
values (18815, 'Spartan Citadel', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (921, 'Shadow Ridge Base', 'Jerusalem');
insert into BASE (baseid, basename, location_)
values (235479, 'Thunderstrike Outpost', 'Beit She''an');
insert into BASE (baseid, basename, location_)
values (148881, 'Iron Fortress', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (611403, 'Phoenix Stronghold', 'Arad');
insert into BASE (baseid, basename, location_)
values (108158, 'Thunderbolt Barracks', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (772783, 'Shadow Ridge Base', 'Rishon LeZion');
insert into BASE (baseid, basename, location_)
values (212492, 'Iron Fortress', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (399673, 'Spartan Citadel', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (770115, 'Shadow Ridge Base', 'Lod');
insert into BASE (baseid, basename, location_)
values (697926, 'Phoenix Stronghold', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (844289, 'Spartan Citadel', 'Acre');
insert into BASE (baseid, basename, location_)
values (545434, 'Lion''s Den', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (45743, 'Spartan Citadel', 'Qiryat Ono');
insert into BASE (baseid, basename, location_)
values (646102, 'Thunderbolt Barracks', 'Ramat Gan');
insert into BASE (baseid, basename, location_)
values (194232, 'Shadow Ridge Base', 'Sderot');
insert into BASE (baseid, basename, location_)
values (750009, 'Phoenix Stronghold', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (925844, 'Shadow Ridge Base', 'Tel Aviv');
insert into BASE (baseid, basename, location_)
values (851112, 'Eagle''s Nest', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (799217, 'Phoenix Stronghold', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (574000, 'Lion''s Den', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (596050, 'Eagle''s Nest', 'Ma''alot-Tarshiha');
insert into BASE (baseid, basename, location_)
values (122194, 'Spartan Citadel', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (941754, 'Thunderstrike Outpost', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (577366, 'Thunderstrike Outpost', 'Haifa');
insert into BASE (baseid, basename, location_)
values (974391, 'Lion''s Den', 'Lod');
insert into BASE (baseid, basename, location_)
values (930274, 'Lion''s Den', 'Modi''in');
insert into BASE (baseid, basename, location_)
values (312520, 'Thunderbolt Barracks', 'Caesarea');
insert into BASE (baseid, basename, location_)
values (372564, 'Spartan Citadel', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (487884, 'Shadow Ridge Base', 'Qiryat Bialik');
insert into BASE (baseid, basename, location_)
values (693404, 'Iron Fortress', 'Qiryat Yam');
insert into BASE (baseid, basename, location_)
values (308304, 'Shadow Ridge Base', 'Qiryat Ata');
insert into BASE (baseid, basename, location_)
values (179203, 'Spartan Citadel', 'Beer Sheva');
insert into BASE (baseid, basename, location_)
values (171641, 'Iron Fortress', 'Kfar Saba');
insert into BASE (baseid, basename, location_)
values (965241, 'Viper Valley Base', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (101552, 'Spartan Citadel', 'Qiryat Motzkin');
insert into BASE (baseid, basename, location_)
values (889116, 'Thunderbolt Barracks', 'Tiberias');
insert into BASE (baseid, basename, location_)
values (169180, 'Iron Fortress', 'Petah Tikva');
insert into BASE (baseid, basename, location_)
values (722146, 'Lion''s Den', 'Dimona');
insert into BASE (baseid, basename, location_)
values (92010, 'Shadow Ridge Base', 'Kiryat Gat');
insert into BASE (baseid, basename, location_)
values (63195, 'Phoenix Stronghold', 'Yavne');
insert into BASE (baseid, basename, location_)
values (822433, 'Shadow Ridge Base', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (562323, 'Wolfpack Camp', 'Haifa');
insert into BASE (baseid, basename, location_)
values (53596, 'Wolfpack Camp', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (869536, 'Phoenix Stronghold', 'Ashdod');
insert into BASE (baseid, basename, location_)
values (328612, 'Spartan Citadel', 'Nahariya');
insert into BASE (baseid, basename, location_)
values (598313, 'Thunderstrike Outpost', 'Eilat');
insert into BASE (baseid, basename, location_)
values (26714, 'Viper Valley Base', 'Qiryat Gat');
insert into BASE (baseid, basename, location_)
values (939776, 'Spartan Citadel', 'Or Yehuda');
insert into BASE (baseid, basename, location_)
values (969197, 'Spartan Citadel', 'Yavne');
commit;
prompt 500 records loaded
prompt Loading SOLDIER...
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (140337, 'Arthur Miller', 'Corporal', to_date('19-11-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (958031, 'Diana Medina', 'Corporal', to_date('03-03-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (475353, 'Sarah Serrano', 'Lieutenant', to_date('18-03-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (333934, 'Danielle Nelson', 'Sergeant', to_date('05-07-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (964844, 'Paul Stokes', 'Corporal', to_date('23-06-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (569011, 'Robert Hernandez', 'Lieutenant', to_date('10-07-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (591819, 'Andrew Vasquez', 'Corporal', to_date('06-09-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (831379, 'Christina Cross', 'Sergeant', to_date('13-06-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (380172, 'Jamie Valentine', 'Sergeant', to_date('29-01-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (557849, 'Dale Murillo', 'Private', to_date('03-03-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (997430, 'Jason Richards', 'Sergeant', to_date('23-03-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (593019, 'Jerry Graham', 'Sergeant', to_date('16-09-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (551005, 'George Miller', 'Captain', to_date('05-02-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (950895, 'Melanie Pierce', 'Corporal', to_date('14-02-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (161141, 'Christopher Kennedy', 'Private', to_date('29-11-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (554170, 'Nathan Dougherty', 'Lieutenant', to_date('24-09-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (711090, 'Travis Robertson', 'Corporal', to_date('22-07-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (155952, 'Dawn Mills', 'Corporal', to_date('01-03-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (112644, 'Teresa Hicks', 'Corporal', to_date('08-06-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (755659, 'Anne Curtis', 'Corporal', to_date('26-08-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (889409, 'Jonathan Smith', 'Corporal', to_date('14-07-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (328827, 'Brandi Moreno', 'Corporal', to_date('22-03-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (411649, 'Jamie Stephens', 'Captain', to_date('20-12-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (589824, 'Jenna Marshall', 'Corporal', to_date('29-08-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (647570, 'Penny Kline', 'Sergeant', to_date('04-02-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (996704, 'Ryan Lyons', 'Sergeant', to_date('27-07-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (644325, 'Tiffany Baker', 'Captain', to_date('20-01-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (529972, 'William Sheppard', 'Lieutenant', to_date('12-01-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (681635, 'Lisa Patterson', 'Sergeant', to_date('21-05-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (433646, 'Pamela Cook', 'Lieutenant', to_date('07-04-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (558672, 'Stacey Cortez', 'Sergeant', to_date('25-09-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (492453, 'Jennifer Carr MD', 'Sergeant', to_date('27-09-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (183222, 'Morgan Wilson', 'Lieutenant', to_date('18-09-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (308204, 'Eric Parsons', 'Private', to_date('17-11-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (833842, 'James Warren', 'Captain', to_date('16-08-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (707368, 'Ms. Sheila Oconnell', 'Lieutenant', to_date('08-12-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (579470, 'Cynthia Greene', 'Lieutenant', to_date('15-11-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (126119, 'Joshua Weeks', 'Private', to_date('27-12-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (826275, 'Beth Shaw', 'Captain', to_date('26-06-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (943556, 'Mark Johnson', 'Corporal', to_date('02-07-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (425712, 'Xavier Obrien', 'Lieutenant', to_date('28-10-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (583667, 'Danielle Williamson', 'Corporal', to_date('26-10-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (583116, 'Alicia Smith', 'Lieutenant', to_date('16-04-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (608749, 'Sara Johnson', 'Private', to_date('12-08-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (953309, 'Ms. Donna Thompson MD', 'Captain', to_date('25-01-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (296574, 'Dawn Gomez', 'Sergeant', to_date('10-01-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (515797, 'Patrick Johnson', 'Captain', to_date('07-12-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (934824, 'Nicholas Hudson', 'Captain', to_date('09-09-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (875446, 'Mary Nicholson', 'Sergeant', to_date('06-08-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (337566, 'Darin Holder', 'Corporal', to_date('05-12-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (130363, 'Brianna Bauer', 'Captain', to_date('20-11-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (552414, 'Jamie Kim', 'Corporal', to_date('08-12-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (654041, 'Derek Reed', 'Lieutenant', to_date('28-09-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (155051, 'Richard Walker', 'Captain', to_date('12-01-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (125980, 'Tracy Randolph', 'Lieutenant', to_date('13-06-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (443759, 'Steven Holland', 'Lieutenant', to_date('25-03-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (613903, 'Dr. Stephanie Guzman MD', 'Sergeant', to_date('18-09-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (860716, 'Sean Kemp', 'Captain', to_date('25-12-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (270239, 'Kevin Flynn', 'Private', to_date('04-02-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (661367, 'Dawn Lee', 'Corporal', to_date('19-05-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (133479, 'Angel Moran', 'Sergeant', to_date('07-02-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (269910, 'Alexandra Cunningham', 'Captain', to_date('27-08-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (791625, 'Krystal Fernandez', 'Corporal', to_date('02-08-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (983154, 'Sophia Jones', 'Private', to_date('01-01-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (789069, 'Christina Mcdowell', 'Private', to_date('23-09-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (809906, 'Rachel Pierce', 'Private', to_date('14-02-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (721870, 'Ann Harris', 'Corporal', to_date('31-07-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (668976, 'Brian Griffin', 'Lieutenant', to_date('01-04-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (373280, 'Cassandra Washington', 'Lieutenant', to_date('03-11-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (477645, 'Amanda White', 'Corporal', to_date('30-12-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (509071, 'Matthew Lambert', 'Private', to_date('12-12-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (535461, 'Melissa Thompson', 'Sergeant', to_date('28-07-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (459990, 'Nancy Sanchez', 'Lieutenant', to_date('15-07-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (404564, 'Amanda Ross', 'Lieutenant', to_date('12-12-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (523408, 'Chase Cisneros', 'Corporal', to_date('13-10-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (264063, 'Patrick Logan', 'Corporal', to_date('15-01-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (950507, 'Ernest Kelly', 'Corporal', to_date('29-10-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (201485, 'Joel Fowler', 'Corporal', to_date('08-09-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (644729, 'Michael Lozano', 'Lieutenant', to_date('20-07-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (141253, 'Stephanie Zimmerman', 'Captain', to_date('13-08-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (747321, 'Martin Dyer', 'Corporal', to_date('23-11-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (168414, 'Philip Calhoun', 'Captain', to_date('04-09-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (449775, 'Craig Mcguire', 'Lieutenant', to_date('06-08-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (879065, 'Cindy Ferguson', 'Captain', to_date('06-04-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (512844, 'Susan Carpenter', 'Sergeant', to_date('14-10-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (689540, 'Dominique Anderson', 'Lieutenant', to_date('04-04-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (134819, 'David Newton', 'Sergeant', to_date('10-10-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (836089, 'Kevin Allen', 'Corporal', to_date('26-10-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (918638, 'Larry Pugh', 'Corporal', to_date('22-01-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (626060, 'David Gibson', 'Corporal', to_date('08-07-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (337511, 'Don Kim', 'Lieutenant', to_date('05-06-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (869967, 'Jamie Brown', 'Sergeant', to_date('19-12-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (639219, 'Cheyenne Johnson', 'Lieutenant', to_date('18-08-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (797118, 'Benjamin Chavez', 'Sergeant', to_date('27-02-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (576839, 'Natasha Wilson DVM', 'Lieutenant', to_date('13-08-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (912112, 'Lisa Austin', 'Private', to_date('05-05-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (738920, 'Isaac Allen', 'Captain', to_date('09-12-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (460885, 'Jeffrey May', 'Sergeant', to_date('15-03-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (471300, 'Mr. John Parker', 'Sergeant', to_date('20-08-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (211880, 'Willie Gardner', 'Captain', to_date('26-03-2002', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (475298, 'Jennifer Foster', 'Captain', to_date('24-10-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (183723, 'Diane Barnes', 'Lieutenant', to_date('28-09-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (312279, 'Ronald Little', 'Lieutenant', to_date('31-05-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (643759, 'Cindy Flores', 'Lieutenant', to_date('06-03-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (261271, 'Christine Harris MD', 'Sergeant', to_date('12-03-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (162853, 'Megan Sweeney', 'Captain', to_date('15-04-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (146990, 'Julie Martin', 'Sergeant', to_date('14-05-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (582670, 'Michael Lloyd', 'Lieutenant', to_date('13-12-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (577026, 'Timothy Hickman', 'Corporal', to_date('27-04-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (954064, 'Melissa Combs', 'Corporal', to_date('02-08-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (724219, 'Sharon Rogers PhD', 'Lieutenant', to_date('08-06-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (460464, 'Dr. Craig Bridges', 'Lieutenant', to_date('28-04-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (962554, 'Jacob Rodriguez', 'Private', to_date('02-02-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (327285, 'Zachary Roberts', 'Private', to_date('07-06-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (479374, 'Jose Williams', 'Private', to_date('07-12-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (575615, 'Renee Leonard', 'Corporal', to_date('14-07-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (442243, 'Amber Brown MD', 'Sergeant', to_date('10-03-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (280890, 'Lauren Williams', 'Private', to_date('21-08-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (773019, 'Michael Wright', 'Private', to_date('21-09-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (855891, 'Robert Webb', 'Private', to_date('15-05-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (904407, 'Joseph Murphy', 'Corporal', to_date('30-08-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (859561, 'Brian Torres', 'Sergeant', to_date('10-09-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (703114, 'William Morgan', 'Captain', to_date('08-03-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (750281, 'Erica Rivera', 'Corporal', to_date('21-03-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (244664, 'Pamela Sullivan', 'Captain', to_date('12-03-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (408297, 'John Castillo', 'Sergeant', to_date('11-01-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (221490, 'Kevin Mays', 'Captain', to_date('04-03-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (528682, 'Denise Green', 'Captain', to_date('22-08-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (244546, 'Andrea Maddox', 'Lieutenant', to_date('09-08-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (633275, 'Alexander Ward', 'Private', to_date('15-07-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (833650, 'Michelle Bush', 'Sergeant', to_date('29-10-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (843735, 'Kevin Gross', 'Private', to_date('25-01-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (495073, 'Laura Kelley', 'Corporal', to_date('05-05-2006', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (513153, 'James Ramos', 'Lieutenant', to_date('20-06-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (478332, 'Brent Scott', 'Corporal', to_date('04-08-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (169789, 'Matthew Norton', 'Lieutenant', to_date('13-11-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (760971, 'William Edwards', 'Corporal', to_date('22-08-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (109331, 'Joshua Hansen', 'Captain', to_date('14-06-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (901304, 'Stephanie Flores', 'Private', to_date('04-09-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (235449, 'Charles Dennis', 'Corporal', to_date('21-05-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (589388, 'Erica Higgins', 'Captain', to_date('17-04-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (651661, 'Nicole Garcia', 'Sergeant', to_date('11-11-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (902441, 'Theresa Santana', 'Lieutenant', to_date('17-12-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (699268, 'Joseph Barnes', 'Captain', to_date('24-03-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (491281, 'Michael Armstrong', 'Corporal', to_date('26-01-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (981509, 'Brett Weber', 'Captain', to_date('26-10-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (672620, 'Janet Gonzalez', 'Sergeant', to_date('31-01-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (876809, 'Richard Lamb', 'Sergeant', to_date('16-02-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (586510, 'Jason Bradshaw', 'Private', to_date('18-12-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (182637, 'Laura Lopez', 'Captain', to_date('22-06-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (644535, 'Jonathan Mata', 'Corporal', to_date('01-02-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (394902, 'Robert Rodriguez', 'Corporal', to_date('01-07-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (541094, 'Morgan Turner', 'Corporal', to_date('05-04-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (184598, 'Sharon Rogers', 'Captain', to_date('03-05-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (853031, 'Juan Bennett', 'Captain', to_date('12-09-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (748949, 'Erin Johnson', 'Private', to_date('18-09-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (998897, 'Ashley White', 'Sergeant', to_date('18-11-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (601668, 'Christine Walters', 'Private', to_date('14-06-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (593954, 'Deborah Smith', 'Corporal', to_date('08-10-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (294589, 'Ashley Bailey', 'Sergeant', to_date('10-04-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (221565, 'Jesus Lewis', 'Lieutenant', to_date('04-06-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (960929, 'Edward Curtis', 'Private', to_date('29-09-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (658314, 'Kim Johnson', 'Private', to_date('16-10-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (428852, 'Miguel Peck', 'Lieutenant', to_date('01-11-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (953250, 'Sophia Olson', 'Lieutenant', to_date('05-11-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (712415, 'Margaret Blake', 'Sergeant', to_date('20-07-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (584529, 'Kyle Bennett', 'Corporal', to_date('27-01-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (291468, 'Shannon Higgins', 'Sergeant', to_date('06-03-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (222100, 'Alexander Solis', 'Captain', to_date('31-03-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (435484, 'Brian Jackson', 'Sergeant', to_date('17-02-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (778397, 'Jessica Collier', 'Private', to_date('09-03-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (327656, 'Mark Johnson', 'Lieutenant', to_date('11-12-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (295065, 'Michael Ramos', 'Captain', to_date('23-04-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (324630, 'Jacqueline Gill', 'Captain', to_date('29-05-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (290299, 'Heidi Floyd', 'Captain', to_date('19-03-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (823287, 'John Silva', 'Lieutenant', to_date('26-10-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (363343, 'Dr. Jessica Evans DDS', 'Corporal', to_date('01-11-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (531874, 'Kristina Mendoza', 'Lieutenant', to_date('27-04-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (937168, 'Stephanie Carrillo', 'Private', to_date('03-04-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (900955, 'John Campbell', 'Corporal', to_date('09-03-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (160706, 'Rebecca Martinez', 'Captain', to_date('06-04-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (572415, 'Vincent Smith', 'Lieutenant', to_date('05-07-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (938809, 'Amanda Pruitt', 'Corporal', to_date('29-04-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (778333, 'Spencer Perez', 'Captain', to_date('21-06-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (944932, 'Brenda Hayes', 'Sergeant', to_date('03-04-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (810504, 'Troy Larson', 'Lieutenant', to_date('24-08-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (756210, 'Anthony Harris', 'Lieutenant', to_date('26-08-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (259018, 'Kelly Avery', 'Captain', to_date('10-03-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (511000, 'Juan Reilly', 'Sergeant', to_date('19-01-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (887554, 'Stacy Gilbert', 'Corporal', to_date('06-07-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (500379, 'Donna Anderson', 'Sergeant', to_date('19-01-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (908516, 'Maria Espinoza', 'Corporal', to_date('05-01-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (469386, 'Amber Chapman', 'Lieutenant', to_date('27-08-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (170823, 'Kristen Watson', 'Private', to_date('12-04-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (462687, 'Kevin Wood', 'Sergeant', to_date('01-06-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (201618, 'Jessica Marquez', 'Lieutenant', to_date('03-09-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (219861, 'Jasmine Kirby', 'Private', to_date('10-05-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (259579, 'Stephanie Sanchez', 'Captain', to_date('25-03-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (673839, 'Michael Conway', 'Corporal', to_date('14-05-2006', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (225335, 'John Robertson', 'Lieutenant', to_date('11-09-1989', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (961833, 'Joseph Glover', 'Captain', to_date('04-03-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (833922, 'Rhonda Horton', 'Lieutenant', to_date('03-10-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (674497, 'Mark Melendez', 'Private', to_date('07-10-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (844333, 'Charles Huynh', 'Sergeant', to_date('14-12-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (540193, 'Michael Jones', 'Corporal', to_date('19-03-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (630285, 'Justin Meyer', 'Captain', to_date('19-07-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (104524, 'Christina Ochoa', 'Lieutenant', to_date('16-03-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (360765, 'Tina Johnson', 'Captain', to_date('22-04-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (116436, 'Nicole Tanner MD', 'Corporal', to_date('24-05-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (781031, 'Jacqueline Farmer', 'Captain', to_date('03-02-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (945009, 'Jessica Lawrence', 'Sergeant', to_date('30-05-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (167083, 'Jessica Mckenzie', 'Corporal', to_date('07-05-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (905574, 'Keith White', 'Captain', to_date('06-08-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (133272, 'Courtney West', 'Captain', to_date('26-01-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (611570, 'Kimberly Graham', 'Corporal', to_date('11-02-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (438559, 'Gary Little', 'Corporal', to_date('20-12-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (254091, 'Thomas Clark', 'Corporal', to_date('25-11-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (267923, 'Kevin Beasley', 'Corporal', to_date('05-02-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (192335, 'Michael Cook', 'Captain', to_date('21-05-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (406655, 'James Moon', 'Lieutenant', to_date('18-11-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (185132, 'Christian Harris', 'Captain', to_date('23-08-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (388238, 'Chris Johnson', 'Lieutenant', to_date('13-02-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (216942, 'Emily Anthony', 'Sergeant', to_date('15-10-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (762701, 'Sarah Wallace', 'Corporal', to_date('25-01-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (801207, 'Melanie Bernard', 'Corporal', to_date('15-09-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (602541, 'Stacy Hall', 'Corporal', to_date('18-10-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (834478, 'Traci Schroeder', 'Sergeant', to_date('26-06-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (757015, 'Karen Moore', 'Captain', to_date('01-02-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (759116, 'Darlene Salazar', 'Lieutenant', to_date('08-03-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (367283, 'Angela Harmon', 'Captain', to_date('01-08-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (649035, 'Mrs. Amanda Nelson', 'Sergeant', to_date('25-11-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (297322, 'Lindsey Morris', 'Private', to_date('22-03-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (543413, 'Deborah Garrison', 'Lieutenant', to_date('25-03-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (301292, 'Benjamin Tate', 'Captain', to_date('25-08-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (775055, 'Heather Solomon', 'Private', to_date('01-10-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (117557, 'David Hernandez', 'Lieutenant', to_date('30-05-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (761104, 'Walter Rojas', 'Corporal', to_date('25-01-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (583537, 'Sheryl Martin', 'Captain', to_date('23-03-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (168097, 'Cody Moody', 'Private', to_date('21-09-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (366932, 'Deborah Roth', 'Captain', to_date('20-09-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (945783, 'Sean Walters', 'Captain', to_date('05-02-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (933319, 'Jason Aguilar', 'Private', to_date('04-04-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (110069, 'Mary Warren', 'Lieutenant', to_date('19-11-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (641147, 'Amanda Wilkerson', 'Lieutenant', to_date('07-06-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (345377, 'Savannah Leonard', 'Lieutenant', to_date('25-01-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (374180, 'Alan Martin', 'Lieutenant', to_date('26-06-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (609389, 'Justin Green', 'Corporal', to_date('25-10-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (117418, 'Mark Luna', 'Lieutenant', to_date('21-12-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (207346, 'Joseph Mcgee', 'Corporal', to_date('07-02-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (815242, 'Justin Parker', 'Captain', to_date('30-03-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (717850, 'Marc Ellison', 'Corporal', to_date('23-07-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (429637, 'William Rodriguez', 'Sergeant', to_date('02-04-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (307338, 'John Walker', 'Captain', to_date('11-02-2006', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (309024, 'Robert Brooks', 'Private', to_date('03-11-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (639295, 'Glenn Fischer', 'Sergeant', to_date('23-01-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (484281, 'Veronica Mendez', 'Captain', to_date('20-11-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (836895, 'Sandra Adams', 'Lieutenant', to_date('12-10-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (783416, 'Paul Williams', 'Corporal', to_date('11-09-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (111613, 'Robin Brown', 'Private', to_date('24-01-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (613895, 'Jimmy Jackson', 'Lieutenant', to_date('28-02-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (419983, 'Jacqueline Hart', 'Corporal', to_date('29-03-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (827713, 'Todd Little', 'Private', to_date('25-04-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (527834, 'John Hester', 'Sergeant', to_date('04-05-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (430887, 'Stephanie Romero', 'Lieutenant', to_date('07-02-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (391603, 'Timothy Foster', 'Sergeant', to_date('18-09-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (175164, 'Charles Gibson', 'Sergeant', to_date('18-02-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (673752, 'Mary Ross', 'Corporal', to_date('24-07-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (588081, 'Joshua Miller', 'Sergeant', to_date('25-12-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (529093, 'John Obrien', 'Private', to_date('10-08-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (905033, 'Katherine Heath', 'Lieutenant', to_date('11-04-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (443754, 'Melissa West', 'Corporal', to_date('06-11-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (111677, 'Joe Matthews', 'Corporal', to_date('18-11-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (335180, 'Lisa Parker', 'Private', to_date('01-09-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (669976, 'Karen Newton', 'Corporal', to_date('24-05-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (873867, 'Gregory Oneill', 'Private', to_date('04-03-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (962572, 'Jason Hill', 'Sergeant', to_date('16-10-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (278049, 'Jonathan Fox', 'Private', to_date('30-01-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (223329, 'Michael Rodriguez', 'Sergeant', to_date('27-06-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (756301, 'Alexandra Lee', 'Captain', to_date('14-09-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (743006, 'Emily Fuentes', 'Corporal', to_date('24-09-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (458521, 'Raymond Romero', 'Corporal', to_date('12-01-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (880066, 'Michael Harris', 'Sergeant', to_date('24-07-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (682840, 'Chad Reyes', 'Private', to_date('08-11-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (427631, 'Taylor Harris', 'Corporal', to_date('16-08-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (135869, 'Ellen Madden', 'Private', to_date('11-07-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (256765, 'Travis Duarte', 'Corporal', to_date('24-01-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (754814, 'Douglas Rose', 'Private', to_date('07-11-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (548719, 'Nathan Foster', 'Private', to_date('13-10-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (959939, 'Melissa Ford', 'Captain', to_date('25-02-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (361922, 'Carl Stevens', 'Captain', to_date('01-09-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (867338, 'Andrew Nelson', 'Corporal', to_date('07-12-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (852809, 'Christine Taylor', 'Corporal', to_date('17-10-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (445250, 'Sarah Moran', 'Lieutenant', to_date('14-03-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (661423, 'Katherine Jefferson', 'Private', to_date('02-02-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (719462, 'Thomas Powell', 'Lieutenant', to_date('27-06-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (359971, 'Gabrielle Bennett MD', 'Private', to_date('18-02-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (471652, 'Jason Warren', 'Sergeant', to_date('03-10-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (331126, 'Donna Cooper', 'Sergeant', to_date('30-07-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (852186, 'Stephanie Allen', 'Captain', to_date('31-03-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (200551, 'Ryan Spencer', 'Corporal', to_date('05-05-2004', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (666601, 'Jeff James', 'Captain', to_date('11-11-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (760757, 'Elizabeth Lewis', 'Lieutenant', to_date('05-02-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (808089, 'Rebecca Roberts', 'Captain', to_date('25-12-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (297396, 'Thomas Edwards', 'Corporal', to_date('14-10-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (796195, 'Gregory Lindsey', 'Sergeant', to_date('25-12-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (912913, 'Kevin Kemp', 'Sergeant', to_date('08-02-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (253900, 'Benjamin Roman', 'Private', to_date('16-08-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (765676, 'Samantha Rivera', 'Corporal', to_date('29-04-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (277150, 'Garrett Williamson', 'Lieutenant', to_date('30-07-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (461632, 'Stephanie Kirk', 'Private', to_date('22-05-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (310213, 'Anthony Wilson', 'Lieutenant', to_date('01-12-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (188447, 'Amanda Davis', 'Private', to_date('12-05-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (606688, 'George Bennett', 'Lieutenant', to_date('01-12-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (461672, 'Michael Dickson', 'Sergeant', to_date('18-05-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (668082, 'David Hunt', 'Lieutenant', to_date('20-02-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (181864, 'Mark Olson', 'Private', to_date('27-12-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (967520, 'James Johnson', 'Private', to_date('24-08-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (684174, 'Nancy Smith', 'Captain', to_date('14-07-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (355186, 'Mason Douglas', 'Corporal', to_date('27-01-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (436276, 'Steven Nunez', 'Captain', to_date('03-08-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (873672, 'Veronica Morton', 'Sergeant', to_date('07-05-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (134705, 'Rhonda Robinson', 'Private', to_date('16-04-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (569743, 'Rebecca Smith', 'Private', to_date('24-03-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (847204, 'Bianca Robinson', 'Sergeant', to_date('09-01-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (772498, 'Katherine Gray', 'Sergeant', to_date('09-10-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (155332, 'Michelle Glenn', 'Captain', to_date('27-02-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (475943, 'Alexandria Sweeney', 'Lieutenant', to_date('13-04-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (513436, 'Ryan Johnston', 'Sergeant', to_date('10-10-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (748168, 'Christopher Webb', 'Lieutenant', to_date('05-12-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (758228, 'Sharon Perez', 'Corporal', to_date('27-03-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (611558, 'Jenny Collins', 'Private', to_date('23-01-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (202948, 'Caitlin Smith', 'Sergeant', to_date('26-06-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (282991, 'Roger Evans', 'Corporal', to_date('12-09-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (464468, 'Robert Leonard', 'Lieutenant', to_date('12-03-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (644855, 'Miss Kendra Rosales', 'Lieutenant', to_date('29-08-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (454615, 'Terri Villa', 'Private', to_date('03-03-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (261560, 'Stephanie Henderson', 'Private', to_date('12-11-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (203649, 'Lori Harrison', 'Lieutenant', to_date('11-02-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (373297, 'Bryan Briggs', 'Lieutenant', to_date('13-12-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (795399, 'Jeffrey Santana', 'Private', to_date('02-06-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (639023, 'Christy Thompson', 'Captain', to_date('22-05-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (848331, 'Brandon Gibson', 'Captain', to_date('02-08-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (773963, 'Hannah Olson', 'Sergeant', to_date('19-09-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (532936, 'Theresa Johnston', 'Sergeant', to_date('28-09-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (239891, 'Becky Dennis', 'Sergeant', to_date('17-08-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (802638, 'Theodore James', 'Private', to_date('06-12-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (513590, 'Charles Sanchez', 'Private', to_date('15-07-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (773780, 'Diana Oneill', 'Lieutenant', to_date('28-01-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (224328, 'Brenda Briggs', 'Private', to_date('22-09-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (335094, 'Joshua Mclaughlin', 'Lieutenant', to_date('25-12-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (102587, 'Heather Robinson', 'Lieutenant', to_date('20-03-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (686752, 'Denise Mcguire', 'Corporal', to_date('31-07-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (788858, 'Michael Santana', 'Private', to_date('01-04-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (232017, 'James Walker', 'Corporal', to_date('25-07-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (617509, 'Christopher Murray', 'Lieutenant', to_date('13-04-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (657576, 'Holly Brown', 'Sergeant', to_date('24-01-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (848823, 'Dr. Donna Mclean', 'Lieutenant', to_date('25-10-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (297457, 'Betty Page', 'Lieutenant', to_date('29-04-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (101693, 'Edward Lee', 'Lieutenant', to_date('19-12-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (895583, 'Jacqueline Alexander', 'Corporal', to_date('02-09-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (396576, 'Keith Li', 'Corporal', to_date('11-11-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (212352, 'Evelyn Morris', 'Corporal', to_date('10-07-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (706453, 'Paul Ortiz', 'Captain', to_date('03-02-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (834007, 'Paul Ryan', 'Lieutenant', to_date('03-01-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (283856, 'William Estrada', 'Sergeant', to_date('19-12-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (126042, 'Stacie Lewis', 'Sergeant', to_date('31-10-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (394735, 'Stephanie Smith', 'Private', to_date('11-10-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (819969, 'Eddie Carpenter', 'Lieutenant', to_date('22-11-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (801685, 'Stephen Barnes', 'Captain', to_date('15-09-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (361200, 'Bryan Ramirez', 'Lieutenant', to_date('05-12-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (208026, 'Brandon Jones', 'Corporal', to_date('06-11-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (716113, 'Dustin Lang', 'Captain', to_date('06-03-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (327996, 'Victor Lowery', 'Private', to_date('25-10-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (267796, 'Trevor Perez', 'Private', to_date('20-04-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (266803, 'Anthony Myers', 'Sergeant', to_date('24-08-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (632977, 'Karen Cruz', 'Corporal', to_date('02-03-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (889684, 'Patrick Ramirez', 'Captain', to_date('11-02-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (442084, 'Catherine Poole', 'Lieutenant', to_date('19-01-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (521884, 'Bryan Boyer', 'Lieutenant', to_date('28-07-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (674408, 'April Smith', 'Private', to_date('23-12-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (780542, 'Andrew Roberts', 'Private', to_date('26-02-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (477362, 'Steven Hudson', 'Corporal', to_date('04-11-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (389015, 'Frederick Baker', 'Lieutenant', to_date('29-02-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (884511, 'Louis Santiago', 'Corporal', to_date('31-12-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (959171, 'Angela Bailey', 'Lieutenant', to_date('08-03-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (373627, 'Marilyn Rhodes', 'Lieutenant', to_date('30-09-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (676794, 'Phillip Ward', 'Lieutenant', to_date('26-10-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (484290, 'Mark Dunn', 'Captain', to_date('03-03-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (931157, 'Stephen Sullivan', 'Lieutenant', to_date('10-11-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (177807, 'Victoria Lyons', 'Corporal', to_date('28-07-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (755078, 'Angela Simmons', 'Captain', to_date('07-08-2004', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (277712, 'Colleen Vaughan', 'Sergeant', to_date('20-05-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (420248, 'Rachel Davila', 'Lieutenant', to_date('16-12-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (851748, 'Lisa Nelson', 'Captain', to_date('31-05-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (920436, 'Kenneth Cantrell', 'Corporal', to_date('04-09-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (197432, 'Jason Johnson', 'Corporal', to_date('07-09-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (326597, 'Gerald Mckay', 'Private', to_date('09-06-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (240771, 'Brenda Freeman', 'Lieutenant', to_date('29-01-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (929656, 'Joshua Cunningham', 'Lieutenant', to_date('14-12-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (413001, 'Darius Higgins', 'Captain', to_date('18-04-1985', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (214652, 'Richard Smith', 'Corporal', to_date('03-07-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (643143, 'Jennifer Young', 'Sergeant', to_date('29-12-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (715495, 'Brady Harris', 'Sergeant', to_date('05-06-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (372614, 'Thomas Price', 'Private', to_date('06-03-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (536888, 'Amanda Powers', 'Sergeant', to_date('06-12-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (561065, 'David Miller', 'Lieutenant', to_date('19-05-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (390576, 'Michael Williams', 'Lieutenant', to_date('11-11-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (165503, 'Jacob Smith', 'Lieutenant', to_date('28-05-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (794199, 'Brian Jacobs', 'Private', to_date('16-09-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (409531, 'Bruce Christian', 'Sergeant', to_date('21-03-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (114797, 'Micheal Lopez', 'Captain', to_date('20-08-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (570342, 'Scott Wilson', 'Private', to_date('28-09-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (894953, 'Dr. Molly Quinn DDS', 'Lieutenant', to_date('08-10-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (507405, 'Kelly Clark', 'Private', to_date('09-07-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (591927, 'Kerry Flores', 'Corporal', to_date('03-09-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (811403, 'Lisa Cole', 'Lieutenant', to_date('01-04-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (430763, 'Zachary Martin', 'Lieutenant', to_date('27-06-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (354993, 'Timothy Ford', 'Lieutenant', to_date('22-02-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (743551, 'Lauren Cox', 'Captain', to_date('10-10-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (182415, 'Joshua Gibson', 'Lieutenant', to_date('17-03-2006', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (810237, 'Marc Moore', 'Sergeant', to_date('14-10-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (275015, 'Gregory Lyons', 'Private', to_date('04-08-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (234823, 'Emily Johnson', 'Captain', to_date('24-08-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (788430, 'Daniel Morris', 'Private', to_date('18-01-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (920445, 'Michael Lane', 'Lieutenant', to_date('07-10-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (333020, 'Teresa English', 'Sergeant', to_date('18-07-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (628314, 'Emily Long', 'Corporal', to_date('13-09-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (805249, 'Mark Harper', 'Lieutenant', to_date('14-05-1987', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (203918, 'Betty Lopez', 'Captain', to_date('29-05-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (447423, 'Justin Morris', 'Sergeant', to_date('09-11-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (988131, 'Tony Scott', 'Captain', to_date('09-05-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (622626, 'Andrea Baker', 'Private', to_date('23-01-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (838212, 'Stacy Pham', 'Captain', to_date('15-12-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (827389, 'Jaime King', 'Lieutenant', to_date('09-08-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (446880, 'Regina Reyes', 'Captain', to_date('22-11-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (183912, 'Michael Schmidt', 'Lieutenant', to_date('23-07-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (907942, 'Michael Stevens', 'Sergeant', to_date('10-11-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (855354, 'Stephen Wade', 'Lieutenant', to_date('18-02-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (469937, 'Angela Martinez', 'Sergeant', to_date('06-06-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (313813, 'Larry Kim', 'Private', to_date('24-07-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (470454, 'Joel Hardy', 'Corporal', to_date('29-07-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (651520, 'Ricky Johns', 'Sergeant', to_date('13-07-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (688080, 'Cynthia Dillon', 'Captain', to_date('06-05-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (887322, 'Crystal Phillips', 'Lieutenant', to_date('12-12-1990', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (554050, 'Alexander White', 'Captain', to_date('17-04-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (157256, 'Matthew Foster', 'Sergeant', to_date('06-03-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (840081, 'Larry Dyer', 'Private', to_date('18-01-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (740158, 'Mark Steele', 'Corporal', to_date('17-05-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (338930, 'Michele Garcia', 'Captain', to_date('05-10-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (930744, 'Michael Proctor', 'Lieutenant', to_date('23-12-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (876301, 'Barbara Fox', 'Sergeant', to_date('18-03-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (857812, 'Andrew Ruiz', 'Corporal', to_date('16-03-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (108002, 'Rebecca Roberts', 'Lieutenant', to_date('16-06-1994', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (674205, 'Mary Ryan', 'Captain', to_date('22-03-2006', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (444711, 'Dr. John Mullins', 'Lieutenant', to_date('05-12-1999', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (862158, 'Mrs. Shelly Green', 'Captain', to_date('18-11-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (385229, 'Brandon Wong', 'Corporal', to_date('07-06-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (384076, 'Barbara Wells', 'Corporal', to_date('21-02-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (863669, 'Danielle Buckley', 'Private', to_date('25-06-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (250977, 'Ashley Grant', 'Captain', to_date('11-12-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (964156, 'James Farrell', 'Captain', to_date('05-04-1993', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (297345, 'Sheryl Peck', 'Captain', to_date('23-10-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (172383, 'Michael Rose', 'Sergeant', to_date('05-12-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (436580, 'Darlene Sullivan', 'Captain', to_date('19-05-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (540806, 'Brooke Lynch', 'Captain', to_date('06-07-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (345882, 'James Lopez', 'Corporal', to_date('19-08-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (130245, 'Jasmine Lewis', 'Captain', to_date('06-04-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (813975, 'Daniel Johnson', 'Captain', to_date('01-12-2003', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (591399, 'Michael Hoffman', 'Private', to_date('11-01-1998', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (743203, 'Carmen Cunningham', 'Lieutenant', to_date('21-05-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (180861, 'Lauren Stewart', 'Lieutenant', to_date('08-09-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (544948, 'Matthew Estrada', 'Private', to_date('28-05-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (918260, 'Tammy Mendoza DDS', 'Corporal', to_date('31-12-1995', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (485069, 'Kevin Haas', 'Lieutenant', to_date('08-09-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (895688, 'Joseph Fuller', 'Private', to_date('26-05-1984', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (763442, 'Holly Morris', 'Private', to_date('12-05-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (867047, 'Michael Lambert', 'Lieutenant', to_date('03-12-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (409051, 'Sean Kerr', 'Captain', to_date('24-02-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (726404, 'Andrew Patel', 'Lieutenant', to_date('08-01-2006', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (331283, 'Angela Li', 'Captain', to_date('19-08-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (908571, 'Antonio Harris', 'Captain', to_date('05-04-2000', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (961379, 'Bethany Erickson', 'Private', to_date('09-12-1988', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (623578, 'Beth Garrison', 'Corporal', to_date('19-02-1989', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (408590, 'Yesenia Stewart', 'Corporal', to_date('15-08-2005', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (422604, 'John Garrett', 'Captain', to_date('19-11-1991', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (580371, 'Renee Bowen', 'Lieutenant', to_date('26-10-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (901791, 'Louis Ramirez', 'Sergeant', to_date('29-04-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (718556, 'Chloe Johnson', 'Lieutenant', to_date('21-07-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (236610, 'Brittany Hunt', 'Lieutenant', to_date('21-12-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (831456, 'Carrie Johnson', 'Corporal', to_date('23-02-1986', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (694056, 'Gloria Price', 'Sergeant', to_date('12-09-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (474260, 'Bridget Russell', 'Captain', to_date('14-10-1983', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (369909, 'Janet Merritt', 'Captain', to_date('13-10-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (636674, 'Carlos Pacheco', 'Lieutenant', to_date('09-07-2001', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (678123, 'Ryan Thomas', 'Corporal', to_date('24-07-1985', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (983762, 'Manuel Smith', 'Private', to_date('26-01-1996', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (664989, 'Joseph Cardenas', 'Corporal', to_date('16-12-2002', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (107181, 'Mr. Brett Peters DDS', 'Captain', to_date('04-07-1992', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (440144, 'Robert Humphrey', 'Lieutenant', to_date('14-10-1997', 'dd-mm-yyyy'));
insert into SOLDIER (soldierid, name_, rank_, dateofbirth)
values (357713, 'Brandon Sullivan', 'Corporal', to_date('17-06-1992', 'dd-mm-yyyy'));
commit;
prompt 500 records loaded
prompt Loading VEHICLE...
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (414318, 'Pereh', to_date('26-03-1978', 'dd-mm-yyyy'), 'Under Repair', 657775);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (583224, 'Puma', to_date('15-12-2008', 'dd-mm-yyyy'), 'Deployed', 816153);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (953765, 'Merkava Mk.1', to_date('24-12-2000', 'dd-mm-yyyy'), 'Under Repair', 819635);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (778134, 'Doher', to_date('14-07-1986', 'dd-mm-yyyy'), 'Deployed', 568920);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (666262, 'Zibra', to_date('04-12-1986', 'dd-mm-yyyy'), 'Under Repair', 760245);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (573952, 'Doher', to_date('15-10-1980', 'dd-mm-yyyy'), 'Out of Service', 255941);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (278349, 'Wildcat', to_date('27-10-1997', 'dd-mm-yyyy'), 'Out of Service', 336796);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (127756, 'MANTIS', to_date('15-09-1998', 'dd-mm-yyyy'), 'Out of Service', 498703);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (924698, 'RBY Mk 1', to_date('18-11-1997', 'dd-mm-yyyy'), 'In Maintenance', 537740);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (941218, 'Mahatz', to_date('30-05-1984', 'dd-mm-yyyy'), 'Deployed', 488616);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (441945, 'Mahatz', to_date('08-08-2005', 'dd-mm-yyyy'), 'In Maintenance', 751023);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (497687, 'Tiran 5', to_date('14-11-1987', 'dd-mm-yyyy'), 'Out of Service', 716411);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (753544, 'Merkava Mk.3', to_date('13-11-1986', 'dd-mm-yyyy'), 'In Maintenance', 453395);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (849224, 'RAMTA RBY', to_date('04-03-2024', 'dd-mm-yyyy'), 'Deployed', 38757);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (879964, 'Merkava Mk.3', to_date('29-07-1998', 'dd-mm-yyyy'), 'Deployed', 895105);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (753283, 'Merkava Mk.4', to_date('13-02-2013', 'dd-mm-yyyy'), 'Active', 858128);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (618555, 'Nakpadon', to_date('19-01-1974', 'dd-mm-yyyy'), 'Deployed', 750472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (818531, 'Tiran 4', to_date('29-12-1984', 'dd-mm-yyyy'), 'Out of Service', 397261);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (531298, 'Merkava Mk.3', to_date('11-02-2022', 'dd-mm-yyyy'), 'Out of Service', 968173);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (265696, 'RAMTA RBY', to_date('13-05-1991', 'dd-mm-yyyy'), 'Under Repair', 756998);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (891425, 'Pereh', to_date('29-04-2006', 'dd-mm-yyyy'), 'Out of Service', 672678);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (349349, 'SandCat', to_date('19-05-1988', 'dd-mm-yyyy'), 'In Maintenance', 140504);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (426167, 'RAMTA RBY', to_date('05-09-2009', 'dd-mm-yyyy'), 'In Maintenance', 265293);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (417299, 'MANTAK', to_date('09-07-1973', 'dd-mm-yyyy'), 'Under Repair', 551900);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (827524, 'Machbet', to_date('12-07-1989', 'dd-mm-yyyy'), 'In Maintenance', 999177);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (277395, 'M88 Hercules', to_date('16-05-2018', 'dd-mm-yyyy'), 'In Maintenance', 612393);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (269226, 'M270 MLRS', to_date('20-06-1983', 'dd-mm-yyyy'), 'Active', 469677);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (346449, 'Keshet', to_date('06-09-2016', 'dd-mm-yyyy'), 'Out of Service', 741586);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (693231, 'Merkava Mk.1', to_date('23-01-2013', 'dd-mm-yyyy'), 'Active', 836206);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (179589, 'IDF Caterpillar D9', to_date('09-09-2012', 'dd-mm-yyyy'), 'Active', 45743);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (448399, 'Wolf Armored Vehicle', to_date('26-10-1986', 'dd-mm-yyyy'), 'Under Repair', 662779);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (899232, 'Doher', to_date('15-02-1978', 'dd-mm-yyyy'), 'In Maintenance', 659078);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (498889, 'Wolf Armored Vehicle', to_date('30-07-1971', 'dd-mm-yyyy'), 'Out of Service', 47886);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (469673, 'Magach 7', to_date('15-06-1984', 'dd-mm-yyyy'), 'Under Repair', 489684);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (962611, 'Keshet', to_date('10-01-2020', 'dd-mm-yyyy'), 'Under Repair', 767293);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (197992, 'Achzarit', to_date('16-11-1991', 'dd-mm-yyyy'), 'In Maintenance', 494318);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (799436, 'PULS', to_date('13-01-2005', 'dd-mm-yyyy'), 'In Maintenance', 277631);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (499329, 'Gaash', to_date('21-06-2011', 'dd-mm-yyyy'), 'Under Repair', 869536);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (893735, 'Magach 6', to_date('11-07-1979', 'dd-mm-yyyy'), 'Active', 623056);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (114715, 'M109 Doher', to_date('17-11-1997', 'dd-mm-yyyy'), 'In Maintenance', 772783);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (232339, 'Soltam M-71', to_date('21-07-2018', 'dd-mm-yyyy'), 'Out of Service', 455324);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (395523, 'Merkava Mk.2', to_date('26-05-1984', 'dd-mm-yyyy'), 'Out of Service', 17709);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (846261, 'M270 Smashing', to_date('20-10-1980', 'dd-mm-yyyy'), 'Out of Service', 263152);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (324259, 'Merkava Mk.3', to_date('11-01-2008', 'dd-mm-yyyy'), 'Under Repair', 856459);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (939511, 'ATMOS 2000', to_date('27-07-2020', 'dd-mm-yyyy'), 'Out of Service', 779320);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (785189, 'Humvee', to_date('08-03-1983', 'dd-mm-yyyy'), 'Out of Service', 364577);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (355515, 'Pereh', to_date('24-05-1978', 'dd-mm-yyyy'), 'In Maintenance', 524939);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (299513, 'Merkava Mk.2', to_date('13-06-2022', 'dd-mm-yyyy'), 'Out of Service', 154392);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (396511, 'Eitan', to_date('23-06-1975', 'dd-mm-yyyy'), 'Under Repair', 922330);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (814835, 'Achzarit', to_date('25-08-1977', 'dd-mm-yyyy'), 'Deployed', 120796);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (267165, 'Keshet', to_date('07-12-1986', 'dd-mm-yyyy'), 'Out of Service', 345685);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (361251, 'Keshet', to_date('25-04-1976', 'dd-mm-yyyy'), 'Under Repair', 963848);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (258784, 'David Light Armored Vehicle', to_date('28-07-1985', 'dd-mm-yyyy'), 'Active', 562323);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (896965, 'M270 Smashing', to_date('30-05-1993', 'dd-mm-yyyy'), 'In Maintenance', 74836);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (496964, 'Namer', to_date('03-08-1979', 'dd-mm-yyyy'), 'In Maintenance', 328059);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (351616, 'Merkava Mk.2', to_date('03-12-1988', 'dd-mm-yyyy'), 'Deployed', 856459);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (661551, 'IDF Caterpillar D9', to_date('04-07-1987', 'dd-mm-yyyy'), 'Under Repair', 661884);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (854683, 'M88 Hercules', to_date('08-04-1982', 'dd-mm-yyyy'), 'Deployed', 586970);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (983467, 'Sho''t Kal', to_date('26-03-2007', 'dd-mm-yyyy'), 'Deployed', 386597);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (644968, 'MANTIS', to_date('29-04-1991', 'dd-mm-yyyy'), 'In Maintenance', 377741);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (349886, 'Zibra', to_date('09-05-1995', 'dd-mm-yyyy'), 'Out of Service', 611059);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (862379, 'Sho''t Kal', to_date('18-11-1994', 'dd-mm-yyyy'), 'Under Repair', 869536);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (796324, 'Soltam M-71', to_date('10-01-1995', 'dd-mm-yyyy'), 'In Maintenance', 235479);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (784986, 'MANTAK', to_date('28-02-1982', 'dd-mm-yyyy'), 'In Maintenance', 816168);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (293134, 'Nakpadon', to_date('26-02-2021', 'dd-mm-yyyy'), 'Active', 352561);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (929512, 'M88 Hercules', to_date('25-08-2003', 'dd-mm-yyyy'), 'Out of Service', 160036);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (237817, 'Puma', to_date('11-01-1977', 'dd-mm-yyyy'), 'Under Repair', 357321);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (864399, 'Eyal', to_date('07-02-1988', 'dd-mm-yyyy'), 'In Maintenance', 21950);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (391262, 'Merkava Mk.1', to_date('02-11-1998', 'dd-mm-yyyy'), 'Deployed', 647973);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (647428, 'M270 MLRS', to_date('26-06-1973', 'dd-mm-yyyy'), 'Out of Service', 680356);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (569353, 'Nakpadon', to_date('29-03-2008', 'dd-mm-yyyy'), 'Active', 446760);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (542827, 'PULS', to_date('23-06-2000', 'dd-mm-yyyy'), 'Out of Service', 275277);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (988781, 'MANTIS', to_date('26-02-1983', 'dd-mm-yyyy'), 'In Maintenance', 345685);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (911685, 'M88 Hercules', to_date('06-07-2017', 'dd-mm-yyyy'), 'Deployed', 377741);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (525817, 'Nakpadon', to_date('11-05-1971', 'dd-mm-yyyy'), 'In Maintenance', 515315);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (124553, 'Sho''t Kal', to_date('29-10-1996', 'dd-mm-yyyy'), 'Active', 899020);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (687546, 'David Light Armored Vehicle', to_date('02-10-1971', 'dd-mm-yyyy'), 'Active', 734284);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (484578, 'Magach 7', to_date('16-08-1985', 'dd-mm-yyyy'), 'Deployed', 844289);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (826511, 'Soltam M-71', to_date('28-07-1984', 'dd-mm-yyyy'), 'Deployed', 642912);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (746186, 'M88 Hercules', to_date('02-01-1993', 'dd-mm-yyyy'), 'Active', 756864);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (583346, 'David Light Armored Vehicle', to_date('06-04-2002', 'dd-mm-yyyy'), 'Under Repair', 49918);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (926914, 'Gaash', to_date('15-04-2007', 'dd-mm-yyyy'), 'Out of Service', 895105);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (235824, 'Sho''t Kal', to_date('25-10-1997', 'dd-mm-yyyy'), 'In Maintenance', 989781);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (169882, 'Eitan', to_date('04-03-2017', 'dd-mm-yyyy'), 'Under Repair', 778941);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (977485, 'M270 Smashing', to_date('16-02-1981', 'dd-mm-yyyy'), 'Out of Service', 939572);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (619981, 'M109 Doher', to_date('30-03-1978', 'dd-mm-yyyy'), 'Under Repair', 524939);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (481999, 'RBY Mk 1', to_date('03-01-1990', 'dd-mm-yyyy'), 'Under Repair', 890899);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (282135, 'Wolf Armored Vehicle', to_date('16-09-2005', 'dd-mm-yyyy'), 'Active', 450193);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (694722, 'Sho''t Kal', to_date('30-10-2004', 'dd-mm-yyyy'), 'In Maintenance', 929761);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (938259, 'Magach 7', to_date('09-06-2001', 'dd-mm-yyyy'), 'Under Repair', 463085);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (467767, 'MANTIS', to_date('30-09-2006', 'dd-mm-yyyy'), 'Out of Service', 807194);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (167436, 'Puma', to_date('28-04-2001', 'dd-mm-yyyy'), 'Out of Service', 646102);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (516232, 'Mahatz', to_date('06-03-1978', 'dd-mm-yyyy'), 'Out of Service', 47639);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (979342, 'Sufa (Storm) Jeep', to_date('05-03-1989', 'dd-mm-yyyy'), 'Under Repair', 524939);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (414784, 'Zibra', to_date('16-01-1984', 'dd-mm-yyyy'), 'Out of Service', 445026);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (575217, 'Nakpadon', to_date('30-05-2001', 'dd-mm-yyyy'), 'Deployed', 62223);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (312794, 'M270 MLRS', to_date('23-08-1996', 'dd-mm-yyyy'), 'Deployed', 770115);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (295685, 'Tiran 5', to_date('03-03-2002', 'dd-mm-yyyy'), 'In Maintenance', 390291);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (793336, 'M88 Hercules', to_date('06-02-2010', 'dd-mm-yyyy'), 'Out of Service', 43092);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (855636, 'M88 Hercules', to_date('27-12-1999', 'dd-mm-yyyy'), 'In Maintenance', 714309);
commit;
prompt 100 records committed...
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (269579, 'PULS', to_date('19-06-1971', 'dd-mm-yyyy'), 'Out of Service', 273935);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (536795, 'Panther Command Vehicle', to_date('01-07-2021', 'dd-mm-yyyy'), 'Deployed', 734636);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (995385, 'SandCat', to_date('14-11-1992', 'dd-mm-yyyy'), 'In Maintenance', 858069);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (834828, 'Achzarit', to_date('22-10-2005', 'dd-mm-yyyy'), 'Active', 642912);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (418488, 'RBY Mk 1', to_date('05-10-2018', 'dd-mm-yyyy'), 'Under Repair', 709185);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (437415, 'Merkava Mk.4', to_date('11-10-2022', 'dd-mm-yyyy'), 'Active', 352561);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (254611, 'ATMOS 2000', to_date('13-12-1982', 'dd-mm-yyyy'), 'In Maintenance', 33710);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (652238, 'M270 MLRS', to_date('09-06-1982', 'dd-mm-yyyy'), 'Active', 865889);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (639753, 'Panther Command Vehicle', to_date('06-10-1982', 'dd-mm-yyyy'), 'Under Repair', 741586);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (325135, 'Nimda Shoet', to_date('26-03-1972', 'dd-mm-yyyy'), 'Deployed', 292308);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (214233, 'M109 Doher', to_date('27-11-2010', 'dd-mm-yyyy'), 'Deployed', 447820);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (333554, 'Humvee', to_date('30-10-1981', 'dd-mm-yyyy'), 'Deployed', 846536);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (692743, 'M270 MLRS', to_date('20-09-1994', 'dd-mm-yyyy'), 'Out of Service', 743851);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (682623, 'Humvee', to_date('02-05-2016', 'dd-mm-yyyy'), 'Active', 178961);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (394876, 'RAMTA RBY', to_date('04-05-1982', 'dd-mm-yyyy'), 'Out of Service', 750472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (974567, 'PULS', to_date('06-07-1982', 'dd-mm-yyyy'), 'Under Repair', 706400);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (886322, 'Machbet', to_date('01-12-2002', 'dd-mm-yyyy'), 'Active', 525734);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (598987, 'Eitan', to_date('03-09-1995', 'dd-mm-yyyy'), 'Under Repair', 633859);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (894515, 'SandCat', to_date('18-12-2010', 'dd-mm-yyyy'), 'Active', 305781);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (299345, 'David Light Armored Vehicle', to_date('25-08-1975', 'dd-mm-yyyy'), 'Out of Service', 921);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (756815, 'Humvee', to_date('20-05-2012', 'dd-mm-yyyy'), 'Deployed', 586970);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (526878, 'Merkava Mk.2', to_date('14-09-2021', 'dd-mm-yyyy'), 'Active', 312520);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (193718, 'IDF Caterpillar D9', to_date('25-06-1994', 'dd-mm-yyyy'), 'Active', 522468);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (459636, 'Merkava Mk.3', to_date('25-12-1972', 'dd-mm-yyyy'), 'Active', 612393);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (645912, 'M88 Hercules', to_date('09-01-2002', 'dd-mm-yyyy'), 'Deployed', 989717);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (565211, 'David Light Armored Vehicle', to_date('05-06-1997', 'dd-mm-yyyy'), 'Deployed', 751870);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (127443, 'Merkava Mk.4', to_date('13-10-2008', 'dd-mm-yyyy'), 'Deployed', 469677);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (628794, 'SandCat', to_date('17-01-1991', 'dd-mm-yyyy'), 'Under Repair', 859404);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (457259, 'Sho''t Kal', to_date('17-02-2008', 'dd-mm-yyyy'), 'Under Repair', 38757);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (431798, 'Tiran 5', to_date('01-08-1983', 'dd-mm-yyyy'), 'Under Repair', 683294);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (752523, 'Gaash', to_date('12-04-1999', 'dd-mm-yyyy'), 'In Maintenance', 770115);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (273848, 'Keshet', to_date('25-07-2011', 'dd-mm-yyyy'), 'Deployed', 21950);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (842346, 'Mahatz', to_date('16-12-1993', 'dd-mm-yyyy'), 'Deployed', 876383);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (371798, 'David Light Armored Vehicle', to_date('09-10-1997', 'dd-mm-yyyy'), 'Out of Service', 537740);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (333447, 'Sufa (Storm) Jeep', to_date('21-11-2018', 'dd-mm-yyyy'), 'Deployed', 277631);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (812556, 'Tiran 6', to_date('09-06-1972', 'dd-mm-yyyy'), 'Out of Service', 751870);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (416275, 'Wolf Armored Vehicle', to_date('16-05-1994', 'dd-mm-yyyy'), 'In Maintenance', 240754);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (397895, 'Zibra', to_date('25-02-2007', 'dd-mm-yyyy'), 'Active', 148881);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (839423, 'Keshet', to_date('03-07-1980', 'dd-mm-yyyy'), 'Out of Service', 847122);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (456142, 'Merkava Mk.4', to_date('13-08-2006', 'dd-mm-yyyy'), 'Out of Service', 913158);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (913868, 'MANTAK', to_date('19-03-1992', 'dd-mm-yyyy'), 'Active', 596693);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (149154, 'Namer', to_date('28-12-2005', 'dd-mm-yyyy'), 'Out of Service', 658283);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (172568, 'Sho''t Kal', to_date('08-06-2010', 'dd-mm-yyyy'), 'Active', 319095);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (862717, 'M270 Smashing', to_date('17-03-2005', 'dd-mm-yyyy'), 'Out of Service', 914132);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (975531, 'Sufa (Storm) Jeep', to_date('28-05-2015', 'dd-mm-yyyy'), 'In Maintenance', 679720);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (971119, 'Soltam M-71', to_date('21-02-2015', 'dd-mm-yyyy'), 'Out of Service', 734284);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (163671, 'PULS', to_date('28-04-1990', 'dd-mm-yyyy'), 'Deployed', 463085);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (582178, 'RBY Mk 1', to_date('25-10-1971', 'dd-mm-yyyy'), 'Out of Service', 499295);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (824772, 'Achzarit', to_date('09-02-2020', 'dd-mm-yyyy'), 'Deployed', 937314);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (681494, 'Mahatz', to_date('30-05-2003', 'dd-mm-yyyy'), 'Out of Service', 961068);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (494271, 'RAMTA RBY', to_date('24-09-1971', 'dd-mm-yyyy'), 'Deployed', 862885);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (644373, 'Puma', to_date('01-10-1972', 'dd-mm-yyyy'), 'Active', 749779);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (568924, 'MANTAK', to_date('12-08-1994', 'dd-mm-yyyy'), 'In Maintenance', 299961);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (714841, 'Merkava Mk.2', to_date('26-06-2002', 'dd-mm-yyyy'), 'Deployed', 494318);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (484519, 'LYNX', to_date('25-06-1996', 'dd-mm-yyyy'), 'Out of Service', 442496);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (584726, 'Puma', to_date('07-03-2009', 'dd-mm-yyyy'), 'Under Repair', 620389);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (379745, 'Puma', to_date('18-04-2012', 'dd-mm-yyyy'), 'Deployed', 240640);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (846443, 'Puma', to_date('30-09-1980', 'dd-mm-yyyy'), 'Active', 756864);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (979728, 'David Light Armored Vehicle', to_date('03-10-1974', 'dd-mm-yyyy'), 'Deployed', 836092);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (632823, 'PULS', to_date('21-02-1974', 'dd-mm-yyyy'), 'Out of Service', 728458);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (885894, 'Pereh', to_date('19-04-2016', 'dd-mm-yyyy'), 'Deployed', 92483);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (282353, 'Magach 6', to_date('07-05-2019', 'dd-mm-yyyy'), 'Active', 929761);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (632974, 'Achzarit', to_date('04-03-2001', 'dd-mm-yyyy'), 'Under Repair', 522468);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (947191, 'ATMOS 2000', to_date('10-06-2020', 'dd-mm-yyyy'), 'Out of Service', 994218);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (674122, 'M88 Hercules', to_date('15-12-1987', 'dd-mm-yyyy'), 'Out of Service', 484085);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (835233, 'Magach 5', to_date('21-06-1975', 'dd-mm-yyyy'), 'Under Repair', 697926);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (845557, 'Namer', to_date('12-05-2022', 'dd-mm-yyyy'), 'Out of Service', 203945);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (325119, 'Gaash', to_date('03-03-1981', 'dd-mm-yyyy'), 'Out of Service', 858401);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (741495, 'Tiran 4', to_date('23-11-2009', 'dd-mm-yyyy'), 'Under Repair', 927099);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (525239, 'Nakpadon', to_date('02-03-1991', 'dd-mm-yyyy'), 'In Maintenance', 342517);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (783324, 'Tiran 5', to_date('11-11-1996', 'dd-mm-yyyy'), 'In Maintenance', 930274);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (998412, 'PULS', to_date('15-01-2016', 'dd-mm-yyyy'), 'Active', 587660);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (169942, 'M113 Zelda', to_date('19-08-2006', 'dd-mm-yyyy'), 'Out of Service', 200059);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (881662, 'Merkava Mk.2', to_date('18-06-2000', 'dd-mm-yyyy'), 'Under Repair', 100783);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (977134, 'Merkava Mk.1', to_date('12-02-2004', 'dd-mm-yyyy'), 'Under Repair', 881261);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (546253, 'Gaash', to_date('09-05-1984', 'dd-mm-yyyy'), 'Active', 760471);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (262276, 'David Light Armored Vehicle', to_date('18-06-1977', 'dd-mm-yyyy'), 'Out of Service', 869543);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (267665, 'Puma', to_date('21-04-1973', 'dd-mm-yyyy'), 'Out of Service', 569207);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (766753, 'M88 Hercules', to_date('05-07-1976', 'dd-mm-yyyy'), 'Out of Service', 263152);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (659778, 'Gaash', to_date('26-06-1989', 'dd-mm-yyyy'), 'Under Repair', 140504);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (944135, 'Mahatz', to_date('17-06-2015', 'dd-mm-yyyy'), 'Deployed', 442587);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (457366, 'Nimda Shoet', to_date('02-10-1972', 'dd-mm-yyyy'), 'In Maintenance', 449558);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (269282, 'Merkava Mk.2', to_date('25-02-1978', 'dd-mm-yyyy'), 'Out of Service', 408669);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (986351, 'Nagmachon', to_date('17-12-1975', 'dd-mm-yyyy'), 'Active', 859250);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (397394, 'Nimrod', to_date('22-11-2003', 'dd-mm-yyyy'), 'Deployed', 265293);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (165555, 'Nagmachon', to_date('05-02-1971', 'dd-mm-yyyy'), 'Out of Service', 543705);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (367497, 'Magach 6', to_date('22-01-1998', 'dd-mm-yyyy'), 'In Maintenance', 775138);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (648933, 'Pereh', to_date('21-01-2009', 'dd-mm-yyyy'), 'Under Repair', 238744);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (686732, 'M113 Zelda', to_date('22-04-2022', 'dd-mm-yyyy'), 'Deployed', 866648);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (614117, 'Puma', to_date('29-06-2022', 'dd-mm-yyyy'), 'Active', 865889);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (962419, 'Merkava Mk.1', to_date('14-05-2018', 'dd-mm-yyyy'), 'Active', 397261);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (435731, 'RBY Mk 1', to_date('13-05-1987', 'dd-mm-yyyy'), 'Active', 573438);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (783724, 'MANTAK', to_date('04-06-1995', 'dd-mm-yyyy'), 'Active', 73272);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (378729, 'Tiran 5', to_date('14-03-1977', 'dd-mm-yyyy'), 'Out of Service', 364577);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (163538, 'PULS', to_date('26-04-1977', 'dd-mm-yyyy'), 'Under Repair', 549679);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (714687, 'Eyal', to_date('28-06-1983', 'dd-mm-yyyy'), 'Under Repair', 751023);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (445426, 'Merkava Mk.2', to_date('30-04-1997', 'dd-mm-yyyy'), 'In Maintenance', 84493);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (178171, 'LYNX', to_date('03-01-1987', 'dd-mm-yyyy'), 'In Maintenance', 108158);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (318784, 'Merkava Mk.2', to_date('08-04-2007', 'dd-mm-yyyy'), 'In Maintenance', 554828);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (439982, 'Panther Command Vehicle', to_date('24-09-2017', 'dd-mm-yyyy'), 'Under Repair', 403608);
commit;
prompt 200 records committed...
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (612374, 'Wolf Armored Vehicle', to_date('30-10-2015', 'dd-mm-yyyy'), 'Out of Service', 994218);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (958167, 'Puma', to_date('08-12-2008', 'dd-mm-yyyy'), 'Active', 503871);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (446793, 'Eyal', to_date('15-02-2024', 'dd-mm-yyyy'), 'Deployed', 734636);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (119637, 'Nagmachon', to_date('19-12-1970', 'dd-mm-yyyy'), 'In Maintenance', 476658);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (491965, 'Puma', to_date('19-10-1991', 'dd-mm-yyyy'), 'In Maintenance', 922330);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (865581, 'Zibra', to_date('19-06-1991', 'dd-mm-yyyy'), 'Out of Service', 279354);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (911472, 'M113 Zelda', to_date('29-02-1972', 'dd-mm-yyyy'), 'In Maintenance', 98592);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (895249, 'Zibra', to_date('17-01-2017', 'dd-mm-yyyy'), 'Under Repair', 368287);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (568736, 'Nimda Shoet', to_date('12-08-1970', 'dd-mm-yyyy'), 'Active', 728458);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (564872, 'Wildcat', to_date('31-08-1982', 'dd-mm-yyyy'), 'Deployed', 866648);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (441216, 'Achzarit', to_date('20-11-2017', 'dd-mm-yyyy'), 'In Maintenance', 659078);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (529282, 'Wolf Armored Vehicle', to_date('07-03-1999', 'dd-mm-yyyy'), 'In Maintenance', 731);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (653924, 'Humvee', to_date('24-04-1985', 'dd-mm-yyyy'), 'Deployed', 140504);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (284657, 'Sho''t Kal', to_date('29-03-1997', 'dd-mm-yyyy'), 'In Maintenance', 931588);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (285662, 'Humvee', to_date('05-09-1986', 'dd-mm-yyyy'), 'Under Repair', 773846);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (913961, 'Nagmachon', to_date('16-10-1977', 'dd-mm-yyyy'), 'Active', 932705);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (868472, 'Machbet', to_date('02-07-1997', 'dd-mm-yyyy'), 'In Maintenance', 799217);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (352658, 'Merkava Mk.4', to_date('13-10-2022', 'dd-mm-yyyy'), 'In Maintenance', 279354);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (872846, 'RAMTA RBY', to_date('03-02-1998', 'dd-mm-yyyy'), 'Under Repair', 82511);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (241979, 'Magach 5', to_date('29-12-1993', 'dd-mm-yyyy'), 'Active', 377741);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (762345, 'LYNX', to_date('18-08-2004', 'dd-mm-yyyy'), 'Deployed', 344138);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (719416, 'M109 Doher', to_date('08-04-2002', 'dd-mm-yyyy'), 'Out of Service', 722229);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (211928, 'Eyal', to_date('15-12-2017', 'dd-mm-yyyy'), 'Active', 41866);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (964955, 'Pereh', to_date('17-04-1972', 'dd-mm-yyyy'), 'Under Repair', 476517);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (951887, 'MANTAK', to_date('04-09-1987', 'dd-mm-yyyy'), 'Out of Service', 453395);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (721753, 'David Light Armored Vehicle', to_date('05-02-2010', 'dd-mm-yyyy'), 'Out of Service', 275277);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (917321, 'Eyal', to_date('29-06-2011', 'dd-mm-yyyy'), 'Active', 452827);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (351334, 'Mahatz', to_date('23-10-1979', 'dd-mm-yyyy'), 'Deployed', 661884);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (146173, 'Namer', to_date('19-11-1970', 'dd-mm-yyyy'), 'Out of Service', 368287);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (221689, 'Magach 5', to_date('22-01-2024', 'dd-mm-yyyy'), 'Under Repair', 41866);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (361431, 'Zibra', to_date('02-03-1991', 'dd-mm-yyyy'), 'In Maintenance', 319095);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (577836, 'PULS', to_date('09-10-1972', 'dd-mm-yyyy'), 'Deployed', 965900);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (595522, 'ATMOS 2000', to_date('02-04-1976', 'dd-mm-yyyy'), 'Under Repair', 929761);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (275497, 'RBY Mk 1', to_date('02-07-1999', 'dd-mm-yyyy'), 'Out of Service', 623967);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (595483, 'Tiran 4', to_date('18-08-2013', 'dd-mm-yyyy'), 'Out of Service', 792649);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (726562, 'M113 Zelda', to_date('26-03-2008', 'dd-mm-yyyy'), 'In Maintenance', 612393);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (899543, 'Sho''t Kal', to_date('26-05-1981', 'dd-mm-yyyy'), 'Active', 255941);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (651392, 'Humvee', to_date('23-01-1974', 'dd-mm-yyyy'), 'In Maintenance', 756998);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (823654, 'Nakpadon', to_date('09-01-2017', 'dd-mm-yyyy'), 'Out of Service', 82511);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (586425, 'Sufa (Storm) Jeep', to_date('03-05-1997', 'dd-mm-yyyy'), 'In Maintenance', 891761);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (998418, 'RAMTA RBY', to_date('29-06-1989', 'dd-mm-yyyy'), 'Under Repair', 699634);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (612695, 'Nakpadon', to_date('29-08-1985', 'dd-mm-yyyy'), 'Under Repair', 281344);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (874343, 'Tiran 6', to_date('13-09-1987', 'dd-mm-yyyy'), 'Out of Service', 250479);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (485118, 'RBY Mk 1', to_date('19-02-1978', 'dd-mm-yyyy'), 'Deployed', 633184);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (458644, 'Eyal', to_date('30-11-1993', 'dd-mm-yyyy'), 'Out of Service', 775716);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (987167, 'Nakpadon', to_date('01-01-2021', 'dd-mm-yyyy'), 'Under Repair', 866648);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (924264, 'Sufa (Storm) Jeep', to_date('27-08-2021', 'dd-mm-yyyy'), 'Active', 267671);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (632189, 'Nakpadon', to_date('06-05-1984', 'dd-mm-yyyy'), 'Out of Service', 816168);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (472969, 'IDF Caterpillar D9', to_date('25-08-2000', 'dd-mm-yyyy'), 'Out of Service', 569207);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (441192, 'RAMTA RBY', to_date('17-09-1994', 'dd-mm-yyyy'), 'Deployed', 786247);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (539637, 'Magach 6', to_date('19-01-2009', 'dd-mm-yyyy'), 'Deployed', 108158);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (933449, 'M88 Hercules', to_date('15-12-1998', 'dd-mm-yyyy'), 'Out of Service', 18815);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (939731, 'MANTAK', to_date('01-10-1999', 'dd-mm-yyyy'), 'Out of Service', 171641);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (338882, 'Sholef', to_date('07-04-1976', 'dd-mm-yyyy'), 'Active', 74836);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (744769, 'Magach 7', to_date('09-02-1974', 'dd-mm-yyyy'), 'Deployed', 186088);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (681588, 'MANTAK', to_date('05-10-1992', 'dd-mm-yyyy'), 'Out of Service', 786247);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (191535, 'Machbet', to_date('30-06-1994', 'dd-mm-yyyy'), 'Active', 734284);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (865349, 'Keshet', to_date('08-12-2012', 'dd-mm-yyyy'), 'Out of Service', 344138);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (559514, 'Magach 5', to_date('24-09-1983', 'dd-mm-yyyy'), 'Deployed', 962423);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (566851, 'Sufa (Storm) Jeep', to_date('08-06-1993', 'dd-mm-yyyy'), 'Under Repair', 354922);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (912239, 'Hafiz', to_date('31-08-1979', 'dd-mm-yyyy'), 'In Maintenance', 826560);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (665411, 'Gaash', to_date('20-03-1983', 'dd-mm-yyyy'), 'In Maintenance', 869536);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (145182, 'Nimrod', to_date('17-03-2005', 'dd-mm-yyyy'), 'Active', 847911);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (453672, 'David Light Armored Vehicle', to_date('07-03-2022', 'dd-mm-yyyy'), 'Active', 657775);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (954969, 'Panther Command Vehicle', to_date('29-06-1977', 'dd-mm-yyyy'), 'Active', 476658);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (698952, 'Doher', to_date('20-02-2024', 'dd-mm-yyyy'), 'Out of Service', 859250);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (137139, 'LYNX', to_date('23-08-1984', 'dd-mm-yyyy'), 'Under Repair', 921);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (465979, 'Sholef', to_date('10-08-2006', 'dd-mm-yyyy'), 'Out of Service', 140504);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (426121, 'Tiran 4', to_date('18-09-2022', 'dd-mm-yyyy'), 'In Maintenance', 874803);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (919592, 'Nakpadon', to_date('27-03-2011', 'dd-mm-yyyy'), 'Out of Service', 623967);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (548665, 'Merkava Mk.1', to_date('01-02-1983', 'dd-mm-yyyy'), 'Under Repair', 273863);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (413974, 'LYNX', to_date('03-11-1995', 'dd-mm-yyyy'), 'Out of Service', 951081);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (182726, 'Achzarit', to_date('01-01-1988', 'dd-mm-yyyy'), 'Under Repair', 594710);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (668164, 'Magach 5', to_date('18-08-1992', 'dd-mm-yyyy'), 'Deployed', 499295);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (766499, 'Sufa (Storm) Jeep', to_date('06-02-1990', 'dd-mm-yyyy'), 'In Maintenance', 989781);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (152328, 'Mahatz', to_date('04-07-1971', 'dd-mm-yyyy'), 'Under Repair', 682213);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (399221, 'MANTAK', to_date('11-06-2010', 'dd-mm-yyyy'), 'Active', 53596);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (797936, 'Tiran 4', to_date('03-10-2001', 'dd-mm-yyyy'), 'Under Repair', 751293);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (314354, 'Merkava Mk.2', to_date('11-05-2012', 'dd-mm-yyyy'), 'Under Repair', 293957);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (391556, 'Mahatz', to_date('23-04-2015', 'dd-mm-yyyy'), 'Out of Service', 543705);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (968148, 'Eyal', to_date('16-10-1997', 'dd-mm-yyyy'), 'In Maintenance', 309315);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (578981, 'Machbet', to_date('12-04-2009', 'dd-mm-yyyy'), 'Deployed', 453395);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (824889, 'Nagmachon', to_date('29-08-2002', 'dd-mm-yyyy'), 'Out of Service', 847911);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (679569, 'M88 Hercules', to_date('27-02-2018', 'dd-mm-yyyy'), 'Active', 672678);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (242996, 'Tiran 6', to_date('24-05-2007', 'dd-mm-yyyy'), 'Deployed', 377985);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (867973, 'Machbet', to_date('04-04-2014', 'dd-mm-yyyy'), 'Deployed', 160633);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (323711, 'Soltam M-71', to_date('26-08-2009', 'dd-mm-yyyy'), 'Deployed', 277631);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (126385, 'Sholef', to_date('07-07-2017', 'dd-mm-yyyy'), 'Under Repair', 227601);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (388351, 'M113 Zelda', to_date('24-07-1976', 'dd-mm-yyyy'), 'Out of Service', 902274);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (375718, 'Gaash', to_date('10-11-2002', 'dd-mm-yyyy'), 'Active', 447820);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (226995, 'Wolf Armored Vehicle', to_date('23-12-2004', 'dd-mm-yyyy'), 'Active', 273863);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (783429, 'IDF Caterpillar D9', to_date('23-12-2021', 'dd-mm-yyyy'), 'Active', 756864);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (689253, 'Sho''t Kal', to_date('19-08-1999', 'dd-mm-yyyy'), 'Under Repair', 518587);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (287244, 'Magach 6', to_date('21-12-1991', 'dd-mm-yyyy'), 'In Maintenance', 263152);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (814785, 'Nimrod', to_date('15-06-1985', 'dd-mm-yyyy'), 'Under Repair', 759136);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (823497, 'M109 Doher', to_date('07-02-1975', 'dd-mm-yyyy'), 'Out of Service', 496151);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (937781, 'Nagmachon', to_date('16-10-2010', 'dd-mm-yyyy'), 'Out of Service', 509396);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (444396, 'Merkava Mk.3', to_date('21-09-1994', 'dd-mm-yyyy'), 'Active', 749779);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (464111, 'Nimda Shoet', to_date('02-01-1970', 'dd-mm-yyyy'), 'Under Repair', 549679);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (548157, 'Sufa (Storm) Jeep', to_date('04-06-2021', 'dd-mm-yyyy'), 'Deployed', 682789);
commit;
prompt 300 records committed...
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (428738, 'Wolf Armored Vehicle', to_date('08-08-2013', 'dd-mm-yyyy'), 'Out of Service', 860827);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (765978, 'Wolf Armored Vehicle', to_date('20-07-2016', 'dd-mm-yyyy'), 'Out of Service', 968173);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (144226, 'Panther Command Vehicle', to_date('21-12-1999', 'dd-mm-yyyy'), 'Out of Service', 186088);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (958923, 'M109 Doher', to_date('05-02-1988', 'dd-mm-yyyy'), 'Active', 249816);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (681235, 'Mahatz', to_date('11-12-1987', 'dd-mm-yyyy'), 'In Maintenance', 397261);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (617679, 'Wildcat', to_date('06-03-1973', 'dd-mm-yyyy'), 'Under Repair', 517793);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (142314, 'Hafiz', to_date('31-10-1979', 'dd-mm-yyyy'), 'Active', 92010);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (378375, 'Achzarit', to_date('10-09-1983', 'dd-mm-yyyy'), 'Under Repair', 233108);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (341175, 'RAMTA RBY', to_date('27-08-2017', 'dd-mm-yyyy'), 'Active', 144218);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (984478, 'M270 MLRS', to_date('16-06-2019', 'dd-mm-yyyy'), 'Under Repair', 354922);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (935332, 'M270 MLRS', to_date('23-04-2010', 'dd-mm-yyyy'), 'Active', 587039);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (575682, 'LYNX', to_date('14-04-1995', 'dd-mm-yyyy'), 'In Maintenance', 375123);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (414943, 'Namer', to_date('17-12-1986', 'dd-mm-yyyy'), 'Active', 146017);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (387731, 'Machbet', to_date('26-02-1985', 'dd-mm-yyyy'), 'Out of Service', 729081);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (782739, 'Mahatz', to_date('19-07-2018', 'dd-mm-yyyy'), 'Under Repair', 499295);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (677517, 'Mahatz', to_date('25-01-2005', 'dd-mm-yyyy'), 'Active', 748905);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (265163, 'Hafiz', to_date('21-07-1986', 'dd-mm-yyyy'), 'Out of Service', 941754);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (728967, 'Merkava Mk.3', to_date('10-04-1982', 'dd-mm-yyyy'), 'Out of Service', 304359);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (531838, 'MANTIS', to_date('05-05-1989', 'dd-mm-yyyy'), 'Under Repair', 17709);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (261842, 'Namer', to_date('23-07-1974', 'dd-mm-yyyy'), 'Under Repair', 629041);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (182968, 'Merkava Mk.2', to_date('21-10-2016', 'dd-mm-yyyy'), 'Deployed', 178961);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (662513, 'Doher', to_date('30-07-2010', 'dd-mm-yyyy'), 'Out of Service', 688633);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (647315, 'M88 Hercules', to_date('09-06-1982', 'dd-mm-yyyy'), 'Deployed', 588125);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (546435, 'Merkava Mk.4', to_date('22-04-2022', 'dd-mm-yyyy'), 'Under Repair', 17547);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (668664, 'Magach 7', to_date('02-05-2020', 'dd-mm-yyyy'), 'Deployed', 562323);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (645986, 'M113 Zelda', to_date('31-01-1974', 'dd-mm-yyyy'), 'Under Repair', 47639);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (454592, 'Doher', to_date('21-03-1990', 'dd-mm-yyyy'), 'In Maintenance', 864124);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (165536, 'Pereh', to_date('06-04-1980', 'dd-mm-yyyy'), 'Out of Service', 929761);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (696372, 'Tiran 4', to_date('25-04-1972', 'dd-mm-yyyy'), 'Active', 293957);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (477897, 'Magach 7', to_date('13-09-1999', 'dd-mm-yyyy'), 'Active', 890899);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (946737, 'Magach 5', to_date('21-02-2016', 'dd-mm-yyyy'), 'Active', 668822);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (947427, 'LYNX', to_date('10-12-2012', 'dd-mm-yyyy'), 'In Maintenance', 788357);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (461688, 'Tiran 6', to_date('06-03-1974', 'dd-mm-yyyy'), 'Active', 476658);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (333691, 'Humvee', to_date('01-07-1971', 'dd-mm-yyyy'), 'Under Repair', 480466);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (848765, 'Nakpadon', to_date('20-07-1993', 'dd-mm-yyyy'), 'In Maintenance', 827285);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (469997, 'LYNX', to_date('24-07-2017', 'dd-mm-yyyy'), 'In Maintenance', 750472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (518899, 'Merkava Mk.2', to_date('17-05-1970', 'dd-mm-yyyy'), 'In Maintenance', 465888);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (964723, 'M113 Zelda', to_date('22-02-2019', 'dd-mm-yyyy'), 'Deployed', 618595);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (457977, 'Puma', to_date('19-07-1979', 'dd-mm-yyyy'), 'Active', 964343);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (295494, 'PULS', to_date('08-05-1978', 'dd-mm-yyyy'), 'Under Repair', 620389);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (976191, 'David Light Armored Vehicle', to_date('20-11-2011', 'dd-mm-yyyy'), 'Deployed', 309315);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (942499, 'MANTAK', to_date('25-08-2004', 'dd-mm-yyyy'), 'In Maintenance', 715708);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (481237, 'Sho''t Kal', to_date('12-12-1971', 'dd-mm-yyyy'), 'Out of Service', 999177);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (148158, 'Nimda Shoet', to_date('15-02-1971', 'dd-mm-yyyy'), 'Deployed', 874803);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (215143, 'Machbet', to_date('11-10-1979', 'dd-mm-yyyy'), 'In Maintenance', 535678);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (439258, 'IDF Caterpillar D9', to_date('30-07-2017', 'dd-mm-yyyy'), 'Under Repair', 540629);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (373732, 'Puma', to_date('09-04-2001', 'dd-mm-yyyy'), 'Active', 528153);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (355145, 'Humvee', to_date('27-01-1981', 'dd-mm-yyyy'), 'Out of Service', 140504);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (298372, 'Namer', to_date('17-06-2018', 'dd-mm-yyyy'), 'Active', 399673);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (251756, 'Machbet', to_date('30-03-1977', 'dd-mm-yyyy'), 'Deployed', 985349);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (481647, 'SandCat', to_date('04-11-2008', 'dd-mm-yyyy'), 'Deployed', 604306);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (977737, 'SandCat', to_date('17-10-2022', 'dd-mm-yyyy'), 'Active', 2245);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (911698, 'Tiran 4', to_date('01-06-1994', 'dd-mm-yyyy'), 'Active', 897006);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (146385, 'SandCat', to_date('27-09-1971', 'dd-mm-yyyy'), 'Deployed', 509396);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (886775, 'Achzarit', to_date('19-11-1999', 'dd-mm-yyyy'), 'Deployed', 446760);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (534494, 'Magach 5', to_date('11-03-2019', 'dd-mm-yyyy'), 'Out of Service', 633859);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (258488, 'M109 Doher', to_date('29-07-1990', 'dd-mm-yyyy'), 'Deployed', 413161);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (348163, 'RBY Mk 1', to_date('22-07-1975', 'dd-mm-yyyy'), 'Active', 587660);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (313613, 'Magach 7', to_date('23-09-1982', 'dd-mm-yyyy'), 'Out of Service', 275277);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (481872, 'Puma', to_date('21-08-1982', 'dd-mm-yyyy'), 'Active', 750472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (475242, 'Nimrod', to_date('21-02-1989', 'dd-mm-yyyy'), 'Active', 336796);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (968446, 'Eitan', to_date('09-02-1978', 'dd-mm-yyyy'), 'Active', 359188);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (449621, 'Mahatz', to_date('25-01-2020', 'dd-mm-yyyy'), 'Under Repair', 974391);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (828532, 'Eyal', to_date('03-05-2009', 'dd-mm-yyyy'), 'Out of Service', 554496);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (485274, 'Nakpadon', to_date('15-06-1992', 'dd-mm-yyyy'), 'Deployed', 63195);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (383922, 'LYNX', to_date('18-10-1979', 'dd-mm-yyyy'), 'Under Repair', 688633);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (745367, 'Mahatz', to_date('14-12-2011', 'dd-mm-yyyy'), 'Active', 319095);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (696558, 'Zibra', to_date('12-04-1978', 'dd-mm-yyyy'), 'Deployed', 722229);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (952842, 'Merkava Mk.1', to_date('08-04-1984', 'dd-mm-yyyy'), 'Active', 265293);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (456442, 'RBY Mk 1', to_date('19-08-2018', 'dd-mm-yyyy'), 'Under Repair', 277631);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (979593, 'Merkava Mk.3', to_date('26-02-1971', 'dd-mm-yyyy'), 'Out of Service', 308304);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (217574, 'Sho''t Kal', to_date('20-01-1987', 'dd-mm-yyyy'), 'Active', 265293);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (735159, 'IDF Caterpillar D9', to_date('23-01-2003', 'dd-mm-yyyy'), 'Active', 21950);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (879477, 'Tiran 6', to_date('16-02-2010', 'dd-mm-yyyy'), 'Active', 84788);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (925575, 'Tiran 4', to_date('14-12-1975', 'dd-mm-yyyy'), 'Under Repair', 881261);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (928564, 'Sho''t Kal', to_date('05-04-2003', 'dd-mm-yyyy'), 'Active', 914132);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (662296, 'Machbet', to_date('10-06-2001', 'dd-mm-yyyy'), 'Under Repair', 890899);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (712238, 'Machbet', to_date('15-01-1998', 'dd-mm-yyyy'), 'In Maintenance', 863003);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (977788, 'Merkava Mk.2', to_date('18-08-2017', 'dd-mm-yyyy'), 'Deployed', 683034);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (334896, 'M270 MLRS', to_date('18-02-1981', 'dd-mm-yyyy'), 'Under Repair', 972135);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (762291, 'Pereh', to_date('08-08-1980', 'dd-mm-yyyy'), 'Deployed', 231553);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (122174, 'Magach 5', to_date('11-01-2001', 'dd-mm-yyyy'), 'In Maintenance', 233108);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (324351, 'Doher', to_date('29-05-2014', 'dd-mm-yyyy'), 'In Maintenance', 47001);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (831673, 'Nimda Shoet', to_date('22-09-2008', 'dd-mm-yyyy'), 'Deployed', 881261);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (768721, 'MANTIS', to_date('27-06-2019', 'dd-mm-yyyy'), 'Out of Service', 773846);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (961253, 'Nimda Shoet', to_date('21-07-1998', 'dd-mm-yyyy'), 'Active', 503871);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (855581, 'Zibra', to_date('09-09-1991', 'dd-mm-yyyy'), 'Under Repair', 658283);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (634346, 'Panther Command Vehicle', to_date('31-08-1996', 'dd-mm-yyyy'), 'Active', 46331);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (566661, 'MANTIS', to_date('25-05-1981', 'dd-mm-yyyy'), 'Deployed', 756864);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (522964, 'M270 MLRS', to_date('20-08-2001', 'dd-mm-yyyy'), 'Out of Service', 34118);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (814923, 'M109 Doher', to_date('17-02-1994', 'dd-mm-yyyy'), 'Under Repair', 267671);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (615292, 'Tiran 5', to_date('15-02-1995', 'dd-mm-yyyy'), 'Active', 786247);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (987433, 'Keshet', to_date('06-08-1984', 'dd-mm-yyyy'), 'In Maintenance', 328059);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (819964, 'Magach 7', to_date('25-03-1991', 'dd-mm-yyyy'), 'Deployed', 221486);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (854717, 'MANTIS', to_date('15-01-2001', 'dd-mm-yyyy'), 'In Maintenance', 501100);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (319454, 'Eitan', to_date('13-01-1998', 'dd-mm-yyyy'), 'In Maintenance', 38609);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (211843, 'ATMOS 2000', to_date('21-01-2007', 'dd-mm-yyyy'), 'In Maintenance', 646127);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (395638, 'PULS', to_date('07-10-1995', 'dd-mm-yyyy'), 'Active', 675567);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (497197, 'David Light Armored Vehicle', to_date('20-03-2008', 'dd-mm-yyyy'), 'Out of Service', 965241);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (441881, 'Tiran 4', to_date('15-03-1995', 'dd-mm-yyyy'), 'In Maintenance', 668766);
commit;
prompt 400 records committed...
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (569863, 'Nimrod', to_date('10-07-1983', 'dd-mm-yyyy'), 'Out of Service', 656992);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (744782, 'Sholef', to_date('25-12-1981', 'dd-mm-yyyy'), 'Under Repair', 319961);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (821516, 'MANTAK', to_date('22-06-2004', 'dd-mm-yyyy'), 'In Maintenance', 929761);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (838524, 'IDF Caterpillar D9', to_date('13-08-2000', 'dd-mm-yyyy'), 'Deployed', 977819);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (647562, 'LYNX', to_date('07-09-2014', 'dd-mm-yyyy'), 'Active', 275277);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (524233, 'M109 Doher', to_date('10-08-1993', 'dd-mm-yyyy'), 'In Maintenance', 119855);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (375151, 'Nagmachon', to_date('06-12-2005', 'dd-mm-yyyy'), 'Active', 679720);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (455926, 'Sufa (Storm) Jeep', to_date('18-09-2002', 'dd-mm-yyyy'), 'Under Repair', 577366);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (845427, 'Tiran 5', to_date('30-01-1982', 'dd-mm-yyyy'), 'Deployed', 238744);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (643742, 'Nagmachon', to_date('14-08-1994', 'dd-mm-yyyy'), 'Active', 94161);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (299887, 'M109 Doher', to_date('06-01-1985', 'dd-mm-yyyy'), 'Deployed', 939572);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (798987, 'Merkava Mk.4', to_date('21-06-1999', 'dd-mm-yyyy'), 'Deployed', 641207);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (519646, 'Mahatz', to_date('18-05-1981', 'dd-mm-yyyy'), 'Deployed', 426031);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (838487, 'ATMOS 2000', to_date('28-09-2014', 'dd-mm-yyyy'), 'In Maintenance', 2655);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (799136, 'LYNX', to_date('13-03-2020', 'dd-mm-yyyy'), 'In Maintenance', 82511);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (329844, 'Panther Command Vehicle', to_date('09-10-2009', 'dd-mm-yyyy'), 'Active', 828472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (518618, 'LYNX', to_date('16-05-1998', 'dd-mm-yyyy'), 'Out of Service', 693404);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (694336, 'M270 Smashing', to_date('03-07-1999', 'dd-mm-yyyy'), 'Under Repair', 587660);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (334317, 'Merkava Mk.1', to_date('18-06-2014', 'dd-mm-yyyy'), 'Under Repair', 277631);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (379354, 'Nakpadon', to_date('03-09-2006', 'dd-mm-yyyy'), 'Deployed', 399673);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (956571, 'Wildcat', to_date('03-02-2023', 'dd-mm-yyyy'), 'Active', 614710);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (219453, 'IDF Caterpillar D9', to_date('31-10-2016', 'dd-mm-yyyy'), 'Active', 319961);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (319162, 'Namer', to_date('27-10-2014', 'dd-mm-yyyy'), 'In Maintenance', 476658);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (583676, 'Gaash', to_date('11-11-1989', 'dd-mm-yyyy'), 'In Maintenance', 299961);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (293938, 'Panther Command Vehicle', to_date('05-04-2004', 'dd-mm-yyyy'), 'Active', 227601);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (865927, 'Nimrod', to_date('05-04-2005', 'dd-mm-yyyy'), 'In Maintenance', 968173);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (497395, 'Panther Command Vehicle', to_date('29-11-1991', 'dd-mm-yyyy'), 'Active', 140152);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (199474, 'Pereh', to_date('16-01-1980', 'dd-mm-yyyy'), 'In Maintenance', 866648);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (387833, 'M270 MLRS', to_date('04-03-1970', 'dd-mm-yyyy'), 'In Maintenance', 954472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (383246, 'Mahatz', to_date('23-04-1987', 'dd-mm-yyyy'), 'Under Repair', 649739);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (192413, 'Merkava Mk.3', to_date('23-04-2003', 'dd-mm-yyyy'), 'In Maintenance', 598313);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (297197, 'Humvee', to_date('14-07-1989', 'dd-mm-yyyy'), 'Deployed', 293957);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (882337, 'ATMOS 2000', to_date('08-12-1989', 'dd-mm-yyyy'), 'In Maintenance', 620115);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (329156, 'RBY Mk 1', to_date('18-06-1987', 'dd-mm-yyyy'), 'Active', 709185);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (814567, 'M109 Doher', to_date('02-12-1979', 'dd-mm-yyyy'), 'Active', 101552);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (299749, 'MANTIS', to_date('14-06-2023', 'dd-mm-yyyy'), 'Deployed', 869324);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (666686, 'M113 Zelda', to_date('06-03-1975', 'dd-mm-yyyy'), 'Under Repair', 964050);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (459429, 'Sho''t Kal', to_date('17-09-1980', 'dd-mm-yyyy'), 'In Maintenance', 611403);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (532864, 'Wildcat', to_date('28-09-2004', 'dd-mm-yyyy'), 'In Maintenance', 959379);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (191876, 'Tiran 4', to_date('02-10-2002', 'dd-mm-yyyy'), 'Under Repair', 989781);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (411951, 'Nakpadon', to_date('24-01-1974', 'dd-mm-yyyy'), 'In Maintenance', 597826);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (563516, 'RBY Mk 1', to_date('21-04-1980', 'dd-mm-yyyy'), 'Deployed', 847122);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (977196, 'Mahatz', to_date('22-05-1997', 'dd-mm-yyyy'), 'Out of Service', 649718);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (545867, 'Merkava Mk.4', to_date('18-07-1989', 'dd-mm-yyyy'), 'Under Repair', 596693);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (397429, 'Eitan', to_date('09-10-1979', 'dd-mm-yyyy'), 'Out of Service', 973763);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (399844, 'Gaash', to_date('25-01-1993', 'dd-mm-yyyy'), 'Deployed', 778941);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (511542, 'SandCat', to_date('22-08-1999', 'dd-mm-yyyy'), 'Deployed', 476658);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (255696, 'SandCat', to_date('04-04-2008', 'dd-mm-yyyy'), 'Deployed', 699803);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (629388, 'Tiran 5', to_date('30-12-2013', 'dd-mm-yyyy'), 'Out of Service', 759136);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (144156, 'RAMTA RBY', to_date('22-04-2005', 'dd-mm-yyyy'), 'Out of Service', 828472);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (689987, 'MANTIS', to_date('30-05-1975', 'dd-mm-yyyy'), 'Active', 647973);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (936611, 'Sholef', to_date('29-01-2006', 'dd-mm-yyyy'), 'Deployed', 672678);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (519837, 'IDF Caterpillar D9', to_date('19-07-1996', 'dd-mm-yyyy'), 'Deployed', 2655);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (299532, 'M270 Smashing', to_date('26-03-1999', 'dd-mm-yyyy'), 'Deployed', 146757);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (225327, 'Tiran 4', to_date('13-06-1994', 'dd-mm-yyyy'), 'Active', 668766);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (393727, 'Machbet', to_date('30-11-2006', 'dd-mm-yyyy'), 'Under Repair', 662779);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (372314, 'Pereh', to_date('19-08-1998', 'dd-mm-yyyy'), 'Active', 310136);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (152883, 'Sufa (Storm) Jeep', to_date('29-12-1999', 'dd-mm-yyyy'), 'Out of Service', 379958);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (623573, 'Magach 5', to_date('06-10-1984', 'dd-mm-yyyy'), 'Deployed', 450193);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (883729, 'Eyal', to_date('12-04-2024', 'dd-mm-yyyy'), 'Active', 699803);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (226257, 'Achzarit', to_date('27-07-2010', 'dd-mm-yyyy'), 'Under Repair', 455430);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (764916, 'Sho''t Kal', to_date('28-03-1990', 'dd-mm-yyyy'), 'Deployed', 23321);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (129215, 'Tiran 4', to_date('06-06-1977', 'dd-mm-yyyy'), 'Out of Service', 876873);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (313547, 'Nakpadon', to_date('25-09-2004', 'dd-mm-yyyy'), 'Under Repair', 649739);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (935292, 'Tiran 5', to_date('28-07-1984', 'dd-mm-yyyy'), 'Out of Service', 446760);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (499926, 'Merkava Mk.2', to_date('01-04-2018', 'dd-mm-yyyy'), 'Out of Service', 722146);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (594746, 'Wolf Armored Vehicle', to_date('23-06-1974', 'dd-mm-yyyy'), 'Under Repair', 304359);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (171715, 'RBY Mk 1', to_date('16-03-2019', 'dd-mm-yyyy'), 'Under Repair', 120796);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (396365, 'Tiran 6', to_date('18-07-1989', 'dd-mm-yyyy'), 'Active', 574000);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (958314, 'Namer', to_date('27-08-2010', 'dd-mm-yyyy'), 'Out of Service', 463085);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (617136, 'Nakpadon', to_date('28-02-1983', 'dd-mm-yyyy'), 'Active', 826560);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (652587, 'Tiran 6', to_date('24-11-1995', 'dd-mm-yyyy'), 'In Maintenance', 899020);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (144335, 'Magach 6', to_date('02-01-1989', 'dd-mm-yyyy'), 'Under Repair', 248440);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (245169, 'Tiran 5', to_date('03-01-1996', 'dd-mm-yyyy'), 'Out of Service', 856492);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (468277, 'Machbet', to_date('23-04-1999', 'dd-mm-yyyy'), 'Active', 100783);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (374848, 'Merkava Mk.3', to_date('29-09-1972', 'dd-mm-yyyy'), 'Active', 713497);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (545163, 'M113 Zelda', to_date('07-09-2002', 'dd-mm-yyyy'), 'In Maintenance', 469677);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (269578, 'David Light Armored Vehicle', to_date('14-08-1978', 'dd-mm-yyyy'), 'In Maintenance', 47886);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (554412, 'MANTIS', to_date('21-01-1994', 'dd-mm-yyyy'), 'Deployed', 40654);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (799539, 'Sho''t Kal', to_date('07-02-2000', 'dd-mm-yyyy'), 'Active', 614465);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (793787, 'Zibra', to_date('20-11-1999', 'dd-mm-yyyy'), 'Out of Service', 490738);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (333588, 'Merkava Mk.2', to_date('07-12-2005', 'dd-mm-yyyy'), 'Deployed', 722146);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (877452, 'Nagmachon', to_date('19-08-2012', 'dd-mm-yyyy'), 'Active', 235479);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (449125, 'M88 Hercules', to_date('29-08-2019', 'dd-mm-yyyy'), 'Under Repair', 308304);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (926356, 'Panther Command Vehicle', to_date('23-07-2013', 'dd-mm-yyyy'), 'Under Repair', 612393);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (683451, 'SandCat', to_date('01-11-1994', 'dd-mm-yyyy'), 'Active', 842106);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (552954, 'Mahatz', to_date('27-11-2004', 'dd-mm-yyyy'), 'Under Repair', 927868);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (448959, 'Eyal', to_date('05-04-1991', 'dd-mm-yyyy'), 'In Maintenance', 586970);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (647181, 'Mahatz', to_date('12-02-1986', 'dd-mm-yyyy'), 'Out of Service', 962591);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (961549, 'Nimda Shoet', to_date('14-02-2023', 'dd-mm-yyyy'), 'Active', 293141);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (397266, 'MANTAK', to_date('13-04-1985', 'dd-mm-yyyy'), 'In Maintenance', 860364);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (724245, 'Nimda Shoet', to_date('07-12-1995', 'dd-mm-yyyy'), 'In Maintenance', 466247);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (714389, 'Doher', to_date('14-12-1998', 'dd-mm-yyyy'), 'Out of Service', 518587);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (115382, 'PULS', to_date('14-08-1999', 'dd-mm-yyyy'), 'In Maintenance', 701007);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (299186, 'M270 MLRS', to_date('16-09-1978', 'dd-mm-yyyy'), 'Out of Service', 104527);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (526252, 'SandCat', to_date('06-03-1989', 'dd-mm-yyyy'), 'Under Repair', 888325);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (193786, 'Machbet', to_date('26-05-2016', 'dd-mm-yyyy'), 'Under Repair', 666126);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (791347, 'Nakpadon', to_date('09-10-2016', 'dd-mm-yyyy'), 'In Maintenance', 856492);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (251266, 'Tiran 4', to_date('19-01-1970', 'dd-mm-yyyy'), 'Active', 33710);
insert into VEHICLE (vehicleid, model_, aquisitiondate, status, baseid)
values (234178, 'PULS', to_date('14-06-2019', 'dd-mm-yyyy'), 'In Maintenance', 353864);
commit;
prompt 500 records loaded
prompt Loading DRIVEAT...
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-09-2002', 'dd-mm-yyyy'), 277712, 935292);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-01-1984', 'dd-mm-yyyy'), 664989, 367497);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-05-2013', 'dd-mm-yyyy'), 591927, 874343);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-01-2014', 'dd-mm-yyyy'), 126042, 277395);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-08-2004', 'dd-mm-yyyy'), 668082, 764916);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-12-1971', 'dd-mm-yyyy'), 658314, 334317);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-12-2023', 'dd-mm-yyyy'), 889684, 682623);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-11-1992', 'dd-mm-yyyy'), 636674, 941218);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-05-1999', 'dd-mm-yyyy'), 684174, 719416);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-01-1998', 'dd-mm-yyyy'), 778333, 791347);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-01-1970', 'dd-mm-yyyy'), 125980, 785189);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-05-2001', 'dd-mm-yyyy'), 297322, 647562);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-01-1989', 'dd-mm-yyyy'), 920436, 821516);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-11-2011', 'dd-mm-yyyy'), 740158, 172568);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-04-2015', 'dd-mm-yyyy'), 507405, 974567);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-08-2015', 'dd-mm-yyyy'), 275015, 396365);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-06-1986', 'dd-mm-yyyy'), 831379, 977485);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-01-2013', 'dd-mm-yyyy'), 901304, 225327);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-06-2004', 'dd-mm-yyyy'), 373627, 647315);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-06-1984', 'dd-mm-yyyy'), 780542, 255696);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-09-2011', 'dd-mm-yyyy'), 561065, 439258);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-06-1986', 'dd-mm-yyyy'), 491281, 791347);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-05-2012', 'dd-mm-yyyy'), 579470, 753544);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-10-1995', 'dd-mm-yyyy'), 703114, 632189);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-06-2021', 'dd-mm-yyyy'), 661423, 293938);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-02-1975', 'dd-mm-yyyy'), 575615, 564872);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-11-1998', 'dd-mm-yyyy'), 630285, 812556);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-04-2009', 'dd-mm-yyyy'), 983762, 958314);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-10-2001', 'dd-mm-yyyy'), 801685, 333588);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-08-2023', 'dd-mm-yyyy'), 162853, 573952);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-01-2022', 'dd-mm-yyyy'), 748949, 632974);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-10-2010', 'dd-mm-yyyy'), 584529, 341175);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-07-2000', 'dd-mm-yyyy'), 674408, 518618);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-08-2008', 'dd-mm-yyyy'), 102587, 885894);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-12-1979', 'dd-mm-yyyy'), 716113, 182968);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-06-1986', 'dd-mm-yyyy'), 859561, 623573);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-07-1999', 'dd-mm-yyyy'), 301292, 583676);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-06-1987', 'dd-mm-yyyy'), 165503, 862379);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-02-1981', 'dd-mm-yyyy'), 528682, 334896);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-06-2000', 'dd-mm-yyyy'), 719462, 127443);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-01-1972', 'dd-mm-yyyy'), 301292, 267165);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-05-2021', 'dd-mm-yyyy'), 462687, 958167);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-06-2013', 'dd-mm-yyyy'), 409051, 598987);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-02-2020', 'dd-mm-yyyy'), 259018, 351334);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-05-1998', 'dd-mm-yyyy'), 801207, 845557);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-12-2021', 'dd-mm-yyyy'), 324630, 459636);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-12-1985', 'dd-mm-yyyy'), 312279, 796324);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-12-2015', 'dd-mm-yyyy'), 430763, 651392);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-10-1999', 'dd-mm-yyyy'), 958031, 881662);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-01-2019', 'dd-mm-yyyy'), 409051, 394876);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-06-1980', 'dd-mm-yyyy'), 611558, 393727);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-03-2007', 'dd-mm-yyyy'), 760757, 458644);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-09-2019', 'dd-mm-yyyy'), 823287, 745367);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-05-2011', 'dd-mm-yyyy'), 146990, 313613);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-03-2022', 'dd-mm-yyyy'), 636674, 536795);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-12-2010', 'dd-mm-yyyy'), 852186, 465979);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-06-1989', 'dd-mm-yyyy'), 748949, 519837);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-10-1988', 'dd-mm-yyyy'), 333020, 545867);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-09-1994', 'dd-mm-yyyy'), 239891, 745367);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-11-1972', 'dd-mm-yyyy'), 295065, 282353);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-11-1988', 'dd-mm-yyyy'), 644535, 782739);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-04-2022', 'dd-mm-yyyy'), 406655, 784986);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-02-2011', 'dd-mm-yyyy'), 541094, 349349);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-12-1988', 'dd-mm-yyyy'), 185132, 397895);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-04-2020', 'dd-mm-yyyy'), 188447, 941218);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-03-2003', 'dd-mm-yyyy'), 155332, 146173);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-09-1995', 'dd-mm-yyyy'), 234823, 126385);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-07-2002', 'dd-mm-yyyy'), 895688, 167436);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-05-2007', 'dd-mm-yyyy'), 586510, 674122);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-09-1988', 'dd-mm-yyyy'), 295065, 983467);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-02-2008', 'dd-mm-yyyy'), 589388, 714841);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-12-2017', 'dd-mm-yyyy'), 184598, 714687);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-12-1987', 'dd-mm-yyyy'), 747321, 849224);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-10-2001', 'dd-mm-yyyy'), 945009, 881662);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-12-1982', 'dd-mm-yyyy'), 475298, 333588);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-02-1987', 'dd-mm-yyyy'), 291468, 615292);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-08-1990', 'dd-mm-yyyy'), 664989, 698952);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-02-1997', 'dd-mm-yyyy'), 552414, 937781);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-12-2010', 'dd-mm-yyyy'), 445250, 221689);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-10-2004', 'dd-mm-yyyy'), 111613, 295685);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-08-1970', 'dd-mm-yyyy'), 703114, 823654);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-06-2010', 'dd-mm-yyyy'), 699268, 383922);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-08-2022', 'dd-mm-yyyy'), 373297, 319454);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-07-1995', 'dd-mm-yyyy'), 141253, 939511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-09-1974', 'dd-mm-yyyy'), 833922, 681494);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-10-1978', 'dd-mm-yyyy'), 290299, 552954);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-04-1975', 'dd-mm-yyyy'), 168097, 578981);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-04-1988', 'dd-mm-yyyy'), 312279, 911472);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-01-2014', 'dd-mm-yyyy'), 102587, 784986);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-06-1984', 'dd-mm-yyyy'), 967520, 768721);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-02-1973', 'dd-mm-yyyy'), 367283, 319454);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-12-1972', 'dd-mm-yyyy'), 959171, 894515);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-11-2004', 'dd-mm-yyyy'), 755078, 846443);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-09-2001', 'dd-mm-yyyy'), 589388, 467767);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-12-1982', 'dd-mm-yyyy'), 639023, 261842);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-01-1974', 'dd-mm-yyyy'), 259579, 371798);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-07-1988', 'dd-mm-yyyy'), 427631, 939511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-02-1980', 'dd-mm-yyyy'), 591819, 756815);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-05-2014', 'dd-mm-yyyy'), 836089, 693231);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-09-2011', 'dd-mm-yyyy'), 202948, 573952);
commit;
prompt 100 records committed...
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-05-1987', 'dd-mm-yyyy'), 944932, 586425);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-08-2023', 'dd-mm-yyyy'), 184598, 199474);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-04-2019', 'dd-mm-yyyy'), 433646, 886775);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-10-2017', 'dd-mm-yyyy'), 901791, 481872);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-06-2005', 'dd-mm-yyyy'), 445250, 752523);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-05-2004', 'dd-mm-yyyy'), 111613, 714687);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-06-1972', 'dd-mm-yyyy'), 162853, 391556);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-02-2001', 'dd-mm-yyyy'), 155952, 414784);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-07-1992', 'dd-mm-yyyy'), 155051, 913868);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-11-1973', 'dd-mm-yyyy'), 491281, 647428);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-07-2012', 'dd-mm-yyyy'), 860716, 566661);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-06-2012', 'dd-mm-yyyy'), 630285, 299887);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-03-1982', 'dd-mm-yyyy'), 750281, 391556);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-03-1976', 'dd-mm-yyyy'), 576839, 329844);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-01-1992', 'dd-mm-yyyy'), 834007, 583676);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-09-2014', 'dd-mm-yyyy'), 409531, 961253);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-05-1977', 'dd-mm-yyyy'), 944932, 823654);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-10-2001', 'dd-mm-yyyy'), 918260, 926356);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-08-1971', 'dd-mm-yyyy'), 369909, 193786);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-05-1995', 'dd-mm-yyyy'), 748949, 519646);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-06-1984', 'dd-mm-yyyy'), 471300, 295494);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-05-2017', 'dd-mm-yyyy'), 478332, 951887);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-05-2003', 'dd-mm-yyyy'), 523408, 394876);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-10-2020', 'dd-mm-yyyy'), 894953, 457366);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-12-2013', 'dd-mm-yyyy'), 944932, 372314);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-05-2022', 'dd-mm-yyyy'), 905574, 686732);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-06-2004', 'dd-mm-yyyy'), 389015, 428738);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-09-1996', 'dd-mm-yyyy'), 283856, 518899);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-04-1987', 'dd-mm-yyyy'), 134819, 458644);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-06-1986', 'dd-mm-yyyy'), 478332, 839423);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-01-1994', 'dd-mm-yyyy'), 959171, 962419);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-09-2004', 'dd-mm-yyyy'), 374180, 169882);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-06-1991', 'dd-mm-yyyy'), 438559, 469997);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-06-1971', 'dd-mm-yyyy'), 312279, 793787);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-03-2001', 'dd-mm-yyyy'), 831456, 881662);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-01-1973', 'dd-mm-yyyy'), 335094, 278349);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-02-1980', 'dd-mm-yyyy'), 367283, 693231);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-05-1993', 'dd-mm-yyyy'), 907942, 293134);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-10-1998', 'dd-mm-yyyy'), 945009, 797936);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-08-2012', 'dd-mm-yyyy'), 797118, 962419);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-05-1987', 'dd-mm-yyyy'), 674497, 137139);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-09-2009', 'dd-mm-yyyy'), 996704, 333554);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-05-2012', 'dd-mm-yyyy'), 801207, 299186);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-07-1988', 'dd-mm-yyyy'), 140337, 782739);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-06-1979', 'dd-mm-yyyy'), 221565, 373732);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-04-1994', 'dd-mm-yyyy'), 726404, 387833);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-11-1970', 'dd-mm-yyyy'), 848823, 531298);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-05-2008', 'dd-mm-yyyy'), 133479, 899543);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-09-2003', 'dd-mm-yyyy'), 183912, 367497);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-01-1970', 'dd-mm-yyyy'), 716113, 917321);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-02-2020', 'dd-mm-yyyy'), 294589, 595522);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-06-1992', 'dd-mm-yyyy'), 297396, 127756);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-04-2004', 'dd-mm-yyyy'), 654041, 831673);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-08-1987', 'dd-mm-yyyy'), 109331, 446793);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-09-2022', 'dd-mm-yyyy'), 134819, 498889);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-09-1978', 'dd-mm-yyyy'), 959939, 766499);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-06-1991', 'dd-mm-yyyy'), 234823, 977737);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-02-2003', 'dd-mm-yyyy'), 639219, 448399);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-06-1970', 'dd-mm-yyyy'), 182415, 692743);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-02-2007', 'dd-mm-yyyy'), 297345, 284657);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-05-2014', 'dd-mm-yyyy'), 203918, 665411);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-06-1995', 'dd-mm-yyyy'), 869967, 341175);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-08-2005', 'dd-mm-yyyy'), 309024, 824772);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-02-2014', 'dd-mm-yyyy'), 162853, 883729);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-01-2001', 'dd-mm-yyyy'), 282991, 946737);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-11-1976', 'dd-mm-yyyy'), 613895, 883729);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-09-2012', 'dd-mm-yyyy'), 485069, 946737);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-09-2020', 'dd-mm-yyyy'), 461632, 312794);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-09-1973', 'dd-mm-yyyy'), 327996, 441216);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-10-1994', 'dd-mm-yyyy'), 712415, 632189);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-09-2001', 'dd-mm-yyyy'), 669976, 145182);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-05-1986', 'dd-mm-yyyy'), 778333, 545163);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-11-2023', 'dd-mm-yyyy'), 112644, 814785);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-06-2020', 'dd-mm-yyyy'), 134819, 391556);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-09-2022', 'dd-mm-yyyy'), 461632, 987433);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-04-2019', 'dd-mm-yyyy'), 964156, 793336);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-01-1986', 'dd-mm-yyyy'), 335094, 913868);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-10-2014', 'dd-mm-yyyy'), 291468, 719416);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-07-1991', 'dd-mm-yyyy'), 513436, 255696);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-05-2016', 'dd-mm-yyyy'), 507405, 325119);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-05-2013', 'dd-mm-yyyy'), 740158, 882337);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-08-1984', 'dd-mm-yyyy'), 470454, 351334);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-10-1984', 'dd-mm-yyyy'), 477362, 632189);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-08-1994', 'dd-mm-yyyy'), 809906, 842346);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-12-2011', 'dd-mm-yyyy'), 160706, 469673);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-02-2020', 'dd-mm-yyyy'), 860716, 827524);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-02-2000', 'dd-mm-yyyy'), 369909, 617136);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-05-1995', 'dd-mm-yyyy'), 544948, 536795);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-12-1977', 'dd-mm-yyyy'), 270239, 926356);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-07-1992', 'dd-mm-yyyy'), 718556, 319454);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-06-1983', 'dd-mm-yyyy'), 548719, 632974);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-04-1983', 'dd-mm-yyyy'), 834478, 584726);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-08-1983', 'dd-mm-yyyy'), 795399, 329844);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-01-2015', 'dd-mm-yyyy'), 309024, 977737);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-09-2015', 'dd-mm-yyyy'), 689540, 984478);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-06-2005', 'dd-mm-yyyy'), 860716, 355515);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-06-1981', 'dd-mm-yyyy'), 459990, 457259);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-11-2015', 'dd-mm-yyyy'), 561065, 617679);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-08-2021', 'dd-mm-yyyy'), 461632, 628794);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-11-1972', 'dd-mm-yyyy'), 669976, 333447);
commit;
prompt 200 records committed...
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-02-1991', 'dd-mm-yyyy'), 834478, 387731);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-12-1987', 'dd-mm-yyyy'), 130245, 696558);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-05-2006', 'dd-mm-yyyy'), 623578, 163671);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-05-2010', 'dd-mm-yyyy'), 738920, 681494);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-10-1998', 'dd-mm-yyyy'), 810237, 872846);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-07-1997', 'dd-mm-yyyy'), 474260, 225327);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-02-1992', 'dd-mm-yyyy'), 197432, 586425);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-09-2001', 'dd-mm-yyyy'), 579470, 214233);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-01-1996', 'dd-mm-yyyy'), 678123, 692743);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-04-2022', 'dd-mm-yyyy'), 359971, 648933);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-12-1981', 'dd-mm-yyyy'), 240771, 618555);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-05-2011', 'dd-mm-yyyy'), 686752, 682623);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-07-2004', 'dd-mm-yyyy'), 717850, 895249);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-09-1977', 'dd-mm-yyyy'), 544948, 127443);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-02-2019', 'dd-mm-yyyy'), 264063, 987167);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-11-2017', 'dd-mm-yyyy'), 572415, 497197);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-05-1997', 'dd-mm-yyyy'), 945009, 745367);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-11-1975', 'dd-mm-yyyy'), 815242, 519837);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-03-1990', 'dd-mm-yyyy'), 430887, 145182);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-07-2016', 'dd-mm-yyyy'), 180861, 961549);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-11-1970', 'dd-mm-yyyy'), 944932, 165555);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-04-2006', 'dd-mm-yyyy'), 331283, 634346);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-11-1973', 'dd-mm-yyyy'), 324630, 396511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-07-1985', 'dd-mm-yyyy'), 282991, 681588);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-08-1996', 'dd-mm-yyyy'), 523408, 235824);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-08-1979', 'dd-mm-yyyy'), 175164, 983467);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-12-1994', 'dd-mm-yyyy'), 740158, 457366);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-08-1985', 'dd-mm-yyyy'), 944932, 814567);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-08-1990', 'dd-mm-yyyy'), 446880, 687546);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-01-2004', 'dd-mm-yyyy'), 904407, 397429);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-09-2013', 'dd-mm-yyyy'), 570342, 534494);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-05-2022', 'dd-mm-yyyy'), 438559, 413974);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-06-1980', 'dd-mm-yyyy'), 435484, 826511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-05-2014', 'dd-mm-yyyy'), 471300, 782739);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-03-2015', 'dd-mm-yyyy'), 202948, 269578);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-10-2023', 'dd-mm-yyyy'), 678123, 791347);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-12-1982', 'dd-mm-yyyy'), 644325, 191876);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-11-2007', 'dd-mm-yyyy'), 895688, 741495);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-12-2022', 'dd-mm-yyyy'), 500379, 265696);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-11-2023', 'dd-mm-yyyy'), 461672, 568736);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-11-1973', 'dd-mm-yyyy'), 253900, 498889);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-12-1981', 'dd-mm-yyyy'), 404564, 388351);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-11-1982', 'dd-mm-yyyy'), 836895, 865927);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-08-2007', 'dd-mm-yyyy'), 657576, 977485);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-03-2013', 'dd-mm-yyyy'), 570342, 324351);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-03-1984', 'dd-mm-yyyy'), 788430, 554412);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-07-2022', 'dd-mm-yyyy'), 433646, 868472);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-08-1970', 'dd-mm-yyyy'), 628314, 974567);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-05-2002', 'dd-mm-yyyy'), 335094, 275497);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-03-1995', 'dd-mm-yyyy'), 440144, 299749);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-04-1970', 'dd-mm-yyyy'), 357713, 719416);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-03-2002', 'dd-mm-yyyy'), 754814, 127443);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-07-1978', 'dd-mm-yyyy'), 394902, 615292);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-06-1972', 'dd-mm-yyyy'), 380172, 728967);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-06-1971', 'dd-mm-yyyy'), 261560, 783724);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-10-1993', 'dd-mm-yyyy'), 207346, 467767);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-05-2016', 'dd-mm-yyyy'), 912112, 612374);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-12-2020', 'dd-mm-yyyy'), 277712, 351616);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-10-1972', 'dd-mm-yyyy'), 244664, 778134);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-04-2003', 'dd-mm-yyyy'), 491281, 986351);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-10-2015', 'dd-mm-yyyy'), 219861, 287244);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-02-2014', 'dd-mm-yyyy'), 180861, 824889);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-07-1992', 'dd-mm-yyyy'), 308204, 583224);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-11-1982', 'dd-mm-yyyy'), 155051, 977196);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-09-1995', 'dd-mm-yyyy'), 958031, 987433);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-04-2014', 'dd-mm-yyyy'), 945009, 595483);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-09-2007', 'dd-mm-yyyy'), 551005, 262276);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-07-1980', 'dd-mm-yyyy'), 983762, 814567);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-09-2003', 'dd-mm-yyyy'), 197432, 449621);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-09-1976', 'dd-mm-yyyy'), 308204, 924264);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-08-1990', 'dd-mm-yyyy'), 175164, 821516);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-06-1984', 'dd-mm-yyyy'), 907942, 692743);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-02-2017', 'dd-mm-yyyy'), 904407, 481237);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-05-2002', 'dd-mm-yyyy'), 959939, 977485);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-02-1985', 'dd-mm-yyyy'), 760971, 925575);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-07-2006', 'dd-mm-yyyy'), 182415, 269282);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-04-2005', 'dd-mm-yyyy'), 236610, 449621);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-10-1978', 'dd-mm-yyyy'), 569743, 379354);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-02-2021', 'dd-mm-yyyy'), 540193, 435731);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-03-1979', 'dd-mm-yyyy'), 328827, 839423);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-12-2011', 'dd-mm-yyyy'), 756301, 214233);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-08-2008', 'dd-mm-yyyy'), 823287, 379745);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-05-2003', 'dd-mm-yyyy'), 981509, 834828);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-06-1981', 'dd-mm-yyyy'), 682840, 338882);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-06-2020', 'dd-mm-yyyy'), 297396, 652238);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-06-2003', 'dd-mm-yyyy'), 826275, 525239);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-05-1996', 'dd-mm-yyyy'), 389015, 525239);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-09-2015', 'dd-mm-yyyy'), 912112, 683451);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-02-1976', 'dd-mm-yyyy'), 221490, 269226);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-01-1980', 'dd-mm-yyyy'), 591927, 814835);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-10-1982', 'dd-mm-yyyy'), 354993, 762291);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-09-1985', 'dd-mm-yyyy'), 333934, 766753);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-12-1973', 'dd-mm-yyyy'), 214652, 964955);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-01-2004', 'dd-mm-yyyy'), 827713, 939511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-06-1979', 'dd-mm-yyyy'), 674205, 865927);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-11-1994', 'dd-mm-yyyy'), 331283, 146385);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-11-1979', 'dd-mm-yyyy'), 569011, 937781);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-02-1990', 'dd-mm-yyyy'), 541094, 518618);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-10-1994', 'dd-mm-yyyy'), 847204, 372314);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-09-2011', 'dd-mm-yyyy'), 469937, 399844);
commit;
prompt 300 records committed...
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-02-1991', 'dd-mm-yyyy'), 964156, 753544);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-04-2013', 'dd-mm-yyyy'), 183912, 375151);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-10-1978', 'dd-mm-yyyy'), 848823, 269578);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-02-1973', 'dd-mm-yyyy'), 943556, 146385);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-05-1976', 'dd-mm-yyyy'), 333020, 191535);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-11-2009', 'dd-mm-yyyy'), 133272, 939511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-07-1983', 'dd-mm-yyyy'), 589388, 726562);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-12-1996', 'dd-mm-yyyy'), 689540, 355145);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-07-1984', 'dd-mm-yyyy'), 183723, 468277);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-05-1984', 'dd-mm-yyyy'), 535461, 295494);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-07-2004', 'dd-mm-yyyy'), 755078, 974567);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-10-2007', 'dd-mm-yyyy'), 855354, 798987);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-05-2008', 'dd-mm-yyyy'), 852809, 689987);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-08-2008', 'dd-mm-yyyy'), 134705, 595522);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-02-2021', 'dd-mm-yyyy'), 384076, 211928);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-06-1997', 'dd-mm-yyyy'), 582670, 838487);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-04-2018', 'dd-mm-yyyy'), 626060, 525239);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-07-2015', 'dd-mm-yyyy'), 706453, 668664);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-06-2005', 'dd-mm-yyyy'), 796195, 849224);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-06-1978', 'dd-mm-yyyy'), 576839, 226995);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-01-1997', 'dd-mm-yyyy'), 440144, 839423);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-01-2004', 'dd-mm-yyyy'), 389015, 583676);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-07-2008', 'dd-mm-yyyy'), 668082, 114715);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-06-2010', 'dd-mm-yyyy'), 240771, 886322);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-03-1983', 'dd-mm-yyyy'), 438559, 652587);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-05-1980', 'dd-mm-yyyy'), 369909, 958314);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-09-2013', 'dd-mm-yyyy'), 544948, 692743);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-03-1982', 'dd-mm-yyyy'), 632977, 819964);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-12-1981', 'dd-mm-yyyy'), 661423, 426167);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-01-2006', 'dd-mm-yyyy'), 606688, 375718);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-08-2018', 'dd-mm-yyyy'), 239891, 352658);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-04-1991', 'dd-mm-yyyy'), 929656, 712238);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-08-1994', 'dd-mm-yyyy'), 901304, 265163);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-09-1976', 'dd-mm-yyyy'), 234823, 299513);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-05-2007', 'dd-mm-yyyy'), 703114, 719416);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-12-1998', 'dd-mm-yyyy'), 945783, 182726);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-07-1998', 'dd-mm-yyyy'), 852809, 351616);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-07-2019', 'dd-mm-yyyy'), 611558, 456442);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-05-1977', 'dd-mm-yyyy'), 373297, 225327);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-04-2009', 'dd-mm-yyyy'), 788430, 569353);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-03-1993', 'dd-mm-yyyy'), 422604, 961549);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-02-2018', 'dd-mm-yyyy'), 867047, 394876);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-01-1980', 'dd-mm-yyyy'), 863669, 428738);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-09-2021', 'dd-mm-yyyy'), 827389, 127443);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-09-1971', 'dd-mm-yyyy'), 901791, 865581);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-07-1995', 'dd-mm-yyyy'), 758228, 435731);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-05-1986', 'dd-mm-yyyy'), 945009, 821516);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-05-1999', 'dd-mm-yyyy'), 337511, 566661);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-09-2013', 'dd-mm-yyyy'), 411649, 526252);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-06-2000', 'dd-mm-yyyy'), 801207, 698952);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-03-2000', 'dd-mm-yyyy'), 848823, 824889);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-03-2000', 'dd-mm-yyyy'), 471300, 456142);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-04-2007', 'dd-mm-yyyy'), 222100, 799539);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-05-2003', 'dd-mm-yyyy'), 875446, 659778);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-04-1983', 'dd-mm-yyyy'), 327285, 329156);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-03-1979', 'dd-mm-yyyy'), 760971, 499329);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-07-1982', 'dd-mm-yyyy'), 427631, 399221);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-11-1997', 'dd-mm-yyyy'), 294589, 435731);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-05-1989', 'dd-mm-yyyy'), 223329, 566851);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-06-1978', 'dd-mm-yyyy'), 778397, 854717);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-02-1994', 'dd-mm-yyyy'), 757015, 944135);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-12-1970', 'dd-mm-yyyy'), 471300, 439258);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-01-1990', 'dd-mm-yyyy'), 438559, 361431);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-10-1970', 'dd-mm-yyyy'), 908571, 778134);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-07-2020', 'dd-mm-yyyy'), 626060, 838487);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-09-2018', 'dd-mm-yyyy'), 981509, 799136);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-04-1978', 'dd-mm-yyyy'), 706453, 531838);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-05-1990', 'dd-mm-yyyy'), 960929, 169942);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-05-1983', 'dd-mm-yyyy'), 639023, 225327);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-10-1972', 'dd-mm-yyyy'), 797118, 696558);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-02-1970', 'dd-mm-yyyy'), 512844, 977737);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-11-2006', 'dd-mm-yyyy'), 668082, 414943);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-12-2002', 'dd-mm-yyyy'), 471300, 329156);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('29-05-1982', 'dd-mm-yyyy'), 389015, 126385);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-11-1972', 'dd-mm-yyyy'), 440144, 414318);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-09-1986', 'dd-mm-yyyy'), 644729, 312794);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-09-1987', 'dd-mm-yyyy'), 920436, 469997);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-02-1977', 'dd-mm-yyyy'), 283856, 565211);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-02-2002', 'dd-mm-yyyy'), 576839, 531298);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-01-2005', 'dd-mm-yyyy'), 221565, 899543);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-11-2004', 'dd-mm-yyyy'), 512844, 165536);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-04-1971', 'dd-mm-yyyy'), 944932, 865349);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-12-1972', 'dd-mm-yyyy'), 929656, 193786);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-10-2009', 'dd-mm-yyyy'), 711090, 977788);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-02-2014', 'dd-mm-yyyy'), 327656, 644968);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-08-1977', 'dd-mm-yyyy'), 833650, 144335);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-10-2007', 'dd-mm-yyyy'), 548719, 944135);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-04-1998', 'dd-mm-yyyy'), 454615, 728967);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-06-2003', 'dd-mm-yyyy'), 188447, 855636);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-10-1996', 'dd-mm-yyyy'), 718556, 911698);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-04-1981', 'dd-mm-yyyy'), 651661, 232339);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-10-2017', 'dd-mm-yyyy'), 591399, 325119);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-12-2005', 'dd-mm-yyyy'), 960929, 255696);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-11-2018', 'dd-mm-yyyy'), 996704, 583676);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-02-2014', 'dd-mm-yyyy'), 337511, 933449);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-11-2015', 'dd-mm-yyyy'), 141253, 115382);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-06-1977', 'dd-mm-yyyy'), 757015, 919592);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-05-1986', 'dd-mm-yyyy'), 236610, 879964);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-05-2001', 'dd-mm-yyyy'), 177807, 441945);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-05-2012', 'dd-mm-yyyy'), 649035, 319162);
commit;
prompt 400 records committed...
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-06-2018', 'dd-mm-yyyy'), 686752, 245169);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-11-2008', 'dd-mm-yyyy'), 200551, 191535);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('31-10-2023', 'dd-mm-yyyy'), 844333, 226995);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-07-1994', 'dd-mm-yyyy'), 429637, 298372);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-08-2023', 'dd-mm-yyyy'), 411649, 119637);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-02-1991', 'dd-mm-yyyy'), 920436, 964955);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-09-1971', 'dd-mm-yyyy'), 394735, 975531);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-06-1978', 'dd-mm-yyyy'), 834478, 372314);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-10-1976', 'dd-mm-yyyy'), 756301, 144335);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-03-2023', 'dd-mm-yyyy'), 580371, 484519);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-06-1985', 'dd-mm-yyyy'), 569011, 393727);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-06-1992', 'dd-mm-yyyy'), 773780, 977134);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-11-2000', 'dd-mm-yyyy'), 901791, 752523);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-08-2016', 'dd-mm-yyyy'), 953250, 235824);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-06-2015', 'dd-mm-yyyy'), 644535, 262276);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-04-2018', 'dd-mm-yyyy'), 958031, 388351);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-01-1995', 'dd-mm-yyyy'), 760971, 324351);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('01-07-2015', 'dd-mm-yyyy'), 912913, 881662);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 239891, 668164);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-06-1998', 'dd-mm-yyyy'), 440144, 936611);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-01-2007', 'dd-mm-yyyy'), 261271, 518899);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-03-2020', 'dd-mm-yyyy'), 373297, 595483);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-07-1973', 'dd-mm-yyyy'), 613895, 418488);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('05-07-1972', 'dd-mm-yyyy'), 833922, 459429);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-07-2004', 'dd-mm-yyyy'), 373297, 352658);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('26-08-2019', 'dd-mm-yyyy'), 953250, 341175);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('12-01-2010', 'dd-mm-yyyy'), 584529, 355515);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-07-1989', 'dd-mm-yyyy'), 409531, 753283);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-06-2002', 'dd-mm-yyyy'), 168097, 762345);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-08-2019', 'dd-mm-yyyy'), 240771, 234178);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-03-2014', 'dd-mm-yyyy'), 361922, 872846);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-03-1995', 'dd-mm-yyyy'), 168414, 645912);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('19-05-1998', 'dd-mm-yyyy'), 548719, 242996);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('25-10-1975', 'dd-mm-yyyy'), 291468, 939511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-05-1987', 'dd-mm-yyyy'), 699268, 334896);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-11-2018', 'dd-mm-yyyy'), 838212, 783429);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-09-1994', 'dd-mm-yyyy'), 689540, 735159);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-02-1989', 'dd-mm-yyyy'), 338930, 144156);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-03-1983', 'dd-mm-yyyy'), 491281, 573952);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('17-11-2018', 'dd-mm-yyyy'), 188447, 647181);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('06-01-2020', 'dd-mm-yyyy'), 855891, 275497);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-11-1993', 'dd-mm-yyyy'), 491281, 975531);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-07-1993', 'dd-mm-yyyy'), 374180, 826511);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-04-2008', 'dd-mm-yyyy'), 110069, 615292);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-03-2022', 'dd-mm-yyyy'), 716113, 122174);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-08-1974', 'dd-mm-yyyy'), 589388, 396365);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-08-1992', 'dd-mm-yyyy'), 602541, 169942);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('16-09-2010', 'dd-mm-yyyy'), 569743, 647181);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-06-2006', 'dd-mm-yyyy'), 920436, 879964);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-02-2023', 'dd-mm-yyyy'), 267923, 267665);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-01-1978', 'dd-mm-yyyy'), 469937, 862379);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-02-2006', 'dd-mm-yyyy'), 772498, 632823);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('23-07-1992', 'dd-mm-yyyy'), 657576, 267165);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-04-1996', 'dd-mm-yyyy'), 172383, 683451);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-03-2022', 'dd-mm-yyyy'), 369909, 397266);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-03-1987', 'dd-mm-yyyy'), 569743, 285662);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-05-1974', 'dd-mm-yyyy'), 469386, 477897);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('10-10-2013', 'dd-mm-yyyy'), 681635, 411951);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-10-1982', 'dd-mm-yyyy'), 788430, 874343);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-06-1986', 'dd-mm-yyyy'), 201618, 668664);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-11-1971', 'dd-mm-yyyy'), 443754, 677517);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-02-2008', 'dd-mm-yyyy'), 513436, 968148);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-05-1999', 'dd-mm-yyyy'), 810504, 261842);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('20-06-2005', 'dd-mm-yyyy'), 208026, 323711);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-08-2005', 'dd-mm-yyyy'), 810504, 346449);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('02-10-1973', 'dd-mm-yyyy'), 904407, 575217);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-08-1985', 'dd-mm-yyyy'), 613903, 169942);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-12-2004', 'dd-mm-yyyy'), 813975, 823497);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-05-2002', 'dd-mm-yyyy'), 521884, 325119);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 409051, 457259);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-04-1977', 'dd-mm-yyyy'), 183723, 519837);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-02-2022', 'dd-mm-yyyy'), 264063, 968446);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-03-1978', 'dd-mm-yyyy'), 676794, 179589);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-04-1974', 'dd-mm-yyyy'), 461672, 583224);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-03-2006', 'dd-mm-yyyy'), 259579, 947427);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-02-2005', 'dd-mm-yyyy'), 270239, 148158);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-05-1991', 'dd-mm-yyyy'), 810504, 668164);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-04-1976', 'dd-mm-yyyy'), 444711, 961549);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('11-05-1977', 'dd-mm-yyyy'), 664989, 714841);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('22-10-1999', 'dd-mm-yyyy'), 203918, 192413);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('24-11-2020', 'dd-mm-yyyy'), 475298, 152883);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-11-1995', 'dd-mm-yyyy'), 823287, 119637);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-03-1983', 'dd-mm-yyyy'), 827389, 939731);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('13-12-1980', 'dd-mm-yyyy'), 470454, 399221);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('21-06-1997', 'dd-mm-yyyy'), 110069, 441945);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-07-2010', 'dd-mm-yyyy'), 572415, 766499);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('09-02-1984', 'dd-mm-yyyy'), 759116, 426121);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-01-1990', 'dd-mm-yyyy'), 672620, 798987);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('08-02-2006', 'dd-mm-yyyy'), 788430, 623573);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('30-01-1995', 'dd-mm-yyyy'), 222100, 319162);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-12-2022', 'dd-mm-yyyy'), 474260, 668664);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('14-02-2007', 'dd-mm-yyyy'), 155051, 355515);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-05-1990', 'dd-mm-yyyy'), 460464, 226257);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('18-01-1971', 'dd-mm-yyyy'), 515797, 618555);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('07-05-1984', 'dd-mm-yyyy'), 338930, 293938);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('04-02-1975', 'dd-mm-yyyy'), 201485, 938259);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('15-01-1984', 'dd-mm-yyyy'), 583116, 964955);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('27-08-1974', 'dd-mm-yyyy'), 333934, 374848);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('03-10-1984', 'dd-mm-yyyy'), 591819, 341175);
insert into DRIVEAT (dateofdrive, soldierid, vehicleid)
values (to_date('28-10-1973', 'dd-mm-yyyy'), 831456, 341175);
commit;
prompt 500 records loaded
prompt Loading HADACCIDENT...
insert into HADACCIDENT (accidentid, vehicleid)
values (873566, 293134);
insert into HADACCIDENT (accidentid, vehicleid)
values (338297, 396511);
insert into HADACCIDENT (accidentid, vehicleid)
values (634678, 964723);
insert into HADACCIDENT (accidentid, vehicleid)
values (253292, 874343);
insert into HADACCIDENT (accidentid, vehicleid)
values (395678, 448399);
insert into HADACCIDENT (accidentid, vehicleid)
values (473373, 333447);
insert into HADACCIDENT (accidentid, vehicleid)
values (132966, 644373);
insert into HADACCIDENT (accidentid, vehicleid)
values (565371, 998418);
insert into HADACCIDENT (accidentid, vehicleid)
values (915598, 258488);
insert into HADACCIDENT (accidentid, vehicleid)
values (559933, 397394);
insert into HADACCIDENT (accidentid, vehicleid)
values (792793, 756815);
insert into HADACCIDENT (accidentid, vehicleid)
values (527289, 977737);
insert into HADACCIDENT (accidentid, vehicleid)
values (923131, 578981);
insert into HADACCIDENT (accidentid, vehicleid)
values (434369, 372314);
insert into HADACCIDENT (accidentid, vehicleid)
values (999623, 115382);
insert into HADACCIDENT (accidentid, vehicleid)
values (817244, 968148);
insert into HADACCIDENT (accidentid, vehicleid)
values (119977, 334317);
insert into HADACCIDENT (accidentid, vehicleid)
values (522941, 827524);
insert into HADACCIDENT (accidentid, vehicleid)
values (572734, 977196);
insert into HADACCIDENT (accidentid, vehicleid)
values (351136, 467767);
insert into HADACCIDENT (accidentid, vehicleid)
values (626498, 912239);
insert into HADACCIDENT (accidentid, vehicleid)
values (435172, 522964);
insert into HADACCIDENT (accidentid, vehicleid)
values (686613, 219453);
insert into HADACCIDENT (accidentid, vehicleid)
values (471742, 496964);
insert into HADACCIDENT (accidentid, vehicleid)
values (229786, 681588);
insert into HADACCIDENT (accidentid, vehicleid)
values (227835, 346449);
insert into HADACCIDENT (accidentid, vehicleid)
values (138597, 269226);
insert into HADACCIDENT (accidentid, vehicleid)
values (341592, 882337);
insert into HADACCIDENT (accidentid, vehicleid)
values (394431, 818531);
insert into HADACCIDENT (accidentid, vehicleid)
values (253292, 481237);
insert into HADACCIDENT (accidentid, vehicleid)
values (175468, 565211);
insert into HADACCIDENT (accidentid, vehicleid)
values (361321, 665411);
insert into HADACCIDENT (accidentid, vehicleid)
values (826972, 295685);
insert into HADACCIDENT (accidentid, vehicleid)
values (219576, 334317);
insert into HADACCIDENT (accidentid, vehicleid)
values (271411, 661551);
insert into HADACCIDENT (accidentid, vehicleid)
values (882484, 182726);
insert into HADACCIDENT (accidentid, vehicleid)
values (171343, 298372);
insert into HADACCIDENT (accidentid, vehicleid)
values (321134, 986351);
insert into HADACCIDENT (accidentid, vehicleid)
values (631187, 455926);
insert into HADACCIDENT (accidentid, vehicleid)
values (333126, 519646);
insert into HADACCIDENT (accidentid, vehicleid)
values (817244, 325119);
insert into HADACCIDENT (accidentid, vehicleid)
values (186827, 831673);
insert into HADACCIDENT (accidentid, vehicleid)
values (698295, 783429);
insert into HADACCIDENT (accidentid, vehicleid)
values (591155, 383246);
insert into HADACCIDENT (accidentid, vehicleid)
values (365753, 683451);
insert into HADACCIDENT (accidentid, vehicleid)
values (713374, 793787);
insert into HADACCIDENT (accidentid, vehicleid)
values (691694, 333588);
insert into HADACCIDENT (accidentid, vehicleid)
values (712426, 152883);
insert into HADACCIDENT (accidentid, vehicleid)
values (174546, 694336);
insert into HADACCIDENT (accidentid, vehicleid)
values (775493, 883729);
insert into HADACCIDENT (accidentid, vehicleid)
values (456894, 735159);
insert into HADACCIDENT (accidentid, vehicleid)
values (376768, 648933);
insert into HADACCIDENT (accidentid, vehicleid)
values (964851, 299345);
insert into HADACCIDENT (accidentid, vehicleid)
values (198756, 444396);
insert into HADACCIDENT (accidentid, vehicleid)
values (988378, 951887);
insert into HADACCIDENT (accidentid, vehicleid)
values (281466, 245169);
insert into HADACCIDENT (accidentid, vehicleid)
values (436888, 913868);
insert into HADACCIDENT (accidentid, vehicleid)
values (627774, 768721);
insert into HADACCIDENT (accidentid, vehicleid)
values (896935, 569863);
insert into HADACCIDENT (accidentid, vehicleid)
values (695441, 546253);
insert into HADACCIDENT (accidentid, vehicleid)
values (151546, 333588);
insert into HADACCIDENT (accidentid, vehicleid)
values (132262, 235824);
insert into HADACCIDENT (accidentid, vehicleid)
values (115991, 686732);
insert into HADACCIDENT (accidentid, vehicleid)
values (196496, 524233);
insert into HADACCIDENT (accidentid, vehicleid)
values (838659, 661551);
insert into HADACCIDENT (accidentid, vehicleid)
values (591997, 542827);
insert into HADACCIDENT (accidentid, vehicleid)
values (351392, 115382);
insert into HADACCIDENT (accidentid, vehicleid)
values (927183, 293938);
insert into HADACCIDENT (accidentid, vehicleid)
values (261173, 618555);
insert into HADACCIDENT (accidentid, vehicleid)
values (627864, 367497);
insert into HADACCIDENT (accidentid, vehicleid)
values (965515, 814835);
insert into HADACCIDENT (accidentid, vehicleid)
values (467219, 444396);
insert into HADACCIDENT (accidentid, vehicleid)
values (326838, 962419);
insert into HADACCIDENT (accidentid, vehicleid)
values (386499, 522964);
insert into HADACCIDENT (accidentid, vehicleid)
values (456821, 647315);
insert into HADACCIDENT (accidentid, vehicleid)
values (222981, 197992);
insert into HADACCIDENT (accidentid, vehicleid)
values (434452, 397266);
insert into HADACCIDENT (accidentid, vehicleid)
values (175583, 575682);
insert into HADACCIDENT (accidentid, vehicleid)
values (376768, 845427);
insert into HADACCIDENT (accidentid, vehicleid)
values (873566, 127756);
insert into HADACCIDENT (accidentid, vehicleid)
values (422616, 333588);
insert into HADACCIDENT (accidentid, vehicleid)
values (238665, 665411);
insert into HADACCIDENT (accidentid, vehicleid)
values (627864, 461688);
insert into HADACCIDENT (accidentid, vehicleid)
values (367424, 397895);
insert into HADACCIDENT (accidentid, vehicleid)
values (627864, 823654);
insert into HADACCIDENT (accidentid, vehicleid)
values (716592, 568924);
insert into HADACCIDENT (accidentid, vehicleid)
values (968831, 459636);
insert into HADACCIDENT (accidentid, vehicleid)
values (238665, 127443);
insert into HADACCIDENT (accidentid, vehicleid)
values (288732, 988781);
insert into HADACCIDENT (accidentid, vehicleid)
values (381943, 169942);
insert into HADACCIDENT (accidentid, vehicleid)
values (394431, 163671);
insert into HADACCIDENT (accidentid, vehicleid)
values (744623, 152883);
insert into HADACCIDENT (accidentid, vehicleid)
values (714482, 526878);
insert into HADACCIDENT (accidentid, vehicleid)
values (794184, 275497);
insert into HADACCIDENT (accidentid, vehicleid)
values (986488, 319454);
insert into HADACCIDENT (accidentid, vehicleid)
values (361819, 791347);
insert into HADACCIDENT (accidentid, vehicleid)
values (219759, 961549);
insert into HADACCIDENT (accidentid, vehicleid)
values (914646, 457259);
insert into HADACCIDENT (accidentid, vehicleid)
values (463176, 762291);
insert into HADACCIDENT (accidentid, vehicleid)
values (737921, 977134);
commit;
prompt 100 records committed...
insert into HADACCIDENT (accidentid, vehicleid)
values (728882, 124553);
insert into HADACCIDENT (accidentid, vehicleid)
values (983522, 241979);
insert into HADACCIDENT (accidentid, vehicleid)
values (683756, 896965);
insert into HADACCIDENT (accidentid, vehicleid)
values (975672, 849224);
insert into HADACCIDENT (accidentid, vehicleid)
values (868738, 886322);
insert into HADACCIDENT (accidentid, vehicleid)
values (927128, 319162);
insert into HADACCIDENT (accidentid, vehicleid)
values (965515, 977196);
insert into HADACCIDENT (accidentid, vehicleid)
values (376768, 814567);
insert into HADACCIDENT (accidentid, vehicleid)
values (166476, 171715);
insert into HADACCIDENT (accidentid, vehicleid)
values (426211, 378729);
insert into HADACCIDENT (accidentid, vehicleid)
values (958646, 939511);
insert into HADACCIDENT (accidentid, vehicleid)
values (397424, 583346);
insert into HADACCIDENT (accidentid, vehicleid)
values (882435, 548665);
insert into HADACCIDENT (accidentid, vehicleid)
values (527289, 577836);
insert into HADACCIDENT (accidentid, vehicleid)
values (618447, 848765);
insert into HADACCIDENT (accidentid, vehicleid)
values (395678, 525817);
insert into HADACCIDENT (accidentid, vehicleid)
values (737921, 361431);
insert into HADACCIDENT (accidentid, vehicleid)
values (255955, 273848);
insert into HADACCIDENT (accidentid, vehicleid)
values (998855, 783724);
insert into HADACCIDENT (accidentid, vehicleid)
values (677361, 441881);
insert into HADACCIDENT (accidentid, vehicleid)
values (259151, 666686);
insert into HADACCIDENT (accidentid, vehicleid)
values (943912, 341175);
insert into HADACCIDENT (accidentid, vehicleid)
values (781445, 546435);
insert into HADACCIDENT (accidentid, vehicleid)
values (694734, 998418);
insert into HADACCIDENT (accidentid, vehicleid)
values (434369, 295685);
insert into HADACCIDENT (accidentid, vehicleid)
values (545673, 414784);
insert into HADACCIDENT (accidentid, vehicleid)
values (238665, 542827);
insert into HADACCIDENT (accidentid, vehicleid)
values (376768, 341175);
insert into HADACCIDENT (accidentid, vehicleid)
values (327653, 899543);
insert into HADACCIDENT (accidentid, vehicleid)
values (443774, 529282);
insert into HADACCIDENT (accidentid, vehicleid)
values (163797, 623573);
insert into HADACCIDENT (accidentid, vehicleid)
values (424456, 575682);
insert into HADACCIDENT (accidentid, vehicleid)
values (781445, 351616);
insert into HADACCIDENT (accidentid, vehicleid)
values (527289, 924264);
insert into HADACCIDENT (accidentid, vehicleid)
values (435172, 178171);
insert into HADACCIDENT (accidentid, vehicleid)
values (515131, 278349);
insert into HADACCIDENT (accidentid, vehicleid)
values (186827, 726562);
insert into HADACCIDENT (accidentid, vehicleid)
values (185379, 258488);
insert into HADACCIDENT (accidentid, vehicleid)
values (964851, 812556);
insert into HADACCIDENT (accidentid, vehicleid)
values (942271, 958167);
insert into HADACCIDENT (accidentid, vehicleid)
values (295961, 745367);
insert into HADACCIDENT (accidentid, vehicleid)
values (484674, 911698);
insert into HADACCIDENT (accidentid, vehicleid)
values (618447, 114715);
insert into HADACCIDENT (accidentid, vehicleid)
values (464975, 573952);
insert into HADACCIDENT (accidentid, vehicleid)
values (223286, 397266);
insert into HADACCIDENT (accidentid, vehicleid)
values (276246, 355515);
insert into HADACCIDENT (accidentid, vehicleid)
values (318481, 926356);
insert into HADACCIDENT (accidentid, vehicleid)
values (837886, 372314);
insert into HADACCIDENT (accidentid, vehicleid)
values (872713, 545163);
insert into HADACCIDENT (accidentid, vehicleid)
values (564346, 764916);
insert into HADACCIDENT (accidentid, vehicleid)
values (268223, 499329);
insert into HADACCIDENT (accidentid, vehicleid)
values (988264, 652587);
insert into HADACCIDENT (accidentid, vehicleid)
values (567752, 696372);
insert into HADACCIDENT (accidentid, vehicleid)
values (958453, 548157);
insert into HADACCIDENT (accidentid, vehicleid)
values (936656, 929512);
insert into HADACCIDENT (accidentid, vehicleid)
values (546872, 255696);
insert into HADACCIDENT (accidentid, vehicleid)
values (422616, 371798);
insert into HADACCIDENT (accidentid, vehicleid)
values (387145, 681588);
insert into HADACCIDENT (accidentid, vehicleid)
values (983258, 169942);
insert into HADACCIDENT (accidentid, vehicleid)
values (435913, 995385);
insert into HADACCIDENT (accidentid, vehicleid)
values (356529, 418488);
insert into HADACCIDENT (accidentid, vehicleid)
values (138996, 612695);
insert into HADACCIDENT (accidentid, vehicleid)
values (311686, 726562);
insert into HADACCIDENT (accidentid, vehicleid)
values (131672, 293938);
insert into HADACCIDENT (accidentid, vehicleid)
values (577327, 361251);
insert into HADACCIDENT (accidentid, vehicleid)
values (867387, 285662);
insert into HADACCIDENT (accidentid, vehicleid)
values (568627, 979342);
insert into HADACCIDENT (accidentid, vehicleid)
values (918794, 115382);
insert into HADACCIDENT (accidentid, vehicleid)
values (119715, 525239);
insert into HADACCIDENT (accidentid, vehicleid)
values (616831, 647428);
insert into HADACCIDENT (accidentid, vehicleid)
values (387633, 226257);
insert into HADACCIDENT (accidentid, vehicleid)
values (899699, 563516);
insert into HADACCIDENT (accidentid, vehicleid)
values (477422, 375151);
insert into HADACCIDENT (accidentid, vehicleid)
values (248385, 532864);
insert into HADACCIDENT (accidentid, vehicleid)
values (493597, 814785);
insert into HADACCIDENT (accidentid, vehicleid)
values (596261, 265163);
insert into HADACCIDENT (accidentid, vehicleid)
values (119715, 783429);
insert into HADACCIDENT (accidentid, vehicleid)
values (817146, 765978);
insert into HADACCIDENT (accidentid, vehicleid)
values (965496, 911472);
insert into HADACCIDENT (accidentid, vehicleid)
values (995913, 269226);
insert into HADACCIDENT (accidentid, vehicleid)
values (759726, 634346);
insert into HADACCIDENT (accidentid, vehicleid)
values (351136, 941218);
insert into HADACCIDENT (accidentid, vehicleid)
values (626498, 383922);
insert into HADACCIDENT (accidentid, vehicleid)
values (158714, 565211);
insert into HADACCIDENT (accidentid, vehicleid)
values (832414, 355145);
insert into HADACCIDENT (accidentid, vehicleid)
values (227131, 426121);
insert into HADACCIDENT (accidentid, vehicleid)
values (887651, 583346);
insert into HADACCIDENT (accidentid, vehicleid)
values (572734, 484519);
insert into HADACCIDENT (accidentid, vehicleid)
values (988264, 926914);
insert into HADACCIDENT (accidentid, vehicleid)
values (923835, 456442);
insert into HADACCIDENT (accidentid, vehicleid)
values (494121, 783429);
insert into HADACCIDENT (accidentid, vehicleid)
values (261173, 397394);
insert into HADACCIDENT (accidentid, vehicleid)
values (253292, 584726);
insert into HADACCIDENT (accidentid, vehicleid)
values (227131, 741495);
insert into HADACCIDENT (accidentid, vehicleid)
values (568286, 461688);
insert into HADACCIDENT (accidentid, vehicleid)
values (341441, 524233);
insert into HADACCIDENT (accidentid, vehicleid)
values (424456, 375718);
insert into HADACCIDENT (accidentid, vehicleid)
values (341592, 828532);
insert into HADACCIDENT (accidentid, vehicleid)
values (965496, 545163);
insert into HADACCIDENT (accidentid, vehicleid)
values (456894, 318784);
commit;
prompt 200 records committed...
insert into HADACCIDENT (accidentid, vehicleid)
values (398715, 518618);
insert into HADACCIDENT (accidentid, vehicleid)
values (223286, 348163);
insert into HADACCIDENT (accidentid, vehicleid)
values (152544, 481237);
insert into HADACCIDENT (accidentid, vehicleid)
values (449953, 647181);
insert into HADACCIDENT (accidentid, vehicleid)
values (547113, 191535);
insert into HADACCIDENT (accidentid, vehicleid)
values (214989, 534494);
insert into HADACCIDENT (accidentid, vehicleid)
values (456894, 241979);
insert into HADACCIDENT (accidentid, vehicleid)
values (756229, 831673);
insert into HADACCIDENT (accidentid, vehicleid)
values (784845, 215143);
insert into HADACCIDENT (accidentid, vehicleid)
values (223836, 221689);
insert into HADACCIDENT (accidentid, vehicleid)
values (545373, 324259);
insert into HADACCIDENT (accidentid, vehicleid)
values (122278, 846261);
insert into HADACCIDENT (accidentid, vehicleid)
values (377799, 925575);
insert into HADACCIDENT (accidentid, vehicleid)
values (751245, 768721);
insert into HADACCIDENT (accidentid, vehicleid)
values (223286, 351334);
insert into HADACCIDENT (accidentid, vehicleid)
values (716592, 144335);
insert into HADACCIDENT (accidentid, vehicleid)
values (113315, 823497);
insert into HADACCIDENT (accidentid, vehicleid)
values (949191, 545163);
insert into HADACCIDENT (accidentid, vehicleid)
values (142721, 961253);
insert into HADACCIDENT (accidentid, vehicleid)
values (177137, 269579);
insert into HADACCIDENT (accidentid, vehicleid)
values (159341, 552954);
insert into HADACCIDENT (accidentid, vehicleid)
values (549813, 172568);
insert into HADACCIDENT (accidentid, vehicleid)
values (341846, 617136);
insert into HADACCIDENT (accidentid, vehicleid)
values (494121, 762345);
insert into HADACCIDENT (accidentid, vehicleid)
values (318481, 962611);
insert into HADACCIDENT (accidentid, vehicleid)
values (624953, 298372);
insert into HADACCIDENT (accidentid, vehicleid)
values (912529, 391262);
insert into HADACCIDENT (accidentid, vehicleid)
values (242958, 333691);
insert into HADACCIDENT (accidentid, vehicleid)
values (181279, 824889);
insert into HADACCIDENT (accidentid, vehicleid)
values (151546, 865349);
insert into HADACCIDENT (accidentid, vehicleid)
values (132262, 765978);
insert into HADACCIDENT (accidentid, vehicleid)
values (242958, 882337);
insert into HADACCIDENT (accidentid, vehicleid)
values (271663, 287244);
insert into HADACCIDENT (accidentid, vehicleid)
values (789617, 936611);
insert into HADACCIDENT (accidentid, vehicleid)
values (181279, 441881);
insert into HADACCIDENT (accidentid, vehicleid)
values (626357, 644373);
insert into HADACCIDENT (accidentid, vehicleid)
values (642542, 686732);
insert into HADACCIDENT (accidentid, vehicleid)
values (585773, 578981);
insert into HADACCIDENT (accidentid, vehicleid)
values (214989, 355515);
insert into HADACCIDENT (accidentid, vehicleid)
values (626659, 265163);
insert into HADACCIDENT (accidentid, vehicleid)
values (421512, 977196);
insert into HADACCIDENT (accidentid, vehicleid)
values (113315, 865927);
insert into HADACCIDENT (accidentid, vehicleid)
values (435172, 666262);
insert into HADACCIDENT (accidentid, vehicleid)
values (918373, 299532);
insert into HADACCIDENT (accidentid, vehicleid)
values (568627, 144226);
insert into HADACCIDENT (accidentid, vehicleid)
values (713316, 426121);
insert into HADACCIDENT (accidentid, vehicleid)
values (559933, 632823);
insert into HADACCIDENT (accidentid, vehicleid)
values (817244, 459429);
insert into HADACCIDENT (accidentid, vehicleid)
values (927128, 899543);
insert into HADACCIDENT (accidentid, vehicleid)
values (837886, 962611);
insert into HADACCIDENT (accidentid, vehicleid)
values (328497, 926914);
insert into HADACCIDENT (accidentid, vehicleid)
values (494121, 854717);
insert into HADACCIDENT (accidentid, vehicleid)
values (125355, 799136);
insert into HADACCIDENT (accidentid, vehicleid)
values (242887, 518899);
insert into HADACCIDENT (accidentid, vehicleid)
values (381943, 911472);
insert into HADACCIDENT (accidentid, vehicleid)
values (248385, 986351);
insert into HADACCIDENT (accidentid, vehicleid)
values (713374, 367497);
insert into HADACCIDENT (accidentid, vehicleid)
values (534749, 629388);
insert into HADACCIDENT (accidentid, vehicleid)
values (473373, 329156);
insert into HADACCIDENT (accidentid, vehicleid)
values (811691, 577836);
insert into HADACCIDENT (accidentid, vehicleid)
values (754183, 563516);
insert into HADACCIDENT (accidentid, vehicleid)
values (789617, 666686);
insert into HADACCIDENT (accidentid, vehicleid)
values (363871, 145182);
insert into HADACCIDENT (accidentid, vehicleid)
values (662413, 391556);
insert into HADACCIDENT (accidentid, vehicleid)
values (494121, 449125);
insert into HADACCIDENT (accidentid, vehicleid)
values (973547, 778134);
insert into HADACCIDENT (accidentid, vehicleid)
values (174546, 865349);
insert into HADACCIDENT (accidentid, vehicleid)
values (434452, 242996);
insert into HADACCIDENT (accidentid, vehicleid)
values (175468, 842346);
insert into HADACCIDENT (accidentid, vehicleid)
values (834315, 575682);
insert into HADACCIDENT (accidentid, vehicleid)
values (477849, 661551);
insert into HADACCIDENT (accidentid, vehicleid)
values (629315, 226257);
insert into HADACCIDENT (accidentid, vehicleid)
values (568274, 313547);
insert into HADACCIDENT (accidentid, vehicleid)
values (682274, 644373);
insert into HADACCIDENT (accidentid, vehicleid)
values (893851, 211843);
insert into HADACCIDENT (accidentid, vehicleid)
values (591155, 545867);
insert into HADACCIDENT (accidentid, vehicleid)
values (763772, 882337);
insert into HADACCIDENT (accidentid, vehicleid)
values (545373, 333447);
insert into HADACCIDENT (accidentid, vehicleid)
values (679212, 828532);
insert into HADACCIDENT (accidentid, vehicleid)
values (834315, 191876);
insert into HADACCIDENT (accidentid, vehicleid)
values (763772, 491965);
insert into HADACCIDENT (accidentid, vehicleid)
values (634678, 974567);
insert into HADACCIDENT (accidentid, vehicleid)
values (679212, 484519);
insert into HADACCIDENT (accidentid, vehicleid)
values (772346, 293938);
insert into HADACCIDENT (accidentid, vehicleid)
values (542465, 614117);
insert into HADACCIDENT (accidentid, vehicleid)
values (699581, 644373);
insert into HADACCIDENT (accidentid, vehicleid)
values (965496, 325119);
insert into HADACCIDENT (accidentid, vehicleid)
values (343588, 299345);
insert into HADACCIDENT (accidentid, vehicleid)
values (919553, 481872);
insert into HADACCIDENT (accidentid, vehicleid)
values (627864, 721753);
insert into HADACCIDENT (accidentid, vehicleid)
values (489935, 373732);
insert into HADACCIDENT (accidentid, vehicleid)
values (821527, 744769);
insert into HADACCIDENT (accidentid, vehicleid)
values (569359, 499329);
insert into HADACCIDENT (accidentid, vehicleid)
values (598615, 823654);
insert into HADACCIDENT (accidentid, vehicleid)
values (664376, 172568);
insert into HADACCIDENT (accidentid, vehicleid)
values (363871, 267665);
insert into HADACCIDENT (accidentid, vehicleid)
values (918794, 193718);
insert into HADACCIDENT (accidentid, vehicleid)
values (376789, 167436);
insert into HADACCIDENT (accidentid, vehicleid)
values (321151, 979593);
insert into HADACCIDENT (accidentid, vehicleid)
values (694734, 169882);
commit;
prompt 300 records committed...
insert into HADACCIDENT (accidentid, vehicleid)
values (489935, 617136);
insert into HADACCIDENT (accidentid, vehicleid)
values (397424, 659778);
insert into HADACCIDENT (accidentid, vehicleid)
values (276246, 925575);
insert into HADACCIDENT (accidentid, vehicleid)
values (142721, 879964);
insert into HADACCIDENT (accidentid, vehicleid)
values (468214, 877452);
insert into HADACCIDENT (accidentid, vehicleid)
values (565371, 396511);
insert into HADACCIDENT (accidentid, vehicleid)
values (766133, 849224);
insert into HADACCIDENT (accidentid, vehicleid)
values (239657, 277395);
insert into HADACCIDENT (accidentid, vehicleid)
values (295961, 522964);
insert into HADACCIDENT (accidentid, vehicleid)
values (468214, 211928);
insert into HADACCIDENT (accidentid, vehicleid)
values (545673, 652238);
insert into HADACCIDENT (accidentid, vehicleid)
values (852179, 845557);
insert into HADACCIDENT (accidentid, vehicleid)
values (754183, 647181);
insert into HADACCIDENT (accidentid, vehicleid)
values (798716, 127443);
insert into HADACCIDENT (accidentid, vehicleid)
values (343588, 848765);
insert into HADACCIDENT (accidentid, vehicleid)
values (777228, 334317);
insert into HADACCIDENT (accidentid, vehicleid)
values (656379, 226995);
insert into HADACCIDENT (accidentid, vehicleid)
values (191129, 783724);
insert into HADACCIDENT (accidentid, vehicleid)
values (196183, 467767);
insert into HADACCIDENT (accidentid, vehicleid)
values (921815, 632823);
insert into HADACCIDENT (accidentid, vehicleid)
values (179332, 668664);
insert into HADACCIDENT (accidentid, vehicleid)
values (659443, 595522);
insert into HADACCIDENT (accidentid, vehicleid)
values (177137, 827524);
insert into HADACCIDENT (accidentid, vehicleid)
values (266435, 387731);
insert into HADACCIDENT (accidentid, vehicleid)
values (426211, 864399);
insert into HADACCIDENT (accidentid, vehicleid)
values (331665, 225327);
insert into HADACCIDENT (accidentid, vehicleid)
values (214989, 721753);
insert into HADACCIDENT (accidentid, vehicleid)
values (237951, 349349);
insert into HADACCIDENT (accidentid, vehicleid)
values (872713, 595522);
insert into HADACCIDENT (accidentid, vehicleid)
values (627864, 565211);
insert into HADACCIDENT (accidentid, vehicleid)
values (149489, 333588);
insert into HADACCIDENT (accidentid, vehicleid)
values (937294, 584726);
insert into HADACCIDENT (accidentid, vehicleid)
values (537482, 349349);
insert into HADACCIDENT (accidentid, vehicleid)
values (779462, 312794);
insert into HADACCIDENT (accidentid, vehicleid)
values (146987, 124553);
insert into HADACCIDENT (accidentid, vehicleid)
values (381943, 824889);
insert into HADACCIDENT (accidentid, vehicleid)
values (335329, 341175);
insert into HADACCIDENT (accidentid, vehicleid)
values (679212, 277395);
insert into HADACCIDENT (accidentid, vehicleid)
values (122232, 372314);
insert into HADACCIDENT (accidentid, vehicleid)
values (795321, 912239);
insert into HADACCIDENT (accidentid, vehicleid)
values (873566, 333588);
insert into HADACCIDENT (accidentid, vehicleid)
values (223836, 926356);
insert into HADACCIDENT (accidentid, vehicleid)
values (699581, 594746);
insert into HADACCIDENT (accidentid, vehicleid)
values (895775, 814835);
insert into HADACCIDENT (accidentid, vehicleid)
values (477938, 882337);
insert into HADACCIDENT (accidentid, vehicleid)
values (198856, 632189);
insert into HADACCIDENT (accidentid, vehicleid)
values (222981, 349886);
insert into HADACCIDENT (accidentid, vehicleid)
values (318481, 846261);
insert into HADACCIDENT (accidentid, vehicleid)
values (221363, 469673);
insert into HADACCIDENT (accidentid, vehicleid)
values (826566, 548665);
insert into HADACCIDENT (accidentid, vehicleid)
values (714482, 766499);
insert into HADACCIDENT (accidentid, vehicleid)
values (956851, 441192);
insert into HADACCIDENT (accidentid, vehicleid)
values (948827, 545163);
insert into HADACCIDENT (accidentid, vehicleid)
values (983258, 441216);
insert into HADACCIDENT (accidentid, vehicleid)
values (545673, 254611);
insert into HADACCIDENT (accidentid, vehicleid)
values (327714, 255696);
insert into HADACCIDENT (accidentid, vehicleid)
values (639898, 741495);
insert into HADACCIDENT (accidentid, vehicleid)
values (958453, 126385);
insert into HADACCIDENT (accidentid, vehicleid)
values (852894, 744769);
insert into HADACCIDENT (accidentid, vehicleid)
values (948827, 397429);
insert into HADACCIDENT (accidentid, vehicleid)
values (223286, 975531);
insert into HADACCIDENT (accidentid, vehicleid)
values (872713, 325135);
insert into HADACCIDENT (accidentid, vehicleid)
values (977922, 971119);
insert into HADACCIDENT (accidentid, vehicleid)
values (787866, 456142);
insert into HADACCIDENT (accidentid, vehicleid)
values (421512, 937781);
insert into HADACCIDENT (accidentid, vehicleid)
values (456821, 284657);
insert into HADACCIDENT (accidentid, vehicleid)
values (662413, 617679);
insert into HADACCIDENT (accidentid, vehicleid)
values (895124, 964955);
insert into HADACCIDENT (accidentid, vehicleid)
values (392436, 623573);
insert into HADACCIDENT (accidentid, vehicleid)
values (767795, 285662);
insert into HADACCIDENT (accidentid, vehicleid)
values (281466, 647428);
insert into HADACCIDENT (accidentid, vehicleid)
values (884173, 798987);
insert into HADACCIDENT (accidentid, vehicleid)
values (534749, 885894);
insert into HADACCIDENT (accidentid, vehicleid)
values (965515, 448399);
insert into HADACCIDENT (accidentid, vehicleid)
values (177137, 583676);
insert into HADACCIDENT (accidentid, vehicleid)
values (927128, 612695);
insert into HADACCIDENT (accidentid, vehicleid)
values (479114, 518618);
insert into HADACCIDENT (accidentid, vehicleid)
values (282574, 566661);
insert into HADACCIDENT (accidentid, vehicleid)
values (882484, 778134);
insert into HADACCIDENT (accidentid, vehicleid)
values (586766, 416275);
insert into HADACCIDENT (accidentid, vehicleid)
values (344916, 457366);
insert into HADACCIDENT (accidentid, vehicleid)
values (485222, 855581);
insert into HADACCIDENT (accidentid, vehicleid)
values (895124, 457259);
insert into HADACCIDENT (accidentid, vehicleid)
values (328497, 379745);
insert into HADACCIDENT (accidentid, vehicleid)
values (918761, 165555);
insert into HADACCIDENT (accidentid, vehicleid)
values (569359, 865581);
insert into HADACCIDENT (accidentid, vehicleid)
values (499898, 379745);
insert into HADACCIDENT (accidentid, vehicleid)
values (912529, 199474);
insert into HADACCIDENT (accidentid, vehicleid)
values (341592, 913961);
insert into HADACCIDENT (accidentid, vehicleid)
values (683572, 491965);
insert into HADACCIDENT (accidentid, vehicleid)
values (797237, 882337);
insert into HADACCIDENT (accidentid, vehicleid)
values (477849, 245169);
insert into HADACCIDENT (accidentid, vehicleid)
values (542465, 578981);
insert into HADACCIDENT (accidentid, vehicleid)
values (281466, 891425);
insert into HADACCIDENT (accidentid, vehicleid)
values (687367, 958314);
insert into HADACCIDENT (accidentid, vehicleid)
values (886767, 823654);
insert into HADACCIDENT (accidentid, vehicleid)
values (351392, 692743);
insert into HADACCIDENT (accidentid, vehicleid)
values (423413, 831673);
insert into HADACCIDENT (accidentid, vehicleid)
values (568627, 251756);
insert into HADACCIDENT (accidentid, vehicleid)
values (824267, 865927);
commit;
prompt 400 records committed...
insert into HADACCIDENT (accidentid, vehicleid)
values (367424, 333691);
insert into HADACCIDENT (accidentid, vehicleid)
values (626357, 536795);
insert into HADACCIDENT (accidentid, vehicleid)
values (794184, 569353);
insert into HADACCIDENT (accidentid, vehicleid)
values (341592, 924698);
insert into HADACCIDENT (accidentid, vehicleid)
values (677361, 481872);
insert into HADACCIDENT (accidentid, vehicleid)
values (777835, 163538);
insert into HADACCIDENT (accidentid, vehicleid)
values (514788, 361431);
insert into HADACCIDENT (accidentid, vehicleid)
values (837886, 912239);
insert into HADACCIDENT (accidentid, vehicleid)
values (896935, 191535);
insert into HADACCIDENT (accidentid, vehicleid)
values (775493, 686732);
insert into HADACCIDENT (accidentid, vehicleid)
values (896935, 481999);
insert into HADACCIDENT (accidentid, vehicleid)
values (527246, 647315);
insert into HADACCIDENT (accidentid, vehicleid)
values (477571, 741495);
insert into HADACCIDENT (accidentid, vehicleid)
values (537482, 939511);
insert into HADACCIDENT (accidentid, vehicleid)
values (927183, 661551);
insert into HADACCIDENT (accidentid, vehicleid)
values (864341, 449125);
insert into HADACCIDENT (accidentid, vehicleid)
values (499898, 148158);
insert into HADACCIDENT (accidentid, vehicleid)
values (175583, 393727);
insert into HADACCIDENT (accidentid, vehicleid)
values (563949, 191876);
insert into HADACCIDENT (accidentid, vehicleid)
values (531772, 724245);
insert into HADACCIDENT (accidentid, vehicleid)
values (679315, 361251);
insert into HADACCIDENT (accidentid, vehicleid)
values (919553, 614117);
insert into HADACCIDENT (accidentid, vehicleid)
values (386499, 396511);
insert into HADACCIDENT (accidentid, vehicleid)
values (856831, 984478);
insert into HADACCIDENT (accidentid, vehicleid)
values (677447, 632189);
insert into HADACCIDENT (accidentid, vehicleid)
values (198756, 396511);
insert into HADACCIDENT (accidentid, vehicleid)
values (677447, 446793);
insert into HADACCIDENT (accidentid, vehicleid)
values (712426, 525239);
insert into HADACCIDENT (accidentid, vehicleid)
values (253292, 644373);
insert into HADACCIDENT (accidentid, vehicleid)
values (921815, 615292);
insert into HADACCIDENT (accidentid, vehicleid)
values (352646, 651392);
insert into HADACCIDENT (accidentid, vehicleid)
values (829926, 953765);
insert into HADACCIDENT (accidentid, vehicleid)
values (884173, 169942);
insert into HADACCIDENT (accidentid, vehicleid)
values (682274, 497197);
insert into HADACCIDENT (accidentid, vehicleid)
values (662413, 193786);
insert into HADACCIDENT (accidentid, vehicleid)
values (273654, 812556);
insert into HADACCIDENT (accidentid, vehicleid)
values (861962, 397394);
insert into HADACCIDENT (accidentid, vehicleid)
values (627864, 879477);
insert into HADACCIDENT (accidentid, vehicleid)
values (664376, 481999);
insert into HADACCIDENT (accidentid, vehicleid)
values (131672, 894515);
insert into HADACCIDENT (accidentid, vehicleid)
values (533511, 313547);
insert into HADACCIDENT (accidentid, vehicleid)
values (381943, 371798);
insert into HADACCIDENT (accidentid, vehicleid)
values (327973, 439982);
insert into HADACCIDENT (accidentid, vehicleid)
values (965515, 835233);
insert into HADACCIDENT (accidentid, vehicleid)
values (918794, 647181);
insert into HADACCIDENT (accidentid, vehicleid)
values (596664, 647562);
insert into HADACCIDENT (accidentid, vehicleid)
values (873566, 756815);
insert into HADACCIDENT (accidentid, vehicleid)
values (596664, 862379);
insert into HADACCIDENT (accidentid, vehicleid)
values (873566, 554412);
insert into HADACCIDENT (accidentid, vehicleid)
values (598615, 225327);
insert into HADACCIDENT (accidentid, vehicleid)
values (949191, 191535);
insert into HADACCIDENT (accidentid, vehicleid)
values (687367, 278349);
insert into HADACCIDENT (accidentid, vehicleid)
values (514788, 686732);
insert into HADACCIDENT (accidentid, vehicleid)
values (175583, 378375);
insert into HADACCIDENT (accidentid, vehicleid)
values (737921, 942499);
insert into HADACCIDENT (accidentid, vehicleid)
values (464975, 299345);
insert into HADACCIDENT (accidentid, vehicleid)
values (378128, 765978);
insert into HADACCIDENT (accidentid, vehicleid)
values (923131, 975531);
insert into HADACCIDENT (accidentid, vehicleid)
values (918761, 444396);
insert into HADACCIDENT (accidentid, vehicleid)
values (986488, 812556);
insert into HADACCIDENT (accidentid, vehicleid)
values (873566, 226257);
insert into HADACCIDENT (accidentid, vehicleid)
values (456821, 491965);
insert into HADACCIDENT (accidentid, vehicleid)
values (687367, 496964);
insert into HADACCIDENT (accidentid, vehicleid)
values (113853, 645912);
insert into HADACCIDENT (accidentid, vehicleid)
values (394431, 341175);
insert into HADACCIDENT (accidentid, vehicleid)
values (384873, 545867);
insert into HADACCIDENT (accidentid, vehicleid)
values (737921, 977485);
insert into HADACCIDENT (accidentid, vehicleid)
values (332162, 756815);
insert into HADACCIDENT (accidentid, vehicleid)
values (754183, 532864);
insert into HADACCIDENT (accidentid, vehicleid)
values (975672, 799539);
insert into HADACCIDENT (accidentid, vehicleid)
values (937294, 119637);
insert into HADACCIDENT (accidentid, vehicleid)
values (311686, 929512);
insert into HADACCIDENT (accidentid, vehicleid)
values (738972, 618555);
insert into HADACCIDENT (accidentid, vehicleid)
values (627774, 913961);
insert into HADACCIDENT (accidentid, vehicleid)
values (376945, 814835);
insert into HADACCIDENT (accidentid, vehicleid)
values (679212, 399221);
insert into HADACCIDENT (accidentid, vehicleid)
values (464975, 666262);
insert into HADACCIDENT (accidentid, vehicleid)
values (538928, 961549);
insert into HADACCIDENT (accidentid, vehicleid)
values (965515, 299887);
insert into HADACCIDENT (accidentid, vehicleid)
values (493597, 211843);
insert into HADACCIDENT (accidentid, vehicleid)
values (629315, 799539);
insert into HADACCIDENT (accidentid, vehicleid)
values (341441, 868472);
insert into HADACCIDENT (accidentid, vehicleid)
values (719836, 219453);
insert into HADACCIDENT (accidentid, vehicleid)
values (522916, 986351);
insert into HADACCIDENT (accidentid, vehicleid)
values (273654, 269578);
insert into HADACCIDENT (accidentid, vehicleid)
values (628748, 744782);
insert into HADACCIDENT (accidentid, vehicleid)
values (775655, 831673);
insert into HADACCIDENT (accidentid, vehicleid)
values (852894, 333447);
insert into HADACCIDENT (accidentid, vehicleid)
values (762448, 855581);
insert into HADACCIDENT (accidentid, vehicleid)
values (343588, 545867);
insert into HADACCIDENT (accidentid, vehicleid)
values (374381, 397895);
insert into HADACCIDENT (accidentid, vehicleid)
values (988264, 299532);
insert into HADACCIDENT (accidentid, vehicleid)
values (962169, 877452);
insert into HADACCIDENT (accidentid, vehicleid)
values (311686, 632189);
insert into HADACCIDENT (accidentid, vehicleid)
values (261858, 375151);
insert into HADACCIDENT (accidentid, vehicleid)
values (333126, 458644);
insert into HADACCIDENT (accidentid, vehicleid)
values (549813, 312794);
insert into HADACCIDENT (accidentid, vehicleid)
values (565371, 448399);
insert into HADACCIDENT (accidentid, vehicleid)
values (534532, 269282);
commit;
prompt 499 records loaded
prompt Loading TRIP...
insert into TRIP (tripid, tripdate, destination)
values (864464, to_date('23-05-1974', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (889776, to_date('22-04-1970', 'dd-mm-yyyy'), 'Kiryat Yam');
insert into TRIP (tripid, tripdate, destination)
values (957651, to_date('26-05-2019', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (258412, to_date('07-07-1985', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (663729, to_date('23-11-1979', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (637627, to_date('28-01-2020', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (524215, to_date('13-05-1984', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (548352, to_date('09-10-1990', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (683962, to_date('14-02-2005', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (618482, to_date('23-04-1982', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (438697, to_date('02-05-1997', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (536313, to_date('10-11-1985', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (379728, to_date('17-11-2017', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (278727, to_date('23-11-2017', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (444672, to_date('19-03-2018', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (586415, to_date('25-09-2021', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (157132, to_date('19-07-2017', 'dd-mm-yyyy'), 'Afula');
insert into TRIP (tripid, tripdate, destination)
values (893392, to_date('12-05-1986', 'dd-mm-yyyy'), 'Bnei Brak');
insert into TRIP (tripid, tripdate, destination)
values (636315, to_date('15-05-2004', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (448138, to_date('22-12-2010', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (346433, to_date('18-12-2000', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (961751, to_date('03-03-1989', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (552683, to_date('10-04-2019', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (498149, to_date('12-06-1999', 'dd-mm-yyyy'), 'Rishon LeZion');
insert into TRIP (tripid, tripdate, destination)
values (986681, to_date('30-09-2016', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (662718, to_date('30-05-1989', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (839589, to_date('14-03-2015', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (283946, to_date('18-04-2003', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (122564, to_date('25-04-2002', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (829111, to_date('19-10-1974', 'dd-mm-yyyy'), 'Kiryat Motzkin');
insert into TRIP (tripid, tripdate, destination)
values (652196, to_date('11-03-1996', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (441684, to_date('16-12-2008', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (346731, to_date('09-03-2001', 'dd-mm-yyyy'), 'Carmiel');
insert into TRIP (tripid, tripdate, destination)
values (358378, to_date('29-12-2011', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (361336, to_date('03-02-2018', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (441627, to_date('01-03-1973', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (496265, to_date('06-01-2000', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (726383, to_date('12-12-1974', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (773289, to_date('14-03-1971', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (658889, to_date('30-11-1985', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (521664, to_date('26-11-1982', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (458686, to_date('24-07-1979', 'dd-mm-yyyy'), 'Beit Shemesh');
insert into TRIP (tripid, tripdate, destination)
values (975886, to_date('30-11-2014', 'dd-mm-yyyy'), 'Kiryat Shmona');
insert into TRIP (tripid, tripdate, destination)
values (166864, to_date('03-11-1998', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (272721, to_date('26-09-1985', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (631247, to_date('10-05-2003', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (387365, to_date('10-02-1980', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (663612, to_date('12-03-1988', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (332631, to_date('12-07-1987', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (641724, to_date('21-02-1994', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (549633, to_date('04-02-2021', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (175612, to_date('06-03-2009', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (994812, to_date('24-01-2019', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (177224, to_date('07-09-1978', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (786145, to_date('27-12-2017', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (147155, to_date('12-08-1978', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (538578, to_date('08-12-1999', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (945913, to_date('10-05-2008', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (453631, to_date('04-05-2011', 'dd-mm-yyyy'), 'Carmiel');
insert into TRIP (tripid, tripdate, destination)
values (887319, to_date('08-12-2000', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (992356, to_date('04-03-2010', 'dd-mm-yyyy'), 'Tiberias');
insert into TRIP (tripid, tripdate, destination)
values (874326, to_date('04-03-1996', 'dd-mm-yyyy'), 'Kiryat Motzkin');
insert into TRIP (tripid, tripdate, destination)
values (157578, to_date('27-10-1984', 'dd-mm-yyyy'), 'Carmiel');
insert into TRIP (tripid, tripdate, destination)
values (864621, to_date('19-11-1987', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (375388, to_date('05-08-2018', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (914718, to_date('30-05-1988', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (858736, to_date('27-11-1973', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (162556, to_date('19-06-1984', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (163229, to_date('23-06-1991', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (699441, to_date('25-08-2001', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (268652, to_date('04-07-2011', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (463169, to_date('25-12-2005', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (979187, to_date('17-03-2001', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (914896, to_date('30-09-2022', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (779341, to_date('29-04-2019', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (664945, to_date('10-09-1983', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (312855, to_date('22-12-2008', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (735335, to_date('09-11-2008', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (548977, to_date('09-11-1970', 'dd-mm-yyyy'), 'Rishon LeZion');
insert into TRIP (tripid, tripdate, destination)
values (262455, to_date('17-02-1982', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (328581, to_date('31-05-1973', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (742357, to_date('28-01-1996', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (894856, to_date('15-01-2000', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (428812, to_date('18-10-1981', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (853863, to_date('06-08-2013', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (566952, to_date('16-10-1990', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (594169, to_date('08-12-2020', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (755675, to_date('20-10-1987', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (185167, to_date('31-05-1974', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (528234, to_date('02-01-2024', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (521137, to_date('27-05-1999', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (925394, to_date('18-07-1975', 'dd-mm-yyyy'), 'Kiryat Motzkin');
insert into TRIP (tripid, tripdate, destination)
values (364273, to_date('04-03-2024', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (747173, to_date('09-05-1988', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (247973, to_date('27-05-2007', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (285268, to_date('18-05-1999', 'dd-mm-yyyy'), 'Kiryat Shmona');
insert into TRIP (tripid, tripdate, destination)
values (414981, to_date('02-09-2002', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (488251, to_date('29-05-2018', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (262113, to_date('08-09-2005', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (855113, to_date('12-04-1975', 'dd-mm-yyyy'), 'Beit Shemesh');
commit;
prompt 100 records committed...
insert into TRIP (tripid, tripdate, destination)
values (415728, to_date('17-10-2018', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (231944, to_date('15-09-2001', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (419688, to_date('23-10-2006', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (612945, to_date('01-11-2006', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (898385, to_date('24-11-2015', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (934195, to_date('26-05-2013', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (472133, to_date('02-10-2020', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (861731, to_date('06-12-2004', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (299985, to_date('14-02-1989', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (295765, to_date('06-04-1990', 'dd-mm-yyyy'), 'Tiberias');
insert into TRIP (tripid, tripdate, destination)
values (741695, to_date('24-08-2000', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (754782, to_date('23-09-2013', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (771676, to_date('24-05-1985', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (136786, to_date('08-05-2002', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (349748, to_date('17-09-2005', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (299692, to_date('08-05-1993', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (862461, to_date('01-10-1994', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (967317, to_date('06-05-1981', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (554538, to_date('23-12-1983', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (274794, to_date('12-11-1982', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (371524, to_date('11-09-2004', 'dd-mm-yyyy'), 'Kiryat Shmona');
insert into TRIP (tripid, tripdate, destination)
values (725426, to_date('17-03-1992', 'dd-mm-yyyy'), 'Jerusalem');
insert into TRIP (tripid, tripdate, destination)
values (952646, to_date('31-07-1989', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (239876, to_date('19-08-1991', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (969976, to_date('06-03-2000', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (363263, to_date('11-11-2015', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (654354, to_date('12-10-2019', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (866489, to_date('18-04-1999', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (463991, to_date('07-12-2017', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (342651, to_date('05-07-2003', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (833953, to_date('18-12-2014', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (462143, to_date('13-02-2010', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (274665, to_date('30-06-1983', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (141157, to_date('22-04-1985', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (351142, to_date('17-08-2021', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (949392, to_date('29-08-1998', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (543332, to_date('29-10-1982', 'dd-mm-yyyy'), 'Jerusalem');
insert into TRIP (tripid, tripdate, destination)
values (254267, to_date('13-01-2016', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (736118, to_date('23-01-1975', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (639184, to_date('31-05-2018', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (797994, to_date('12-09-1990', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (593692, to_date('02-02-2012', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (645382, to_date('01-01-1971', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (252695, to_date('06-07-1984', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (439852, to_date('29-04-1979', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (277164, to_date('25-02-2023', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (538375, to_date('21-12-1993', 'dd-mm-yyyy'), 'Afula');
insert into TRIP (tripid, tripdate, destination)
values (269867, to_date('11-09-1999', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (674388, to_date('16-09-1972', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (934165, to_date('13-11-2014', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (498527, to_date('17-08-1971', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (156374, to_date('29-12-1973', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (756512, to_date('23-04-1992', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (515554, to_date('27-06-1977', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (411449, to_date('21-01-1992', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (271818, to_date('20-01-2005', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (553632, to_date('13-09-2002', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (271741, to_date('21-03-1980', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (329696, to_date('27-10-1977', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (638961, to_date('27-10-1997', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (894184, to_date('30-03-2020', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (398993, to_date('24-03-2008', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (823628, to_date('02-12-2011', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (334629, to_date('06-07-1990', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (113196, to_date('03-06-2004', 'dd-mm-yyyy'), 'Carmiel');
insert into TRIP (tripid, tripdate, destination)
values (982446, to_date('19-12-2016', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (464997, to_date('26-10-2011', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (115294, to_date('22-08-1991', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (952812, to_date('02-11-2020', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (233266, to_date('03-07-1986', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (482161, to_date('02-02-2001', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (582882, to_date('30-12-1979', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (457856, to_date('18-11-2023', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (559718, to_date('10-11-1975', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (173711, to_date('07-10-2000', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (126948, to_date('30-04-2013', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (827392, to_date('21-09-2019', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (897356, to_date('04-05-2014', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (394421, to_date('02-01-1975', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (872652, to_date('06-01-2011', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (722683, to_date('29-12-2011', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (487189, to_date('17-11-1992', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (852781, to_date('25-01-1994', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (134483, to_date('16-05-1971', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (362115, to_date('10-10-2001', 'dd-mm-yyyy'), 'Kiryat Shmona');
insert into TRIP (tripid, tripdate, destination)
values (412392, to_date('10-01-1990', 'dd-mm-yyyy'), 'Afula');
insert into TRIP (tripid, tripdate, destination)
values (547393, to_date('07-01-2017', 'dd-mm-yyyy'), 'Kiryat Yam');
insert into TRIP (tripid, tripdate, destination)
values (672466, to_date('03-09-1971', 'dd-mm-yyyy'), 'Rishon LeZion');
insert into TRIP (tripid, tripdate, destination)
values (663224, to_date('07-08-1987', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (124673, to_date('11-04-2000', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (694754, to_date('14-05-2000', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (234164, to_date('22-02-2005', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (451333, to_date('14-10-2019', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (228941, to_date('05-06-1988', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (555885, to_date('29-09-2006', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (493516, to_date('23-12-1980', 'dd-mm-yyyy'), 'Jerusalem');
insert into TRIP (tripid, tripdate, destination)
values (753714, to_date('10-02-1983', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (516184, to_date('19-03-1998', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (468119, to_date('26-07-1987', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (733514, to_date('18-12-1995', 'dd-mm-yyyy'), 'Kfar Saba');
commit;
prompt 200 records committed...
insert into TRIP (tripid, tripdate, destination)
values (758969, to_date('18-02-1977', 'dd-mm-yyyy'), 'Kiryat Motzkin');
insert into TRIP (tripid, tripdate, destination)
values (694958, to_date('30-04-1989', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (273356, to_date('14-05-2000', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (278996, to_date('11-07-2008', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (112528, to_date('16-03-1990', 'dd-mm-yyyy'), 'Bnei Brak');
insert into TRIP (tripid, tripdate, destination)
values (937351, to_date('03-06-2000', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (587957, to_date('23-06-1991', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (181788, to_date('16-09-2001', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (715762, to_date('12-02-2008', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (646245, to_date('05-02-1986', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (286159, to_date('01-05-2013', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (146748, to_date('03-03-1983', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (956245, to_date('16-02-2014', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (891446, to_date('27-11-1979', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (573393, to_date('02-03-2007', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (949882, to_date('10-03-1985', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (452278, to_date('11-12-1988', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (275934, to_date('07-09-1985', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (975261, to_date('28-04-2020', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (293213, to_date('02-05-2010', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (944516, to_date('22-05-2019', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (653742, to_date('25-07-1977', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (431711, to_date('12-12-1988', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (315445, to_date('15-02-1977', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (863474, to_date('30-05-1972', 'dd-mm-yyyy'), 'Beit Shemesh');
insert into TRIP (tripid, tripdate, destination)
values (644868, to_date('15-08-2008', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (871526, to_date('15-08-2009', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (421889, to_date('13-09-1991', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (755653, to_date('27-01-1984', 'dd-mm-yyyy'), 'Bnei Brak');
insert into TRIP (tripid, tripdate, destination)
values (545954, to_date('24-07-1993', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (999562, to_date('23-05-2013', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (574198, to_date('26-10-2021', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (515689, to_date('24-07-1970', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (419426, to_date('13-05-1980', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (549457, to_date('31-01-1983', 'dd-mm-yyyy'), 'Tiberias');
insert into TRIP (tripid, tripdate, destination)
values (453572, to_date('13-07-2005', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (492953, to_date('06-07-2008', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (467923, to_date('22-04-1987', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (739166, to_date('23-08-2007', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (816797, to_date('01-03-2014', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (836244, to_date('07-01-2009', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (467898, to_date('11-12-2002', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (147325, to_date('23-06-2010', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (446294, to_date('04-09-1980', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (119922, to_date('19-04-1989', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (914817, to_date('15-02-1986', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (215937, to_date('05-02-2021', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (354667, to_date('20-04-1971', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (967887, to_date('04-05-2018', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (659315, to_date('24-08-1974', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (564136, to_date('28-02-2012', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (667324, to_date('24-07-2022', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (336553, to_date('06-08-1999', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (612992, to_date('04-08-1976', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (361332, to_date('30-01-2008', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (613288, to_date('11-04-1978', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (874629, to_date('22-12-1996', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (398332, to_date('03-05-1970', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (352787, to_date('30-05-1976', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (839423, to_date('15-07-1978', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (952718, to_date('30-06-2017', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (541113, to_date('14-03-2013', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (826139, to_date('26-10-1990', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (189932, to_date('25-09-1970', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (962746, to_date('22-04-2011', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (189626, to_date('17-02-2024', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (335428, to_date('01-10-2013', 'dd-mm-yyyy'), 'Nazareth');
insert into TRIP (tripid, tripdate, destination)
values (856314, to_date('13-03-1981', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (979154, to_date('01-05-1980', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (682878, to_date('10-01-2001', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (532731, to_date('13-02-2005', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (324161, to_date('22-07-2006', 'dd-mm-yyyy'), 'Tiberias');
insert into TRIP (tripid, tripdate, destination)
values (931585, to_date('17-04-1978', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (612267, to_date('25-09-2020', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (411923, to_date('15-08-1976', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (692992, to_date('20-09-2013', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (534887, to_date('09-01-2002', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (549559, to_date('23-09-2021', 'dd-mm-yyyy'), 'Bnei Brak');
insert into TRIP (tripid, tripdate, destination)
values (599969, to_date('24-09-1991', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (888663, to_date('23-03-1994', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (649814, to_date('25-06-1991', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (275328, to_date('06-06-2021', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (758855, to_date('17-09-2002', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (637764, to_date('17-07-2018', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (373239, to_date('27-09-1992', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (741438, to_date('21-07-2007', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (937672, to_date('15-08-2013', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (778168, to_date('13-10-2018', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (245615, to_date('31-12-1994', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (852413, to_date('02-06-1992', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (799243, to_date('19-08-1971', 'dd-mm-yyyy'), 'Kiryat Yam');
insert into TRIP (tripid, tripdate, destination)
values (562371, to_date('02-01-2006', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (986134, to_date('26-11-1984', 'dd-mm-yyyy'), 'Tiberias');
insert into TRIP (tripid, tripdate, destination)
values (355224, to_date('25-12-2012', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (862866, to_date('12-05-1984', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (382296, to_date('18-11-2015', 'dd-mm-yyyy'), 'Kiryat Motzkin');
insert into TRIP (tripid, tripdate, destination)
values (943274, to_date('21-11-2000', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (398319, to_date('24-02-2022', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (291446, to_date('24-11-1993', 'dd-mm-yyyy'), 'Bnei Brak');
insert into TRIP (tripid, tripdate, destination)
values (139356, to_date('16-01-2000', 'dd-mm-yyyy'), 'Holon');
commit;
prompt 300 records committed...
insert into TRIP (tripid, tripdate, destination)
values (576756, to_date('08-03-1970', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (353762, to_date('10-06-1997', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (455116, to_date('07-02-1994', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (876633, to_date('25-01-1989', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (551767, to_date('14-06-1980', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (212148, to_date('30-04-1995', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (936897, to_date('17-04-1976', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (467815, to_date('31-10-1983', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (271915, to_date('28-02-2008', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (151235, to_date('29-03-1988', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (289943, to_date('29-07-1983', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (316874, to_date('24-10-2009', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (922324, to_date('21-11-1972', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (714719, to_date('26-03-1973', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (478491, to_date('02-03-2002', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (853395, to_date('18-06-2008', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (624511, to_date('03-01-2009', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (583886, to_date('20-12-1971', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (281434, to_date('03-10-2015', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (456338, to_date('05-03-2000', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (398525, to_date('02-09-1976', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (136168, to_date('26-05-1976', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (777176, to_date('19-06-2005', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (188327, to_date('19-08-1975', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (528495, to_date('23-02-2005', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (419461, to_date('07-02-2003', 'dd-mm-yyyy'), 'Beit Shemesh');
insert into TRIP (tripid, tripdate, destination)
values (478637, to_date('19-03-2004', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (643448, to_date('17-06-2004', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (918987, to_date('02-11-2003', 'dd-mm-yyyy'), 'Arad');
insert into TRIP (tripid, tripdate, destination)
values (775684, to_date('11-08-1984', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (877262, to_date('17-01-1988', 'dd-mm-yyyy'), 'Rishon LeZion');
insert into TRIP (tripid, tripdate, destination)
values (826474, to_date('02-12-2017', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (755155, to_date('01-04-1988', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (913788, to_date('25-09-1986', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (132966, to_date('08-10-1984', 'dd-mm-yyyy'), 'Kiryat Shmona');
insert into TRIP (tripid, tripdate, destination)
values (426487, to_date('21-11-1971', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (449856, to_date('09-05-1971', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (719474, to_date('29-03-1991', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (547221, to_date('03-09-2019', 'dd-mm-yyyy'), 'Ashdod');
insert into TRIP (tripid, tripdate, destination)
values (474981, to_date('07-11-2009', 'dd-mm-yyyy'), 'Kiryat Yam');
insert into TRIP (tripid, tripdate, destination)
values (772169, to_date('22-11-2017', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (587829, to_date('06-07-2004', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (825152, to_date('25-10-2006', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (338353, to_date('05-12-1973', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (844862, to_date('03-10-1972', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (868752, to_date('26-03-2003', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (286858, to_date('17-09-2020', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (948114, to_date('08-07-2002', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (923358, to_date('03-04-2004', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (888357, to_date('07-09-1988', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (664843, to_date('04-05-1970', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (486554, to_date('21-12-1986', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (195224, to_date('06-07-2006', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (595272, to_date('16-10-1986', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (135352, to_date('11-06-1979', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (232437, to_date('07-04-2006', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (271775, to_date('03-10-1979', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (757698, to_date('29-09-1993', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (316427, to_date('26-03-2006', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (984841, to_date('27-12-2000', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (781931, to_date('01-01-1976', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (255392, to_date('13-01-1976', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (819772, to_date('16-05-2006', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (967651, to_date('10-09-1990', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (458895, to_date('22-05-1990', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (583682, to_date('05-02-1979', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (494375, to_date('25-04-1987', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (474289, to_date('15-07-2019', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (338516, to_date('06-07-2015', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (856341, to_date('28-08-2018', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (715689, to_date('15-04-2008', 'dd-mm-yyyy'), 'Beit Shemesh');
insert into TRIP (tripid, tripdate, destination)
values (482111, to_date('23-04-1993', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (868216, to_date('30-01-1987', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (483597, to_date('26-01-1972', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (339152, to_date('25-04-2017', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (527665, to_date('01-06-2005', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (769741, to_date('05-04-2001', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (319331, to_date('13-12-2012', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (734962, to_date('17-03-2014', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (774855, to_date('19-11-2010', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (192549, to_date('01-09-1988', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (381798, to_date('26-07-2013', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (928694, to_date('22-03-1996', 'dd-mm-yyyy'), 'Rishon LeZion');
insert into TRIP (tripid, tripdate, destination)
values (329828, to_date('10-05-1989', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (278686, to_date('15-01-1986', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (968797, to_date('14-06-1979', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (386635, to_date('28-05-2012', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (644564, to_date('06-06-1999', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (896148, to_date('28-03-1973', 'dd-mm-yyyy'), 'Kiryat Gat');
insert into TRIP (tripid, tripdate, destination)
values (848793, to_date('03-02-1995', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (399278, to_date('05-08-2000', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (868379, to_date('27-08-2015', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (932277, to_date('24-11-1981', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (397537, to_date('07-08-2006', 'dd-mm-yyyy'), 'Afula');
insert into TRIP (tripid, tripdate, destination)
values (146839, to_date('28-09-2004', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (915951, to_date('15-11-1982', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (195168, to_date('15-10-1986', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (546556, to_date('17-09-1984', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (824118, to_date('02-12-2011', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (813993, to_date('16-03-1979', 'dd-mm-yyyy'), 'Ashdod');
commit;
prompt 400 records committed...
insert into TRIP (tripid, tripdate, destination)
values (778921, to_date('15-06-2014', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (394521, to_date('09-02-1979', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (262338, to_date('27-08-2006', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (935241, to_date('22-09-1998', 'dd-mm-yyyy'), 'Haifa');
insert into TRIP (tripid, tripdate, destination)
values (214238, to_date('29-03-1980', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (598113, to_date('03-10-2009', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (174127, to_date('05-12-1970', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (725196, to_date('21-10-2005', 'dd-mm-yyyy'), 'Ramat HaSharon');
insert into TRIP (tripid, tripdate, destination)
values (539896, to_date('06-04-2014', 'dd-mm-yyyy'), 'Kiryat Yam');
insert into TRIP (tripid, tripdate, destination)
values (781191, to_date('31-07-2012', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (743716, to_date('01-11-1992', 'dd-mm-yyyy'), 'Jerusalem');
insert into TRIP (tripid, tripdate, destination)
values (772691, to_date('04-06-1989', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (511247, to_date('08-06-1972', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (532973, to_date('19-06-2002', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (786951, to_date('06-12-1994', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (881176, to_date('07-07-2017', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (279675, to_date('13-10-1979', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (118619, to_date('24-11-2018', 'dd-mm-yyyy'), 'Rishon LeZion');
insert into TRIP (tripid, tripdate, destination)
values (211189, to_date('20-11-2005', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (155693, to_date('23-08-2019', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (955359, to_date('15-10-1995', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (515635, to_date('01-05-2017', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (178887, to_date('01-07-1997', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (126687, to_date('23-04-2004', 'dd-mm-yyyy'), 'Karmiel');
insert into TRIP (tripid, tripdate, destination)
values (494583, to_date('21-05-1977', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (744936, to_date('03-11-1977', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (221711, to_date('04-05-1993', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (691248, to_date('24-08-2004', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (559632, to_date('20-08-1987', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (622147, to_date('08-10-2013', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (322339, to_date('11-06-2014', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (253793, to_date('26-01-2024', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (622146, to_date('16-05-1978', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (775161, to_date('09-06-1991', 'dd-mm-yyyy'), 'Givatayim');
insert into TRIP (tripid, tripdate, destination)
values (649141, to_date('19-08-1970', 'dd-mm-yyyy'), 'Netanya');
insert into TRIP (tripid, tripdate, destination)
values (754364, to_date('14-12-1981', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (441179, to_date('24-07-2007', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (455459, to_date('05-02-2019', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (991821, to_date('02-07-1986', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (663598, to_date('11-04-1985', 'dd-mm-yyyy'), 'Bat Yam');
insert into TRIP (tripid, tripdate, destination)
values (776913, to_date('13-12-2021', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (832234, to_date('22-04-2012', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (966164, to_date('10-02-2021', 'dd-mm-yyyy'), 'Lod');
insert into TRIP (tripid, tripdate, destination)
values (794327, to_date('26-08-2002', 'dd-mm-yyyy'), 'Kiryat Bialik');
insert into TRIP (tripid, tripdate, destination)
values (184216, to_date('27-01-2020', 'dd-mm-yyyy'), 'Ashkelon');
insert into TRIP (tripid, tripdate, destination)
values (362956, to_date('24-11-2019', 'dd-mm-yyyy'), 'Nahariya');
insert into TRIP (tripid, tripdate, destination)
values (818587, to_date('25-08-1976', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (649314, to_date('23-12-1972', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (949266, to_date('01-12-1997', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (558873, to_date('28-08-2006', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (433691, to_date('26-01-1970', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (139798, to_date('05-10-2022', 'dd-mm-yyyy'), 'Beersheba');
insert into TRIP (tripid, tripdate, destination)
values (451374, to_date('04-04-2003', 'dd-mm-yyyy'), 'Dimona');
insert into TRIP (tripid, tripdate, destination)
values (391463, to_date('29-04-2016', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (315327, to_date('15-02-2007', 'dd-mm-yyyy'), 'Holon');
insert into TRIP (tripid, tripdate, destination)
values (392971, to_date('22-02-1977', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (618932, to_date('26-08-1972', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (328782, to_date('07-08-2008', 'dd-mm-yyyy'), 'Ra''anana');
insert into TRIP (tripid, tripdate, destination)
values (785178, to_date('09-05-1982', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (687399, to_date('16-11-2011', 'dd-mm-yyyy'), 'Hadera');
insert into TRIP (tripid, tripdate, destination)
values (454657, to_date('11-02-2003', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (754527, to_date('15-02-2022', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (352724, to_date('26-01-2005', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (168453, to_date('02-05-2001', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (492644, to_date('12-10-1971', 'dd-mm-yyyy'), 'Tel Aviv');
insert into TRIP (tripid, tripdate, destination)
values (831943, to_date('03-07-2011', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (888971, to_date('24-01-2019', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (612346, to_date('06-07-2007', 'dd-mm-yyyy'), 'Afula');
insert into TRIP (tripid, tripdate, destination)
values (218736, to_date('26-07-1970', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (726573, to_date('15-04-2010', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (631418, to_date('22-11-2019', 'dd-mm-yyyy'), 'Jerusalem');
insert into TRIP (tripid, tripdate, destination)
values (812757, to_date('08-05-2008', 'dd-mm-yyyy'), 'Ma''ale Adumim');
insert into TRIP (tripid, tripdate, destination)
values (241244, to_date('06-03-1980', 'dd-mm-yyyy'), 'Herzliya');
insert into TRIP (tripid, tripdate, destination)
values (386688, to_date('26-04-2022', 'dd-mm-yyyy'), 'Umm al-Fahm');
insert into TRIP (tripid, tripdate, destination)
values (954982, to_date('27-07-2000', 'dd-mm-yyyy'), 'Petah Tikva');
insert into TRIP (tripid, tripdate, destination)
values (372888, to_date('05-06-2006', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (481531, to_date('11-10-1978', 'dd-mm-yyyy'), 'Kiryat Ata');
insert into TRIP (tripid, tripdate, destination)
values (234821, to_date('21-09-2021', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (948358, to_date('25-11-2005', 'dd-mm-yyyy'), 'Acre (Akko)');
insert into TRIP (tripid, tripdate, destination)
values (438483, to_date('03-08-1974', 'dd-mm-yyyy'), 'Kiryat Motzkin');
insert into TRIP (tripid, tripdate, destination)
values (121324, to_date('22-04-1996', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (958361, to_date('31-03-2007', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (613311, to_date('21-10-2023', 'dd-mm-yyyy'), 'Ramla');
insert into TRIP (tripid, tripdate, destination)
values (498634, to_date('21-12-2018', 'dd-mm-yyyy'), 'Eilat');
insert into TRIP (tripid, tripdate, destination)
values (764194, to_date('02-11-2005', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (966877, to_date('04-04-2002', 'dd-mm-yyyy'), 'Modi''in-Maccabim-Re''ut');
insert into TRIP (tripid, tripdate, destination)
values (533534, to_date('30-04-1985', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (234282, to_date('04-09-1998', 'dd-mm-yyyy'), 'Safed (Tzfat)');
insert into TRIP (tripid, tripdate, destination)
values (426397, to_date('19-11-1977', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (492759, to_date('28-05-2000', 'dd-mm-yyyy'), 'Ramat Gan');
insert into TRIP (tripid, tripdate, destination)
values (471996, to_date('18-12-1981', 'dd-mm-yyyy'), 'Sakhnin');
insert into TRIP (tripid, tripdate, destination)
values (695366, to_date('28-09-2014', 'dd-mm-yyyy'), 'Rehovot');
insert into TRIP (tripid, tripdate, destination)
values (348712, to_date('31-01-1989', 'dd-mm-yyyy'), 'Rosh HaAyin');
insert into TRIP (tripid, tripdate, destination)
values (384763, to_date('19-12-2019', 'dd-mm-yyyy'), 'Kiryat Malakhi');
insert into TRIP (tripid, tripdate, destination)
values (564534, to_date('28-12-1993', 'dd-mm-yyyy'), 'Or Yehuda');
insert into TRIP (tripid, tripdate, destination)
values (469847, to_date('06-07-1975', 'dd-mm-yyyy'), 'Yehud-Monosson');
insert into TRIP (tripid, tripdate, destination)
values (968791, to_date('11-11-2004', 'dd-mm-yyyy'), 'Kfar Saba');
insert into TRIP (tripid, tripdate, destination)
values (414944, to_date('01-03-1995', 'dd-mm-yyyy'), 'Sderot');
insert into TRIP (tripid, tripdate, destination)
values (463723, to_date('24-02-1999', 'dd-mm-yyyy'), 'Beit She''an');
insert into TRIP (tripid, tripdate, destination)
values (228132, to_date('03-12-1976', 'dd-mm-yyyy'), 'Lod');
commit;
prompt 500 records loaded
prompt Loading HADTRIP...
insert into HADTRIP (vehicleid, tripid)
values (397895, 166864);
insert into HADTRIP (vehicleid, tripid)
values (644968, 999562);
insert into HADTRIP (vehicleid, tripid)
values (536795, 934165);
insert into HADTRIP (vehicleid, tripid)
values (485274, 968797);
insert into HADTRIP (vehicleid, tripid)
values (891425, 564136);
insert into HADTRIP (vehicleid, tripid)
values (325135, 299985);
insert into HADTRIP (vehicleid, tripid)
values (917321, 353762);
insert into HADTRIP (vehicleid, tripid)
values (628794, 283946);
insert into HADTRIP (vehicleid, tripid)
values (313547, 538375);
insert into HADTRIP (vehicleid, tripid)
values (299749, 478491);
insert into HADTRIP (vehicleid, tripid)
values (895249, 146748);
insert into HADTRIP (vehicleid, tripid)
values (683451, 342651);
insert into HADTRIP (vehicleid, tripid)
values (393727, 769741);
insert into HADTRIP (vehicleid, tripid)
values (235824, 173711);
insert into HADTRIP (vehicleid, tripid)
values (287244, 778921);
insert into HADTRIP (vehicleid, tripid)
values (566661, 346433);
insert into HADTRIP (vehicleid, tripid)
values (299749, 932277);
insert into HADTRIP (vehicleid, tripid)
values (319454, 839589);
insert into HADTRIP (vehicleid, tripid)
values (745367, 794327);
insert into HADTRIP (vehicleid, tripid)
values (293134, 692992);
insert into HADTRIP (vehicleid, tripid)
values (511542, 156374);
insert into HADTRIP (vehicleid, tripid)
values (393727, 664945);
insert into HADTRIP (vehicleid, tripid)
values (221689, 649141);
insert into HADTRIP (vehicleid, tripid)
values (439258, 975261);
insert into HADTRIP (vehicleid, tripid)
values (297197, 594169);
insert into HADTRIP (vehicleid, tripid)
values (583676, 937672);
insert into HADTRIP (vehicleid, tripid)
values (689253, 421889);
insert into HADTRIP (vehicleid, tripid)
values (953765, 949266);
insert into HADTRIP (vehicleid, tripid)
values (396365, 583682);
insert into HADTRIP (vehicleid, tripid)
values (124553, 291446);
insert into HADTRIP (vehicleid, tripid)
values (554412, 315327);
insert into HADTRIP (vehicleid, tripid)
values (299186, 214238);
insert into HADTRIP (vehicleid, tripid)
values (319454, 559632);
insert into HADTRIP (vehicleid, tripid)
values (172568, 644564);
insert into HADTRIP (vehicleid, tripid)
values (277395, 132966);
insert into HADTRIP (vehicleid, tripid)
values (812556, 315327);
insert into HADTRIP (vehicleid, tripid)
values (681235, 271915);
insert into HADTRIP (vehicleid, tripid)
values (578981, 991821);
insert into HADTRIP (vehicleid, tripid)
values (413974, 613288);
insert into HADTRIP (vehicleid, tripid)
values (632974, 498149);
insert into HADTRIP (vehicleid, tripid)
values (976191, 999562);
insert into HADTRIP (vehicleid, tripid)
values (814567, 612346);
insert into HADTRIP (vehicleid, tripid)
values (182968, 797994);
insert into HADTRIP (vehicleid, tripid)
values (559514, 914817);
insert into HADTRIP (vehicleid, tripid)
values (783324, 469847);
insert into HADTRIP (vehicleid, tripid)
values (449621, 115294);
insert into HADTRIP (vehicleid, tripid)
values (378375, 262113);
insert into HADTRIP (vehicleid, tripid)
values (821516, 515554);
insert into HADTRIP (vehicleid, tripid)
values (536795, 593692);
insert into HADTRIP (vehicleid, tripid)
values (962611, 948358);
insert into HADTRIP (vehicleid, tripid)
values (459429, 948114);
insert into HADTRIP (vehicleid, tripid)
values (396365, 146839);
insert into HADTRIP (vehicleid, tripid)
values (127756, 968797);
insert into HADTRIP (vehicleid, tripid)
values (518618, 587957);
insert into HADTRIP (vehicleid, tripid)
values (595522, 622147);
insert into HADTRIP (vehicleid, tripid)
values (854683, 234821);
insert into HADTRIP (vehicleid, tripid)
values (845557, 271775);
insert into HADTRIP (vehicleid, tripid)
values (531838, 515554);
insert into HADTRIP (vehicleid, tripid)
values (956571, 468119);
insert into HADTRIP (vehicleid, tripid)
values (752523, 945913);
insert into HADTRIP (vehicleid, tripid)
values (862717, 247973);
insert into HADTRIP (vehicleid, tripid)
values (411951, 862866);
insert into HADTRIP (vehicleid, tripid)
values (564872, 414981);
insert into HADTRIP (vehicleid, tripid)
values (842346, 914817);
insert into HADTRIP (vehicleid, tripid)
values (714389, 338353);
insert into HADTRIP (vehicleid, tripid)
values (899543, 372888);
insert into HADTRIP (vehicleid, tripid)
values (137139, 694958);
insert into HADTRIP (vehicleid, tripid)
values (913868, 558873);
insert into HADTRIP (vehicleid, tripid)
values (114715, 274794);
insert into HADTRIP (vehicleid, tripid)
values (391556, 156374);
insert into HADTRIP (vehicleid, tripid)
values (441192, 163229);
insert into HADTRIP (vehicleid, tripid)
values (146173, 564136);
insert into HADTRIP (vehicleid, tripid)
values (351334, 887319);
insert into HADTRIP (vehicleid, tripid)
values (594746, 538375);
insert into HADTRIP (vehicleid, tripid)
values (277395, 825152);
insert into HADTRIP (vehicleid, tripid)
values (855636, 936897);
insert into HADTRIP (vehicleid, tripid)
values (698952, 147155);
insert into HADTRIP (vehicleid, tripid)
values (735159, 391463);
insert into HADTRIP (vehicleid, tripid)
values (862379, 271741);
insert into HADTRIP (vehicleid, tripid)
values (334896, 799243);
insert into HADTRIP (vehicleid, tripid)
values (799136, 115294);
insert into HADTRIP (vehicleid, tripid)
values (124553, 453631);
insert into HADTRIP (vehicleid, tripid)
values (783724, 289943);
insert into HADTRIP (vehicleid, tripid)
values (552954, 757698);
insert into HADTRIP (vehicleid, tripid)
values (882337, 853395);
insert into HADTRIP (vehicleid, tripid)
values (984478, 291446);
insert into HADTRIP (vehicleid, tripid)
values (911685, 999562);
insert into HADTRIP (vehicleid, tripid)
values (741495, 252695);
insert into HADTRIP (vehicleid, tripid)
values (299749, 398332);
insert into HADTRIP (vehicleid, tripid)
values (137139, 398332);
insert into HADTRIP (vehicleid, tripid)
values (756815, 286159);
insert into HADTRIP (vehicleid, tripid)
values (225327, 862866);
insert into HADTRIP (vehicleid, tripid)
values (299186, 286858);
insert into HADTRIP (vehicleid, tripid)
values (137139, 827392);
insert into HADTRIP (vehicleid, tripid)
values (458644, 441179);
insert into HADTRIP (vehicleid, tripid)
values (546253, 441684);
insert into HADTRIP (vehicleid, tripid)
values (137139, 914718);
insert into HADTRIP (vehicleid, tripid)
values (828532, 279675);
insert into HADTRIP (vehicleid, tripid)
values (393727, 741438);
insert into HADTRIP (vehicleid, tripid)
values (269578, 739166);
commit;
prompt 100 records committed...
insert into HADTRIP (vehicleid, tripid)
values (662513, 664843);
insert into HADTRIP (vehicleid, tripid)
values (295494, 649141);
insert into HADTRIP (vehicleid, tripid)
values (879477, 118619);
insert into HADTRIP (vehicleid, tripid)
values (724245, 925394);
insert into HADTRIP (vehicleid, tripid)
values (886322, 124673);
insert into HADTRIP (vehicleid, tripid)
values (269282, 876633);
insert into HADTRIP (vehicleid, tripid)
values (686732, 351142);
insert into HADTRIP (vehicleid, tripid)
values (797936, 646245);
insert into HADTRIP (vehicleid, tripid)
values (225327, 258412);
insert into HADTRIP (vehicleid, tripid)
values (598987, 667324);
insert into HADTRIP (vehicleid, tripid)
values (984478, 358378);
insert into HADTRIP (vehicleid, tripid)
values (522964, 338353);
insert into HADTRIP (vehicleid, tripid)
values (251756, 316874);
insert into HADTRIP (vehicleid, tripid)
values (828532, 354667);
insert into HADTRIP (vehicleid, tripid)
values (612374, 322339);
insert into HADTRIP (vehicleid, tripid)
values (793336, 247973);
insert into HADTRIP (vehicleid, tripid)
values (334317, 582882);
insert into HADTRIP (vehicleid, tripid)
values (312794, 419688);
insert into HADTRIP (vehicleid, tripid)
values (614117, 312855);
insert into HADTRIP (vehicleid, tripid)
values (446793, 398993);
insert into HADTRIP (vehicleid, tripid)
values (831673, 511247);
insert into HADTRIP (vehicleid, tripid)
values (456142, 754782);
insert into HADTRIP (vehicleid, tripid)
values (245169, 593692);
insert into HADTRIP (vehicleid, tripid)
values (936611, 274794);
insert into HADTRIP (vehicleid, tripid)
values (986351, 141157);
insert into HADTRIP (vehicleid, tripid)
values (334896, 871526);
insert into HADTRIP (vehicleid, tripid)
values (964723, 384763);
insert into HADTRIP (vehicleid, tripid)
values (519837, 492953);
insert into HADTRIP (vehicleid, tripid)
values (124553, 968791);
insert into HADTRIP (vehicleid, tripid)
values (862717, 874629);
insert into HADTRIP (vehicleid, tripid)
values (497395, 215937);
insert into HADTRIP (vehicleid, tripid)
values (278349, 922324);
insert into HADTRIP (vehicleid, tripid)
values (469997, 382296);
insert into HADTRIP (vehicleid, tripid)
values (219453, 231944);
insert into HADTRIP (vehicleid, tripid)
values (938259, 231944);
insert into HADTRIP (vehicleid, tripid)
values (582178, 177224);
insert into HADTRIP (vehicleid, tripid)
values (895249, 212148);
insert into HADTRIP (vehicleid, tripid)
values (456142, 586415);
insert into HADTRIP (vehicleid, tripid)
values (414784, 392971);
insert into HADTRIP (vehicleid, tripid)
values (744782, 234821);
insert into HADTRIP (vehicleid, tripid)
values (352658, 532973);
insert into HADTRIP (vehicleid, tripid)
values (746186, 598113);
insert into HADTRIP (vehicleid, tripid)
values (324351, 467815);
insert into HADTRIP (vehicleid, tripid)
values (378729, 486554);
insert into HADTRIP (vehicleid, tripid)
values (979728, 496265);
insert into HADTRIP (vehicleid, tripid)
values (935332, 553632);
insert into HADTRIP (vehicleid, tripid)
values (962611, 622147);
insert into HADTRIP (vehicleid, tripid)
values (338882, 894184);
insert into HADTRIP (vehicleid, tripid)
values (762291, 151235);
insert into HADTRIP (vehicleid, tripid)
values (666262, 471996);
insert into HADTRIP (vehicleid, tripid)
values (441881, 775684);
insert into HADTRIP (vehicleid, tripid)
values (519646, 415728);
insert into HADTRIP (vehicleid, tripid)
values (388351, 858736);
insert into HADTRIP (vehicleid, tripid)
values (122174, 271775);
insert into HADTRIP (vehicleid, tripid)
values (617679, 469847);
insert into HADTRIP (vehicleid, tripid)
values (285662, 967317);
insert into HADTRIP (vehicleid, tripid)
values (225327, 925394);
insert into HADTRIP (vehicleid, tripid)
values (397394, 664843);
insert into HADTRIP (vehicleid, tripid)
values (367497, 511247);
insert into HADTRIP (vehicleid, tripid)
values (265696, 168453);
insert into HADTRIP (vehicleid, tripid)
values (689987, 334629);
insert into HADTRIP (vehicleid, tripid)
values (355145, 115294);
insert into HADTRIP (vehicleid, tripid)
values (293938, 856341);
insert into HADTRIP (vehicleid, tripid)
values (812556, 245615);
insert into HADTRIP (vehicleid, tripid)
values (575682, 482111);
insert into HADTRIP (vehicleid, tripid)
values (341175, 755675);
insert into HADTRIP (vehicleid, tripid)
values (952842, 631247);
insert into HADTRIP (vehicleid, tripid)
values (877452, 979154);
insert into HADTRIP (vehicleid, tripid)
values (647181, 573393);
insert into HADTRIP (vehicleid, tripid)
values (418488, 966877);
insert into HADTRIP (vehicleid, tripid)
values (324351, 483597);
insert into HADTRIP (vehicleid, tripid)
values (414943, 352787);
insert into HADTRIP (vehicleid, tripid)
values (645986, 764194);
insert into HADTRIP (vehicleid, tripid)
values (242996, 928694);
insert into HADTRIP (vehicleid, tripid)
values (295494, 672466);
insert into HADTRIP (vehicleid, tripid)
values (791347, 948358);
insert into HADTRIP (vehicleid, tripid)
values (977485, 775161);
insert into HADTRIP (vehicleid, tripid)
values (378729, 636315);
insert into HADTRIP (vehicleid, tripid)
values (367497, 515554);
insert into HADTRIP (vehicleid, tripid)
values (519837, 515689);
insert into HADTRIP (vehicleid, tripid)
values (193718, 715762);
insert into HADTRIP (vehicleid, tripid)
values (193786, 492644);
insert into HADTRIP (vehicleid, tripid)
values (361251, 948358);
insert into HADTRIP (vehicleid, tripid)
values (883729, 553632);
insert into HADTRIP (vehicleid, tripid)
values (686732, 185167);
insert into HADTRIP (vehicleid, tripid)
values (661551, 352787);
insert into HADTRIP (vehicleid, tripid)
values (756815, 813993);
insert into HADTRIP (vehicleid, tripid)
values (273848, 864464);
insert into HADTRIP (vehicleid, tripid)
values (661551, 958361);
insert into HADTRIP (vehicleid, tripid)
values (899543, 548977);
insert into HADTRIP (vehicleid, tripid)
values (652587, 754527);
insert into HADTRIP (vehicleid, tripid)
values (329156, 455459);
insert into HADTRIP (vehicleid, tripid)
values (324351, 975261);
insert into HADTRIP (vehicleid, tripid)
values (645986, 362956);
insert into HADTRIP (vehicleid, tripid)
values (516232, 864621);
insert into HADTRIP (vehicleid, tripid)
values (148158, 539896);
insert into HADTRIP (vehicleid, tripid)
values (468277, 371524);
insert into HADTRIP (vehicleid, tripid)
values (127756, 315327);
insert into HADTRIP (vehicleid, tripid)
values (569863, 353762);
insert into HADTRIP (vehicleid, tripid)
values (226257, 469847);
commit;
prompt 200 records committed...
insert into HADTRIP (vehicleid, tripid)
values (674122, 888357);
insert into HADTRIP (vehicleid, tripid)
values (418488, 458686);
insert into HADTRIP (vehicleid, tripid)
values (632974, 735335);
insert into HADTRIP (vehicleid, tripid)
values (598987, 478637);
insert into HADTRIP (vehicleid, tripid)
values (899543, 521664);
insert into HADTRIP (vehicleid, tripid)
values (146385, 692992);
insert into HADTRIP (vehicleid, tripid)
values (848765, 663729);
insert into HADTRIP (vehicleid, tripid)
values (287244, 379728);
insert into HADTRIP (vehicleid, tripid)
values (977737, 949882);
insert into HADTRIP (vehicleid, tripid)
values (146385, 228941);
insert into HADTRIP (vehicleid, tripid)
values (179589, 664945);
insert into HADTRIP (vehicleid, tripid)
values (265163, 862461);
insert into HADTRIP (vehicleid, tripid)
values (454592, 954982);
insert into HADTRIP (vehicleid, tripid)
values (652238, 269867);
insert into HADTRIP (vehicleid, tripid)
values (559514, 351142);
insert into HADTRIP (vehicleid, tripid)
values (696558, 674388);
insert into HADTRIP (vehicleid, tripid)
values (179589, 481531);
insert into HADTRIP (vehicleid, tripid)
values (278349, 587957);
insert into HADTRIP (vehicleid, tripid)
values (497687, 299985);
insert into HADTRIP (vehicleid, tripid)
values (468277, 419688);
insert into HADTRIP (vehicleid, tripid)
values (926356, 694754);
insert into HADTRIP (vehicleid, tripid)
values (824772, 162556);
insert into HADTRIP (vehicleid, tripid)
values (623573, 361336);
insert into HADTRIP (vehicleid, tripid)
values (679569, 618482);
insert into HADTRIP (vehicleid, tripid)
values (312794, 455459);
insert into HADTRIP (vehicleid, tripid)
values (662296, 379728);
insert into HADTRIP (vehicleid, tripid)
values (546435, 967651);
insert into HADTRIP (vehicleid, tripid)
values (441192, 773289);
insert into HADTRIP (vehicleid, tripid)
values (745367, 286159);
insert into HADTRIP (vehicleid, tripid)
values (245169, 868379);
insert into HADTRIP (vehicleid, tripid)
values (598987, 975886);
insert into HADTRIP (vehicleid, tripid)
values (191535, 349748);
insert into HADTRIP (vehicleid, tripid)
values (838487, 682878);
insert into HADTRIP (vehicleid, tripid)
values (975531, 949392);
insert into HADTRIP (vehicleid, tripid)
values (975531, 968797);
insert into HADTRIP (vehicleid, tripid)
values (575682, 735335);
insert into HADTRIP (vehicleid, tripid)
values (165555, 829111);
insert into HADTRIP (vehicleid, tripid)
values (962611, 551767);
insert into HADTRIP (vehicleid, tripid)
values (391556, 573393);
insert into HADTRIP (vehicleid, tripid)
values (258488, 494375);
insert into HADTRIP (vehicleid, tripid)
values (255696, 653742);
insert into HADTRIP (vehicleid, tripid)
values (632189, 334629);
insert into HADTRIP (vehicleid, tripid)
values (325119, 355224);
insert into HADTRIP (vehicleid, tripid)
values (341175, 836244);
insert into HADTRIP (vehicleid, tripid)
values (928564, 449856);
insert into HADTRIP (vehicleid, tripid)
values (565211, 799243);
insert into HADTRIP (vehicleid, tripid)
values (647315, 496265);
insert into HADTRIP (vehicleid, tripid)
values (391262, 552683);
insert into HADTRIP (vehicleid, tripid)
values (979728, 888357);
insert into HADTRIP (vehicleid, tripid)
values (877452, 452278);
insert into HADTRIP (vehicleid, tripid)
values (941218, 228132);
insert into HADTRIP (vehicleid, tripid)
values (753544, 329828);
insert into HADTRIP (vehicleid, tripid)
values (583224, 755653);
insert into HADTRIP (vehicleid, tripid)
values (265163, 414981);
insert into HADTRIP (vehicleid, tripid)
values (958923, 156374);
insert into HADTRIP (vehicleid, tripid)
values (644373, 553632);
insert into HADTRIP (vehicleid, tripid)
values (444396, 315445);
insert into HADTRIP (vehicleid, tripid)
values (431798, 532973);
insert into HADTRIP (vehicleid, tripid)
values (819964, 559632);
insert into HADTRIP (vehicleid, tripid)
values (391556, 482161);
insert into HADTRIP (vehicleid, tripid)
values (416275, 622146);
insert into HADTRIP (vehicleid, tripid)
values (519837, 715762);
insert into HADTRIP (vehicleid, tripid)
values (269282, 268652);
insert into HADTRIP (vehicleid, tripid)
values (812556, 351142);
insert into HADTRIP (vehicleid, tripid)
values (269226, 553632);
insert into HADTRIP (vehicleid, tripid)
values (171715, 868752);
insert into HADTRIP (vehicleid, tripid)
values (265696, 492953);
insert into HADTRIP (vehicleid, tripid)
values (696372, 441627);
insert into HADTRIP (vehicleid, tripid)
values (449125, 662718);
insert into HADTRIP (vehicleid, tripid)
values (647181, 316874);
insert into HADTRIP (vehicleid, tripid)
values (179589, 824118);
insert into HADTRIP (vehicleid, tripid)
values (491965, 328581);
insert into HADTRIP (vehicleid, tripid)
values (849224, 118619);
insert into HADTRIP (vehicleid, tripid)
values (586425, 773289);
insert into HADTRIP (vehicleid, tripid)
values (834828, 283946);
insert into HADTRIP (vehicleid, tripid)
values (979593, 638961);
insert into HADTRIP (vehicleid, tripid)
values (299186, 934165);
insert into HADTRIP (vehicleid, tripid)
values (426121, 189626);
insert into HADTRIP (vehicleid, tripid)
values (383246, 663612);
insert into HADTRIP (vehicleid, tripid)
values (439258, 286858);
insert into HADTRIP (vehicleid, tripid)
values (226257, 451374);
insert into HADTRIP (vehicleid, tripid)
values (242996, 691248);
insert into HADTRIP (vehicleid, tripid)
values (583676, 312855);
insert into HADTRIP (vehicleid, tripid)
values (215143, 253793);
insert into HADTRIP (vehicleid, tripid)
values (465979, 515689);
insert into HADTRIP (vehicleid, tripid)
values (397895, 979187);
insert into HADTRIP (vehicleid, tripid)
values (831673, 392971);
insert into HADTRIP (vehicleid, tripid)
values (566661, 948358);
insert into HADTRIP (vehicleid, tripid)
values (768721, 419688);
insert into HADTRIP (vehicleid, tripid)
values (144335, 136168);
insert into HADTRIP (vehicleid, tripid)
values (979342, 272721);
insert into HADTRIP (vehicleid, tripid)
values (762345, 515635);
insert into HADTRIP (vehicleid, tripid)
values (525239, 587957);
insert into HADTRIP (vehicleid, tripid)
values (329156, 825152);
insert into HADTRIP (vehicleid, tripid)
values (698952, 289943);
insert into HADTRIP (vehicleid, tripid)
values (469673, 547393);
insert into HADTRIP (vehicleid, tripid)
values (127443, 456338);
insert into HADTRIP (vehicleid, tripid)
values (744782, 339152);
insert into HADTRIP (vehicleid, tripid)
values (255696, 753714);
insert into HADTRIP (vehicleid, tripid)
values (662296, 888357);
commit;
prompt 300 records committed...
insert into HADTRIP (vehicleid, tripid)
values (396365, 421889);
insert into HADTRIP (vehicleid, tripid)
values (974567, 962746);
insert into HADTRIP (vehicleid, tripid)
values (848765, 962746);
insert into HADTRIP (vehicleid, tripid)
values (269579, 583886);
insert into HADTRIP (vehicleid, tripid)
values (696372, 932277);
insert into HADTRIP (vehicleid, tripid)
values (872846, 994812);
insert into HADTRIP (vehicleid, tripid)
values (258784, 654354);
insert into HADTRIP (vehicleid, tripid)
values (879964, 994812);
insert into HADTRIP (vehicleid, tripid)
values (137139, 146839);
insert into HADTRIP (vehicleid, tripid)
values (917321, 779341);
insert into HADTRIP (vehicleid, tripid)
values (595483, 515554);
insert into HADTRIP (vehicleid, tripid)
values (765978, 624511);
insert into HADTRIP (vehicleid, tripid)
values (449621, 329696);
insert into HADTRIP (vehicleid, tripid)
values (741495, 934195);
insert into HADTRIP (vehicleid, tripid)
values (971119, 218736);
insert into HADTRIP (vehicleid, tripid)
values (879964, 391463);
insert into HADTRIP (vehicleid, tripid)
values (643742, 168453);
insert into HADTRIP (vehicleid, tripid)
values (946737, 839589);
insert into HADTRIP (vehicleid, tripid)
values (469997, 452278);
insert into HADTRIP (vehicleid, tripid)
values (226257, 694958);
insert into HADTRIP (vehicleid, tripid)
values (583676, 644868);
insert into HADTRIP (vehicleid, tripid)
values (319454, 441684);
insert into HADTRIP (vehicleid, tripid)
values (221689, 274794);
insert into HADTRIP (vehicleid, tripid)
values (746186, 346731);
insert into HADTRIP (vehicleid, tripid)
values (569353, 914896);
insert into HADTRIP (vehicleid, tripid)
values (855636, 757698);
insert into HADTRIP (vehicleid, tripid)
values (796324, 922324);
insert into HADTRIP (vehicleid, tripid)
values (569863, 829111);
insert into HADTRIP (vehicleid, tripid)
values (979342, 234164);
insert into HADTRIP (vehicleid, tripid)
values (319162, 641724);
insert into HADTRIP (vehicleid, tripid)
values (319162, 785178);
insert into HADTRIP (vehicleid, tripid)
values (396365, 799243);
insert into HADTRIP (vehicleid, tripid)
values (634346, 687399);
insert into HADTRIP (vehicleid, tripid)
values (383922, 398332);
insert into HADTRIP (vehicleid, tripid)
values (511542, 439852);
insert into HADTRIP (vehicleid, tripid)
values (645912, 583682);
insert into HADTRIP (vehicleid, tripid)
values (629388, 984841);
insert into HADTRIP (vehicleid, tripid)
values (644373, 375388);
insert into HADTRIP (vehicleid, tripid)
values (865581, 157578);
insert into HADTRIP (vehicleid, tripid)
values (586425, 315445);
insert into HADTRIP (vehicleid, tripid)
values (519837, 173711);
insert into HADTRIP (vehicleid, tripid)
values (319454, 587829);
insert into HADTRIP (vehicleid, tripid)
values (683451, 726573);
insert into HADTRIP (vehicleid, tripid)
values (569353, 336553);
insert into HADTRIP (vehicleid, tripid)
values (983467, 754527);
insert into HADTRIP (vehicleid, tripid)
values (575217, 797994);
insert into HADTRIP (vehicleid, tripid)
values (193786, 559632);
insert into HADTRIP (vehicleid, tripid)
values (548157, 245615);
insert into HADTRIP (vehicleid, tripid)
values (518618, 467815);
insert into HADTRIP (vehicleid, tripid)
values (865581, 136786);
insert into HADTRIP (vehicleid, tripid)
values (448959, 643448);
insert into HADTRIP (vehicleid, tripid)
values (391556, 897356);
insert into HADTRIP (vehicleid, tripid)
values (414943, 482111);
insert into HADTRIP (vehicleid, tripid)
values (677517, 831943);
insert into HADTRIP (vehicleid, tripid)
values (418488, 124673);
insert into HADTRIP (vehicleid, tripid)
values (648933, 715689);
insert into HADTRIP (vehicleid, tripid)
values (285662, 758969);
insert into HADTRIP (vehicleid, tripid)
values (954969, 991821);
insert into HADTRIP (vehicleid, tripid)
values (346449, 336553);
insert into HADTRIP (vehicleid, tripid)
values (894515, 272721);
insert into HADTRIP (vehicleid, tripid)
values (893735, 877262);
insert into HADTRIP (vehicleid, tripid)
values (285662, 777176);
insert into HADTRIP (vehicleid, tripid)
values (929512, 449856);
insert into HADTRIP (vehicleid, tripid)
values (911698, 398332);
insert into HADTRIP (vehicleid, tripid)
values (299532, 233266);
insert into HADTRIP (vehicleid, tripid)
values (163671, 683962);
insert into HADTRIP (vehicleid, tripid)
values (295685, 348712);
insert into HADTRIP (vehicleid, tripid)
values (416275, 736118);
insert into HADTRIP (vehicleid, tripid)
values (714841, 638961);
insert into HADTRIP (vehicleid, tripid)
values (314354, 945913);
insert into HADTRIP (vehicleid, tripid)
values (766753, 253793);
insert into HADTRIP (vehicleid, tripid)
values (169942, 419688);
insert into HADTRIP (vehicleid, tripid)
values (835233, 653742);
insert into HADTRIP (vehicleid, tripid)
values (647315, 853395);
insert into HADTRIP (vehicleid, tripid)
values (182968, 515689);
insert into HADTRIP (vehicleid, tripid)
values (269226, 262113);
insert into HADTRIP (vehicleid, tripid)
values (464111, 613311);
insert into HADTRIP (vehicleid, tripid)
values (865349, 663612);
insert into HADTRIP (vehicleid, tripid)
values (165536, 132966);
insert into HADTRIP (vehicleid, tripid)
values (874343, 397537);
insert into HADTRIP (vehicleid, tripid)
values (647562, 534887);
insert into HADTRIP (vehicleid, tripid)
values (265163, 349748);
insert into HADTRIP (vehicleid, tripid)
values (526252, 271915);
insert into HADTRIP (vehicleid, tripid)
values (379745, 928694);
insert into HADTRIP (vehicleid, tripid)
values (879477, 832234);
insert into HADTRIP (vehicleid, tripid)
values (426167, 482161);
insert into HADTRIP (vehicleid, tripid)
values (275497, 532973);
insert into HADTRIP (vehicleid, tripid)
values (144226, 559632);
insert into HADTRIP (vehicleid, tripid)
values (397895, 192549);
insert into HADTRIP (vehicleid, tripid)
values (546253, 546556);
insert into HADTRIP (vehicleid, tripid)
values (378375, 622147);
insert into HADTRIP (vehicleid, tripid)
values (484519, 816797);
insert into HADTRIP (vehicleid, tripid)
values (783324, 155693);
insert into HADTRIP (vehicleid, tripid)
values (481237, 612267);
insert into HADTRIP (vehicleid, tripid)
values (986351, 324161);
insert into HADTRIP (vehicleid, tripid)
values (796324, 612267);
insert into HADTRIP (vehicleid, tripid)
values (437415, 253793);
insert into HADTRIP (vehicleid, tripid)
values (987167, 781931);
insert into HADTRIP (vehicleid, tripid)
values (481647, 932277);
insert into HADTRIP (vehicleid, tripid)
values (295494, 126948);
commit;
prompt 400 records committed...
insert into HADTRIP (vehicleid, tripid)
values (441945, 613288);
insert into HADTRIP (vehicleid, tripid)
values (397429, 593692);
insert into HADTRIP (vehicleid, tripid)
values (926356, 328782);
insert into HADTRIP (vehicleid, tripid)
values (647428, 147325);
insert into HADTRIP (vehicleid, tripid)
values (595483, 399278);
insert into HADTRIP (vehicleid, tripid)
values (659778, 715689);
insert into HADTRIP (vehicleid, tripid)
values (615292, 212148);
insert into HADTRIP (vehicleid, tripid)
values (324351, 494583);
insert into HADTRIP (vehicleid, tripid)
values (396365, 888971);
insert into HADTRIP (vehicleid, tripid)
values (163538, 888971);
insert into HADTRIP (vehicleid, tripid)
values (374848, 694754);
insert into HADTRIP (vehicleid, tripid)
values (929512, 271775);
insert into HADTRIP (vehicleid, tripid)
values (925575, 524215);
insert into HADTRIP (vehicleid, tripid)
values (324351, 754364);
insert into HADTRIP (vehicleid, tripid)
values (823654, 876633);
insert into HADTRIP (vehicleid, tripid)
values (548157, 118619);
insert into HADTRIP (vehicleid, tripid)
values (219453, 754527);
insert into HADTRIP (vehicleid, tripid)
values (634346, 624511);
insert into HADTRIP (vehicleid, tripid)
values (375151, 735335);
insert into HADTRIP (vehicleid, tripid)
values (854683, 398525);
insert into HADTRIP (vehicleid, tripid)
values (265163, 346731);
insert into HADTRIP (vehicleid, tripid)
values (696558, 559718);
insert into HADTRIP (vehicleid, tripid)
values (333447, 682878);
insert into HADTRIP (vehicleid, tripid)
values (524233, 215937);
insert into HADTRIP (vehicleid, tripid)
values (936611, 335428);
insert into HADTRIP (vehicleid, tripid)
values (144335, 419688);
insert into HADTRIP (vehicleid, tripid)
values (552954, 775684);
insert into HADTRIP (vehicleid, tripid)
values (618555, 533534);
insert into HADTRIP (vehicleid, tripid)
values (583346, 794327);
insert into HADTRIP (vehicleid, tripid)
values (226257, 758855);
insert into HADTRIP (vehicleid, tripid)
values (893735, 641724);
insert into HADTRIP (vehicleid, tripid)
values (299887, 639184);
insert into HADTRIP (vehicleid, tripid)
values (352658, 467923);
insert into HADTRIP (vehicleid, tripid)
values (855636, 641724);
insert into HADTRIP (vehicleid, tripid)
values (741495, 966877);
insert into HADTRIP (vehicleid, tripid)
values (683451, 188327);
insert into HADTRIP (vehicleid, tripid)
values (582178, 638961);
insert into HADTRIP (vehicleid, tripid)
values (167436, 524215);
insert into HADTRIP (vehicleid, tripid)
values (251266, 126948);
insert into HADTRIP (vehicleid, tripid)
values (647315, 221711);
insert into HADTRIP (vehicleid, tripid)
values (687546, 373239);
insert into HADTRIP (vehicleid, tripid)
values (924698, 334629);
insert into HADTRIP (vehicleid, tripid)
values (458644, 969976);
insert into HADTRIP (vehicleid, tripid)
values (974567, 644564);
insert into HADTRIP (vehicleid, tripid)
values (481872, 398332);
insert into HADTRIP (vehicleid, tripid)
values (696558, 472133);
insert into HADTRIP (vehicleid, tripid)
values (639753, 328581);
insert into HADTRIP (vehicleid, tripid)
values (681494, 548352);
insert into HADTRIP (vehicleid, tripid)
values (439258, 853863);
insert into HADTRIP (vehicleid, tripid)
values (924264, 694958);
insert into HADTRIP (vehicleid, tripid)
values (682623, 185167);
insert into HADTRIP (vehicleid, tripid)
values (167436, 799243);
insert into HADTRIP (vehicleid, tripid)
values (152883, 753714);
insert into HADTRIP (vehicleid, tripid)
values (917321, 478637);
insert into HADTRIP (vehicleid, tripid)
values (746186, 777176);
insert into HADTRIP (vehicleid, tripid)
values (539637, 777176);
insert into HADTRIP (vehicleid, tripid)
values (977196, 551767);
insert into HADTRIP (vehicleid, tripid)
values (435731, 736118);
insert into HADTRIP (vehicleid, tripid)
values (762291, 273356);
insert into HADTRIP (vehicleid, tripid)
values (361431, 952812);
insert into HADTRIP (vehicleid, tripid)
values (546435, 441684);
insert into HADTRIP (vehicleid, tripid)
values (662296, 474289);
insert into HADTRIP (vehicleid, tripid)
values (494271, 382296);
insert into HADTRIP (vehicleid, tripid)
values (745367, 281434);
insert into HADTRIP (vehicleid, tripid)
values (349349, 398525);
insert into HADTRIP (vehicleid, tripid)
values (894515, 797994);
insert into HADTRIP (vehicleid, tripid)
values (746186, 492759);
insert into HADTRIP (vehicleid, tripid)
values (942499, 934165);
insert into HADTRIP (vehicleid, tripid)
values (831673, 949392);
insert into HADTRIP (vehicleid, tripid)
values (975531, 923358);
insert into HADTRIP (vehicleid, tripid)
values (983467, 392971);
insert into HADTRIP (vehicleid, tripid)
values (497395, 178887);
insert into HADTRIP (vehicleid, tripid)
values (681235, 622146);
insert into HADTRIP (vehicleid, tripid)
values (399221, 283946);
insert into HADTRIP (vehicleid, tripid)
values (397895, 848793);
insert into HADTRIP (vehicleid, tripid)
values (618555, 136168);
insert into HADTRIP (vehicleid, tripid)
values (594746, 118619);
insert into HADTRIP (vehicleid, tripid)
values (448959, 637764);
insert into HADTRIP (vehicleid, tripid)
values (525239, 361336);
insert into HADTRIP (vehicleid, tripid)
values (687546, 663729);
insert into HADTRIP (vehicleid, tripid)
values (237817, 594169);
insert into HADTRIP (vehicleid, tripid)
values (129215, 914817);
insert into HADTRIP (vehicleid, tripid)
values (548157, 498634);
insert into HADTRIP (vehicleid, tripid)
values (225327, 112528);
insert into HADTRIP (vehicleid, tripid)
values (762291, 521664);
insert into HADTRIP (vehicleid, tripid)
values (854717, 272721);
insert into HADTRIP (vehicleid, tripid)
values (632823, 189932);
insert into HADTRIP (vehicleid, tripid)
values (346449, 664843);
insert into HADTRIP (vehicleid, tripid)
values (797936, 364273);
insert into HADTRIP (vehicleid, tripid)
values (953765, 132966);
insert into HADTRIP (vehicleid, tripid)
values (267165, 937351);
insert into HADTRIP (vehicleid, tripid)
values (977196, 975261);
insert into HADTRIP (vehicleid, tripid)
values (312794, 593692);
insert into HADTRIP (vehicleid, tripid)
values (144226, 755155);
insert into HADTRIP (vehicleid, tripid)
values (413974, 755675);
insert into HADTRIP (vehicleid, tripid)
values (361431, 866489);
insert into HADTRIP (vehicleid, tripid)
values (525239, 825152);
insert into HADTRIP (vehicleid, tripid)
values (877452, 813993);
insert into HADTRIP (vehicleid, tripid)
values (814785, 914718);
insert into HADTRIP (vehicleid, tripid)
values (458644, 934165);
commit;
prompt 500 records loaded
prompt Loading HASTRIPS...
insert into HASTRIPS (soldierid, tripid)
values (183222, 277164);
insert into HASTRIPS (soldierid, tripid)
values (682840, 329828);
insert into HASTRIPS (soldierid, tripid)
values (188447, 316427);
insert into HASTRIPS (soldierid, tripid)
values (750281, 652196);
insert into HASTRIPS (soldierid, tripid)
values (582670, 779341);
insert into HASTRIPS (soldierid, tripid)
values (275015, 583682);
insert into HASTRIPS (soldierid, tripid)
values (548719, 554538);
insert into HASTRIPS (soldierid, tripid)
values (873867, 968791);
insert into HASTRIPS (soldierid, tripid)
values (474260, 967887);
insert into HASTRIPS (soldierid, tripid)
values (297322, 362115);
insert into HASTRIPS (soldierid, tripid)
values (750281, 278686);
insert into HASTRIPS (soldierid, tripid)
values (223329, 856341);
insert into HASTRIPS (soldierid, tripid)
values (997430, 469847);
insert into HASTRIPS (soldierid, tripid)
values (361922, 515635);
insert into HASTRIPS (soldierid, tripid)
values (591399, 786145);
insert into HASTRIPS (soldierid, tripid)
values (134819, 316427);
insert into HASTRIPS (soldierid, tripid)
values (446880, 639184);
insert into HASTRIPS (soldierid, tripid)
values (962572, 146839);
insert into HASTRIPS (soldierid, tripid)
values (757015, 449856);
insert into HASTRIPS (soldierid, tripid)
values (373297, 922324);
insert into HASTRIPS (soldierid, tripid)
values (668082, 856314);
insert into HASTRIPS (soldierid, tripid)
values (611570, 888663);
insert into HASTRIPS (soldierid, tripid)
values (202948, 638961);
insert into HASTRIPS (soldierid, tripid)
values (862158, 923358);
insert into HASTRIPS (soldierid, tripid)
values (160706, 552683);
insert into HASTRIPS (soldierid, tripid)
values (945783, 524215);
insert into HASTRIPS (soldierid, tripid)
values (716113, 898385);
insert into HASTRIPS (soldierid, tripid)
values (385229, 979154);
insert into HASTRIPS (soldierid, tripid)
values (449775, 775161);
insert into HASTRIPS (soldierid, tripid)
values (950507, 754364);
insert into HASTRIPS (soldierid, tripid)
values (355186, 319331);
insert into HASTRIPS (soldierid, tripid)
values (554170, 564136);
insert into HASTRIPS (soldierid, tripid)
values (674497, 931585);
insert into HASTRIPS (soldierid, tripid)
values (876809, 777176);
insert into HASTRIPS (soldierid, tripid)
values (308204, 551767);
insert into HASTRIPS (soldierid, tripid)
values (623578, 528495);
insert into HASTRIPS (soldierid, tripid)
values (967520, 794327);
insert into HASTRIPS (soldierid, tripid)
values (478332, 786145);
insert into HASTRIPS (soldierid, tripid)
values (796195, 458895);
insert into HASTRIPS (soldierid, tripid)
values (333934, 462143);
insert into HASTRIPS (soldierid, tripid)
values (269910, 598113);
insert into HASTRIPS (soldierid, tripid)
values (901304, 173711);
insert into HASTRIPS (soldierid, tripid)
values (355186, 659315);
insert into HASTRIPS (soldierid, tripid)
values (513590, 454657);
insert into HASTRIPS (soldierid, tripid)
values (182637, 952646);
insert into HASTRIPS (soldierid, tripid)
values (757015, 547393);
insert into HASTRIPS (soldierid, tripid)
values (326597, 618932);
insert into HASTRIPS (soldierid, tripid)
values (297457, 858736);
insert into HASTRIPS (soldierid, tripid)
values (794199, 332631);
insert into HASTRIPS (soldierid, tripid)
values (354993, 639184);
insert into HASTRIPS (soldierid, tripid)
values (282991, 881176);
insert into HASTRIPS (soldierid, tripid)
values (950895, 931585);
insert into HASTRIPS (soldierid, tripid)
values (579470, 639184);
insert into HASTRIPS (soldierid, tripid)
values (116436, 471996);
insert into HASTRIPS (soldierid, tripid)
values (430887, 736118);
insert into HASTRIPS (soldierid, tripid)
values (967520, 486554);
insert into HASTRIPS (soldierid, tripid)
values (755659, 598113);
insert into HASTRIPS (soldierid, tripid)
values (112644, 352787);
insert into HASTRIPS (soldierid, tripid)
values (135869, 511247);
insert into HASTRIPS (soldierid, tripid)
values (470454, 663224);
insert into HASTRIPS (soldierid, tripid)
values (469937, 948358);
insert into HASTRIPS (soldierid, tripid)
values (666601, 949266);
insert into HASTRIPS (soldierid, tripid)
values (155051, 278727);
insert into HASTRIPS (soldierid, tripid)
values (374180, 863474);
insert into HASTRIPS (soldierid, tripid)
values (796195, 755653);
insert into HASTRIPS (soldierid, tripid)
values (674497, 952718);
insert into HASTRIPS (soldierid, tripid)
values (718556, 315327);
insert into HASTRIPS (soldierid, tripid)
values (259579, 362115);
insert into HASTRIPS (soldierid, tripid)
values (459990, 394521);
insert into HASTRIPS (soldierid, tripid)
values (706453, 566952);
insert into HASTRIPS (soldierid, tripid)
values (740158, 682878);
insert into HASTRIPS (soldierid, tripid)
values (819969, 428812);
insert into HASTRIPS (soldierid, tripid)
values (363343, 937672);
insert into HASTRIPS (soldierid, tripid)
values (838212, 612267);
insert into HASTRIPS (soldierid, tripid)
values (114797, 188327);
insert into HASTRIPS (soldierid, tripid)
values (391603, 379728);
insert into HASTRIPS (soldierid, tripid)
values (836089, 126687);
insert into HASTRIPS (soldierid, tripid)
values (802638, 124673);
insert into HASTRIPS (soldierid, tripid)
values (361200, 756512);
insert into HASTRIPS (soldierid, tripid)
values (684174, 715762);
insert into HASTRIPS (soldierid, tripid)
values (460885, 755155);
insert into HASTRIPS (soldierid, tripid)
values (169789, 332631);
insert into HASTRIPS (soldierid, tripid)
values (259018, 587829);
insert into HASTRIPS (soldierid, tripid)
values (372614, 725196);
insert into HASTRIPS (soldierid, tripid)
values (931157, 888663);
insert into HASTRIPS (soldierid, tripid)
values (801685, 829111);
insert into HASTRIPS (soldierid, tripid)
values (643143, 622147);
insert into HASTRIPS (soldierid, tripid)
values (366932, 386688);
insert into HASTRIPS (soldierid, tripid)
values (308204, 914896);
insert into HASTRIPS (soldierid, tripid)
values (500379, 827392);
insert into HASTRIPS (soldierid, tripid)
values (688080, 587829);
insert into HASTRIPS (soldierid, tripid)
values (681635, 853395);
insert into HASTRIPS (soldierid, tripid)
values (133479, 868379);
insert into HASTRIPS (soldierid, tripid)
values (442243, 779341);
insert into HASTRIPS (soldierid, tripid)
values (500379, 255392);
insert into HASTRIPS (soldierid, tripid)
values (130363, 779341);
insert into HASTRIPS (soldierid, tripid)
values (168097, 736118);
insert into HASTRIPS (soldierid, tripid)
values (290299, 151235);
insert into HASTRIPS (soldierid, tripid)
values (644729, 463991);
insert into HASTRIPS (soldierid, tripid)
values (748168, 861731);
commit;
prompt 100 records committed...
insert into HASTRIPS (soldierid, tripid)
values (747321, 449856);
insert into HASTRIPS (soldierid, tripid)
values (836895, 146748);
insert into HASTRIPS (soldierid, tripid)
values (815242, 482161);
insert into HASTRIPS (soldierid, tripid)
values (862158, 739166);
insert into HASTRIPS (soldierid, tripid)
values (626060, 387365);
insert into HASTRIPS (soldierid, tripid)
values (593954, 339152);
insert into HASTRIPS (soldierid, tripid)
values (894953, 687399);
insert into HASTRIPS (soldierid, tripid)
values (308204, 576756);
insert into HASTRIPS (soldierid, tripid)
values (950895, 456338);
insert into HASTRIPS (soldierid, tripid)
values (699268, 168453);
insert into HASTRIPS (soldierid, tripid)
values (111613, 618482);
insert into HASTRIPS (soldierid, tripid)
values (111677, 558873);
insert into HASTRIPS (soldierid, tripid)
values (933319, 872652);
insert into HASTRIPS (soldierid, tripid)
values (337566, 398319);
insert into HASTRIPS (soldierid, tripid)
values (449775, 228132);
insert into HASTRIPS (soldierid, tripid)
values (219861, 612267);
insert into HASTRIPS (soldierid, tripid)
values (512844, 639184);
insert into HASTRIPS (soldierid, tripid)
values (440144, 956245);
insert into HASTRIPS (soldierid, tripid)
values (102587, 622147);
insert into HASTRIPS (soldierid, tripid)
values (778397, 113196);
insert into HASTRIPS (soldierid, tripid)
values (170823, 914817);
insert into HASTRIPS (soldierid, tripid)
values (474260, 452278);
insert into HASTRIPS (soldierid, tripid)
values (182637, 455116);
insert into HASTRIPS (soldierid, tripid)
values (259579, 492759);
insert into HASTRIPS (soldierid, tripid)
values (712415, 553632);
insert into HASTRIPS (soldierid, tripid)
values (114797, 511247);
insert into HASTRIPS (soldierid, tripid)
values (475298, 888357);
insert into HASTRIPS (soldierid, tripid)
values (998897, 652196);
insert into HASTRIPS (soldierid, tripid)
values (848823, 564136);
insert into HASTRIPS (soldierid, tripid)
values (146990, 715762);
insert into HASTRIPS (soldierid, tripid)
values (438559, 931585);
insert into HASTRIPS (soldierid, tripid)
values (658314, 956245);
insert into HASTRIPS (soldierid, tripid)
values (216942, 189626);
insert into HASTRIPS (soldierid, tripid)
values (133479, 316874);
insert into HASTRIPS (soldierid, tripid)
values (860716, 662718);
insert into HASTRIPS (soldierid, tripid)
values (133272, 299985);
insert into HASTRIPS (soldierid, tripid)
values (259018, 612346);
insert into HASTRIPS (soldierid, tripid)
values (879065, 463723);
insert into HASTRIPS (soldierid, tripid)
values (180861, 462143);
insert into HASTRIPS (soldierid, tripid)
values (950507, 871526);
insert into HASTRIPS (soldierid, tripid)
values (570342, 757698);
insert into HASTRIPS (soldierid, tripid)
values (855354, 482161);
insert into HASTRIPS (soldierid, tripid)
values (130363, 636315);
insert into HASTRIPS (soldierid, tripid)
values (297322, 853863);
insert into HASTRIPS (soldierid, tripid)
values (394902, 394521);
insert into HASTRIPS (soldierid, tripid)
values (950507, 412392);
insert into HASTRIPS (soldierid, tripid)
values (853031, 195168);
insert into HASTRIPS (soldierid, tripid)
values (591927, 786145);
insert into HASTRIPS (soldierid, tripid)
values (901304, 943274);
insert into HASTRIPS (soldierid, tripid)
values (608749, 121324);
insert into HASTRIPS (soldierid, tripid)
values (961833, 398993);
insert into HASTRIPS (soldierid, tripid)
values (647570, 968791);
insert into HASTRIPS (soldierid, tripid)
values (108002, 189626);
insert into HASTRIPS (soldierid, tripid)
values (436580, 687399);
insert into HASTRIPS (soldierid, tripid)
values (236610, 719474);
insert into HASTRIPS (soldierid, tripid)
values (433646, 126948);
insert into HASTRIPS (soldierid, tripid)
values (959171, 278686);
insert into HASTRIPS (soldierid, tripid)
values (688080, 134483);
insert into HASTRIPS (soldierid, tripid)
values (278049, 358378);
insert into HASTRIPS (soldierid, tripid)
values (759116, 949266);
insert into HASTRIPS (soldierid, tripid)
values (666601, 832234);
insert into HASTRIPS (soldierid, tripid)
values (920436, 281434);
insert into HASTRIPS (soldierid, tripid)
values (639295, 315327);
insert into HASTRIPS (soldierid, tripid)
values (651661, 215937);
insert into HASTRIPS (soldierid, tripid)
values (211880, 478637);
insert into HASTRIPS (soldierid, tripid)
values (755078, 896148);
insert into HASTRIPS (soldierid, tripid)
values (905033, 178887);
insert into HASTRIPS (soldierid, tripid)
values (270239, 918987);
insert into HASTRIPS (soldierid, tripid)
values (484290, 391463);
insert into HASTRIPS (soldierid, tripid)
values (873672, 778168);
insert into HASTRIPS (soldierid, tripid)
values (130245, 966164);
insert into HASTRIPS (soldierid, tripid)
values (558672, 281434);
insert into HASTRIPS (soldierid, tripid)
values (780542, 181788);
insert into HASTRIPS (soldierid, tripid)
values (133272, 364273);
insert into HASTRIPS (soldierid, tripid)
values (275015, 943274);
insert into HASTRIPS (soldierid, tripid)
values (475943, 829111);
insert into HASTRIPS (soldierid, tripid)
values (755659, 754364);
insert into HASTRIPS (soldierid, tripid)
values (572415, 639184);
insert into HASTRIPS (soldierid, tripid)
values (831456, 823628);
insert into HASTRIPS (soldierid, tripid)
values (860716, 453631);
insert into HASTRIPS (soldierid, tripid)
values (440144, 315327);
insert into HASTRIPS (soldierid, tripid)
values (447423, 824118);
insert into HASTRIPS (soldierid, tripid)
values (261560, 411923);
insert into HASTRIPS (soldierid, tripid)
values (409531, 233266);
insert into HASTRIPS (soldierid, tripid)
values (104524, 415728);
insert into HASTRIPS (soldierid, tripid)
values (961833, 136786);
insert into HASTRIPS (soldierid, tripid)
values (905574, 472133);
insert into HASTRIPS (soldierid, tripid)
values (848823, 754527);
insert into HASTRIPS (soldierid, tripid)
values (815242, 936897);
insert into HASTRIPS (soldierid, tripid)
values (672620, 549457);
insert into HASTRIPS (soldierid, tripid)
values (333020, 925394);
insert into HASTRIPS (soldierid, tripid)
values (111677, 936897);
insert into HASTRIPS (soldierid, tripid)
values (326597, 646245);
insert into HASTRIPS (soldierid, tripid)
values (840081, 463991);
insert into HASTRIPS (soldierid, tripid)
values (253900, 715689);
insert into HASTRIPS (soldierid, tripid)
values (672620, 548977);
insert into HASTRIPS (soldierid, tripid)
values (460464, 778168);
insert into HASTRIPS (soldierid, tripid)
values (561065, 268652);
insert into HASTRIPS (soldierid, tripid)
values (327285, 699441);
insert into HASTRIPS (soldierid, tripid)
values (475943, 638961);
commit;
prompt 200 records committed...
insert into HASTRIPS (soldierid, tripid)
values (961833, 496265);
insert into HASTRIPS (soldierid, tripid)
values (840081, 379728);
insert into HASTRIPS (soldierid, tripid)
values (479374, 554538);
insert into HASTRIPS (soldierid, tripid)
values (223329, 755653);
insert into HASTRIPS (soldierid, tripid)
values (294589, 115294);
insert into HASTRIPS (soldierid, tripid)
values (278049, 797994);
insert into HASTRIPS (soldierid, tripid)
values (628314, 566952);
insert into HASTRIPS (soldierid, tripid)
values (155051, 643448);
insert into HASTRIPS (soldierid, tripid)
values (593954, 338353);
insert into HASTRIPS (soldierid, tripid)
values (613895, 646245);
insert into HASTRIPS (soldierid, tripid)
values (801207, 945913);
insert into HASTRIPS (soldierid, tripid)
values (673752, 275934);
insert into HASTRIPS (soldierid, tripid)
values (261560, 776913);
insert into HASTRIPS (soldierid, tripid)
values (201618, 329696);
insert into HASTRIPS (soldierid, tripid)
values (577026, 521664);
insert into HASTRIPS (soldierid, tripid)
values (686752, 524215);
insert into HASTRIPS (soldierid, tripid)
values (380172, 868752);
insert into HASTRIPS (soldierid, tripid)
values (261271, 548352);
insert into HASTRIPS (soldierid, tripid)
values (716113, 778921);
insert into HASTRIPS (soldierid, tripid)
values (569011, 864621);
insert into HASTRIPS (soldierid, tripid)
values (390576, 373239);
insert into HASTRIPS (soldierid, tripid)
values (586510, 773289);
insert into HASTRIPS (soldierid, tripid)
values (388238, 918987);
insert into HASTRIPS (soldierid, tripid)
values (904407, 146748);
insert into HASTRIPS (soldierid, tripid)
values (756210, 394421);
insert into HASTRIPS (soldierid, tripid)
values (104524, 667324);
insert into HASTRIPS (soldierid, tripid)
values (296574, 474981);
insert into HASTRIPS (soldierid, tripid)
values (887322, 937351);
insert into HASTRIPS (soldierid, tripid)
values (894953, 496265);
insert into HASTRIPS (soldierid, tripid)
values (388238, 754782);
insert into HASTRIPS (soldierid, tripid)
values (447423, 551767);
insert into HASTRIPS (soldierid, tripid)
values (177807, 492759);
insert into HASTRIPS (soldierid, tripid)
values (681635, 482111);
insert into HASTRIPS (soldierid, tripid)
values (394902, 914718);
insert into HASTRIPS (soldierid, tripid)
values (297322, 618482);
insert into HASTRIPS (soldierid, tripid)
values (443754, 574198);
insert into HASTRIPS (soldierid, tripid)
values (673752, 329696);
insert into HASTRIPS (soldierid, tripid)
values (591399, 888357);
insert into HASTRIPS (soldierid, tripid)
values (591819, 336553);
insert into HASTRIPS (soldierid, tripid)
values (801207, 538375);
insert into HASTRIPS (soldierid, tripid)
values (557849, 316874);
insert into HASTRIPS (soldierid, tripid)
values (981509, 268652);
insert into HASTRIPS (soldierid, tripid)
values (554170, 352724);
insert into HASTRIPS (soldierid, tripid)
values (755659, 364273);
insert into HASTRIPS (soldierid, tripid)
values (908516, 587957);
insert into HASTRIPS (soldierid, tripid)
values (360765, 664945);
insert into HASTRIPS (soldierid, tripid)
values (244546, 316427);
insert into HASTRIPS (soldierid, tripid)
values (609389, 328782);
insert into HASTRIPS (soldierid, tripid)
values (459990, 452278);
insert into HASTRIPS (soldierid, tripid)
values (235449, 415728);
insert into HASTRIPS (soldierid, tripid)
values (126042, 274665);
insert into HASTRIPS (soldierid, tripid)
values (552414, 456338);
insert into HASTRIPS (soldierid, tripid)
values (905574, 139356);
insert into HASTRIPS (soldierid, tripid)
values (277150, 234164);
insert into HASTRIPS (soldierid, tripid)
values (411649, 559718);
insert into HASTRIPS (soldierid, tripid)
values (724219, 868379);
insert into HASTRIPS (soldierid, tripid)
values (442084, 855113);
insert into HASTRIPS (soldierid, tripid)
values (938809, 744936);
insert into HASTRIPS (soldierid, tripid)
values (201618, 467815);
insert into HASTRIPS (soldierid, tripid)
values (831379, 354667);
insert into HASTRIPS (soldierid, tripid)
values (838212, 185167);
insert into HASTRIPS (soldierid, tripid)
values (361200, 399278);
insert into HASTRIPS (soldierid, tripid)
values (208026, 566952);
insert into HASTRIPS (soldierid, tripid)
values (808089, 918987);
insert into HASTRIPS (soldierid, tripid)
values (636674, 816797);
insert into HASTRIPS (soldierid, tripid)
values (223329, 612346);
insert into HASTRIPS (soldierid, tripid)
values (628314, 364273);
insert into HASTRIPS (soldierid, tripid)
values (958031, 574198);
insert into HASTRIPS (soldierid, tripid)
values (162853, 644868);
insert into HASTRIPS (soldierid, tripid)
values (588081, 734962);
insert into HASTRIPS (soldierid, tripid)
values (719462, 245615);
insert into HASTRIPS (soldierid, tripid)
values (569743, 549559);
insert into HASTRIPS (soldierid, tripid)
values (548719, 515554);
insert into HASTRIPS (soldierid, tripid)
values (884511, 961751);
insert into HASTRIPS (soldierid, tripid)
values (964844, 968797);
insert into HASTRIPS (soldierid, tripid)
values (244664, 967651);
insert into HASTRIPS (soldierid, tripid)
values (471300, 877262);
insert into HASTRIPS (soldierid, tripid)
values (682840, 925394);
insert into HASTRIPS (soldierid, tripid)
values (561065, 659315);
insert into HASTRIPS (soldierid, tripid)
values (355186, 247973);
insert into HASTRIPS (soldierid, tripid)
values (109331, 453631);
insert into HASTRIPS (soldierid, tripid)
values (413001, 241244);
insert into HASTRIPS (soldierid, tripid)
values (795399, 587829);
insert into HASTRIPS (soldierid, tripid)
values (270239, 555885);
insert into HASTRIPS (soldierid, tripid)
values (312279, 754527);
insert into HASTRIPS (soldierid, tripid)
values (743203, 118619);
insert into HASTRIPS (soldierid, tripid)
values (601668, 872652);
insert into HASTRIPS (soldierid, tripid)
values (907942, 278996);
insert into HASTRIPS (soldierid, tripid)
values (772498, 868752);
insert into HASTRIPS (soldierid, tripid)
values (460464, 536313);
insert into HASTRIPS (soldierid, tripid)
values (548719, 825152);
insert into HASTRIPS (soldierid, tripid)
values (192335, 433691);
insert into HASTRIPS (soldierid, tripid)
values (682840, 566952);
insert into HASTRIPS (soldierid, tripid)
values (833922, 743716);
insert into HASTRIPS (soldierid, tripid)
values (548719, 228132);
insert into HASTRIPS (soldierid, tripid)
values (444711, 714719);
insert into HASTRIPS (soldierid, tripid)
values (221490, 663612);
insert into HASTRIPS (soldierid, tripid)
values (435484, 255392);
insert into HASTRIPS (soldierid, tripid)
values (958031, 612346);
insert into HASTRIPS (soldierid, tripid)
values (912112, 361332);
commit;
prompt 300 records committed...
insert into HASTRIPS (soldierid, tripid)
values (780542, 458686);
insert into HASTRIPS (soldierid, tripid)
values (895583, 379728);
insert into HASTRIPS (soldierid, tripid)
values (855354, 289943);
insert into HASTRIPS (soldierid, tripid)
values (475298, 639184);
insert into HASTRIPS (soldierid, tripid)
values (726404, 551767);
insert into HASTRIPS (soldierid, tripid)
values (669976, 471996);
insert into HASTRIPS (soldierid, tripid)
values (535461, 328782);
insert into HASTRIPS (soldierid, tripid)
values (373280, 772169);
insert into HASTRIPS (soldierid, tripid)
values (773963, 586415);
insert into HASTRIPS (soldierid, tripid)
values (345377, 324161);
insert into HASTRIPS (soldierid, tripid)
values (297345, 967651);
insert into HASTRIPS (soldierid, tripid)
values (355186, 862461);
insert into HASTRIPS (soldierid, tripid)
values (224328, 547221);
insert into HASTRIPS (soldierid, tripid)
values (961379, 124673);
insert into HASTRIPS (soldierid, tripid)
values (307338, 549559);
insert into HASTRIPS (soldierid, tripid)
values (259018, 637627);
insert into HASTRIPS (soldierid, tripid)
values (461672, 874326);
insert into HASTRIPS (soldierid, tripid)
values (485069, 283946);
insert into HASTRIPS (soldierid, tripid)
values (436580, 363263);
insert into HASTRIPS (soldierid, tripid)
values (668082, 118619);
insert into HASTRIPS (soldierid, tripid)
values (429637, 228132);
insert into HASTRIPS (soldierid, tripid)
values (308204, 593692);
insert into HASTRIPS (soldierid, tripid)
values (756301, 362115);
insert into HASTRIPS (soldierid, tripid)
values (175164, 799243);
insert into HASTRIPS (soldierid, tripid)
values (623578, 291446);
insert into HASTRIPS (soldierid, tripid)
values (797118, 874629);
insert into HASTRIPS (soldierid, tripid)
values (959939, 937351);
insert into HASTRIPS (soldierid, tripid)
values (907942, 188327);
insert into HASTRIPS (soldierid, tripid)
values (357713, 157132);
insert into HASTRIPS (soldierid, tripid)
values (155952, 255392);
insert into HASTRIPS (soldierid, tripid)
values (561065, 139798);
insert into HASTRIPS (soldierid, tripid)
values (309024, 394521);
insert into HASTRIPS (soldierid, tripid)
values (628314, 894184);
insert into HASTRIPS (soldierid, tripid)
values (216942, 887319);
insert into HASTRIPS (soldierid, tripid)
values (912112, 612267);
insert into HASTRIPS (soldierid, tripid)
values (586510, 643448);
insert into HASTRIPS (soldierid, tripid)
values (862158, 662718);
insert into HASTRIPS (soldierid, tripid)
values (541094, 455459);
insert into HASTRIPS (soldierid, tripid)
values (738920, 392971);
insert into HASTRIPS (soldierid, tripid)
values (333020, 185167);
insert into HASTRIPS (soldierid, tripid)
values (460464, 467815);
insert into HASTRIPS (soldierid, tripid)
values (291468, 241244);
insert into HASTRIPS (soldierid, tripid)
values (369909, 923358);
insert into HASTRIPS (soldierid, tripid)
values (126042, 156374);
insert into HASTRIPS (soldierid, tripid)
values (388238, 637627);
insert into HASTRIPS (soldierid, tripid)
values (938809, 612346);
insert into HASTRIPS (soldierid, tripid)
values (544948, 637764);
insert into HASTRIPS (soldierid, tripid)
values (873867, 245615);
insert into HASTRIPS (soldierid, tripid)
values (876301, 488251);
insert into HASTRIPS (soldierid, tripid)
values (743551, 346433);
insert into HASTRIPS (soldierid, tripid)
values (175164, 962746);
insert into HASTRIPS (soldierid, tripid)
values (182637, 991821);
insert into HASTRIPS (soldierid, tripid)
values (157256, 864464);
insert into HASTRIPS (soldierid, tripid)
values (511000, 498149);
insert into HASTRIPS (soldierid, tripid)
values (860716, 362956);
insert into HASTRIPS (soldierid, tripid)
values (160706, 285268);
insert into HASTRIPS (soldierid, tripid)
values (512844, 289943);
insert into HASTRIPS (soldierid, tripid)
values (569011, 234164);
insert into HASTRIPS (soldierid, tripid)
values (904407, 848793);
insert into HASTRIPS (soldierid, tripid)
values (801685, 871526);
insert into HASTRIPS (soldierid, tripid)
values (512844, 643448);
insert into HASTRIPS (soldierid, tripid)
values (823287, 363263);
insert into HASTRIPS (soldierid, tripid)
values (310213, 415728);
insert into HASTRIPS (soldierid, tripid)
values (333020, 755653);
insert into HASTRIPS (soldierid, tripid)
values (826275, 316427);
insert into HASTRIPS (soldierid, tripid)
values (876809, 935241);
insert into HASTRIPS (soldierid, tripid)
values (715495, 923358);
insert into HASTRIPS (soldierid, tripid)
values (724219, 781191);
insert into HASTRIPS (soldierid, tripid)
values (478332, 455116);
insert into HASTRIPS (soldierid, tripid)
values (788858, 181788);
insert into HASTRIPS (soldierid, tripid)
values (266803, 856314);
insert into HASTRIPS (soldierid, tripid)
values (569743, 258412);
insert into HASTRIPS (soldierid, tripid)
values (606688, 444672);
insert into HASTRIPS (soldierid, tripid)
values (666601, 954982);
insert into HASTRIPS (soldierid, tripid)
values (380172, 739166);
insert into HASTRIPS (soldierid, tripid)
values (239891, 891446);
insert into HASTRIPS (soldierid, tripid)
values (297322, 392971);
insert into HASTRIPS (soldierid, tripid)
values (333934, 594169);
insert into HASTRIPS (soldierid, tripid)
values (202948, 175612);
insert into HASTRIPS (soldierid, tripid)
values (758228, 382296);
insert into HASTRIPS (soldierid, tripid)
values (959171, 952646);
insert into HASTRIPS (soldierid, tripid)
values (408297, 755675);
insert into HASTRIPS (soldierid, tripid)
values (436580, 923358);
insert into HASTRIPS (soldierid, tripid)
values (477362, 638961);
insert into HASTRIPS (soldierid, tripid)
values (111677, 612992);
insert into HASTRIPS (soldierid, tripid)
values (584529, 622146);
insert into HASTRIPS (soldierid, tripid)
values (958031, 135352);
insert into HASTRIPS (soldierid, tripid)
values (826275, 278727);
insert into HASTRIPS (soldierid, tripid)
values (643759, 777176);
insert into HASTRIPS (soldierid, tripid)
values (531874, 189626);
insert into HASTRIPS (soldierid, tripid)
values (823287, 734962);
insert into HASTRIPS (soldierid, tripid)
values (855354, 361336);
insert into HASTRIPS (soldierid, tripid)
values (726404, 316874);
insert into HASTRIPS (soldierid, tripid)
values (449775, 549457);
insert into HASTRIPS (soldierid, tripid)
values (859561, 419688);
insert into HASTRIPS (soldierid, tripid)
values (853031, 163229);
insert into HASTRIPS (soldierid, tripid)
values (130245, 189626);
insert into HASTRIPS (soldierid, tripid)
values (718556, 913788);
insert into HASTRIPS (soldierid, tripid)
values (654041, 553632);
insert into HASTRIPS (soldierid, tripid)
values (177807, 819772);
commit;
prompt 400 records committed...
insert into HASTRIPS (soldierid, tripid)
values (513590, 725426);
insert into HASTRIPS (soldierid, tripid)
values (390576, 612267);
insert into HASTRIPS (soldierid, tripid)
values (838212, 687399);
insert into HASTRIPS (soldierid, tripid)
values (428852, 449856);
insert into HASTRIPS (soldierid, tripid)
values (589388, 755155);
insert into HASTRIPS (soldierid, tripid)
values (895583, 932277);
insert into HASTRIPS (soldierid, tripid)
values (591399, 781931);
insert into HASTRIPS (soldierid, tripid)
values (335094, 856341);
insert into HASTRIPS (soldierid, tripid)
values (606688, 541113);
insert into HASTRIPS (soldierid, tripid)
values (757015, 594169);
insert into HASTRIPS (soldierid, tripid)
values (548719, 272721);
insert into HASTRIPS (soldierid, tripid)
values (444711, 351142);
insert into HASTRIPS (soldierid, tripid)
values (788858, 757698);
insert into HASTRIPS (soldierid, tripid)
values (583667, 373239);
insert into HASTRIPS (soldierid, tripid)
values (775055, 419426);
insert into HASTRIPS (soldierid, tripid)
values (259018, 391463);
insert into HASTRIPS (soldierid, tripid)
values (958031, 371524);
insert into HASTRIPS (soldierid, tripid)
values (201485, 991821);
insert into HASTRIPS (soldierid, tripid)
values (761104, 553632);
insert into HASTRIPS (soldierid, tripid)
values (788430, 672466);
insert into HASTRIPS (soldierid, tripid)
values (475353, 474981);
insert into HASTRIPS (soldierid, tripid)
values (747321, 864621);
insert into HASTRIPS (soldierid, tripid)
values (561065, 467815);
insert into HASTRIPS (soldierid, tripid)
values (540806, 271818);
insert into HASTRIPS (soldierid, tripid)
values (155952, 349748);
insert into HASTRIPS (soldierid, tripid)
values (331283, 562371);
insert into HASTRIPS (soldierid, tripid)
values (459990, 966877);
insert into HASTRIPS (soldierid, tripid)
values (360765, 925394);
insert into HASTRIPS (soldierid, tripid)
values (967520, 982446);
insert into HASTRIPS (soldierid, tripid)
values (464468, 831943);
insert into HASTRIPS (soldierid, tripid)
values (895688, 349748);
insert into HASTRIPS (soldierid, tripid)
values (889409, 239876);
insert into HASTRIPS (soldierid, tripid)
values (396576, 539896);
insert into HASTRIPS (soldierid, tripid)
values (454615, 682878);
insert into HASTRIPS (soldierid, tripid)
values (953250, 474981);
insert into HASTRIPS (soldierid, tripid)
values (855891, 799243);
insert into HASTRIPS (soldierid, tripid)
values (436580, 775684);
insert into HASTRIPS (soldierid, tripid)
values (694056, 483597);
insert into HASTRIPS (soldierid, tripid)
values (544948, 511247);
insert into HASTRIPS (soldierid, tripid)
values (406655, 755675);
insert into HASTRIPS (soldierid, tripid)
values (116436, 342651);
insert into HASTRIPS (soldierid, tripid)
values (470454, 462143);
insert into HASTRIPS (soldierid, tripid)
values (333020, 135352);
insert into HASTRIPS (soldierid, tripid)
values (756301, 458686);
insert into HASTRIPS (soldierid, tripid)
values (644535, 498527);
insert into HASTRIPS (soldierid, tripid)
values (808089, 245615);
insert into HASTRIPS (soldierid, tripid)
values (126042, 778921);
insert into HASTRIPS (soldierid, tripid)
values (223329, 136168);
insert into HASTRIPS (soldierid, tripid)
values (895688, 528234);
insert into HASTRIPS (soldierid, tripid)
values (155332, 467923);
insert into HASTRIPS (soldierid, tripid)
values (203649, 653742);
insert into HASTRIPS (soldierid, tripid)
values (673839, 774855);
insert into HASTRIPS (soldierid, tripid)
values (611570, 426397);
insert into HASTRIPS (soldierid, tripid)
values (544948, 398319);
insert into HASTRIPS (soldierid, tripid)
values (211880, 991821);
insert into HASTRIPS (soldierid, tripid)
values (372614, 554538);
insert into HASTRIPS (soldierid, tripid)
values (857812, 637627);
insert into HASTRIPS (soldierid, tripid)
values (182415, 346433);
insert into HASTRIPS (soldierid, tripid)
values (184598, 778921);
insert into HASTRIPS (soldierid, tripid)
values (167083, 285268);
insert into HASTRIPS (soldierid, tripid)
values (651520, 218736);
insert into HASTRIPS (soldierid, tripid)
values (208026, 975886);
insert into HASTRIPS (soldierid, tripid)
values (934824, 962746);
insert into HASTRIPS (soldierid, tripid)
values (584529, 361332);
insert into HASTRIPS (soldierid, tripid)
values (672620, 891446);
insert into HASTRIPS (soldierid, tripid)
values (543413, 139798);
insert into HASTRIPS (soldierid, tripid)
values (225335, 474981);
insert into HASTRIPS (soldierid, tripid)
values (428852, 555885);
insert into HASTRIPS (soldierid, tripid)
values (384076, 493516);
insert into HASTRIPS (soldierid, tripid)
values (853031, 451333);
insert into HASTRIPS (soldierid, tripid)
values (873867, 975261);
insert into HASTRIPS (soldierid, tripid)
values (641147, 454657);
insert into HASTRIPS (soldierid, tripid)
values (588081, 399278);
insert into HASTRIPS (soldierid, tripid)
values (668082, 683962);
insert into HASTRIPS (soldierid, tripid)
values (361922, 555885);
insert into HASTRIPS (soldierid, tripid)
values (900955, 868216);
insert into HASTRIPS (soldierid, tripid)
values (170823, 386688);
insert into HASTRIPS (soldierid, tripid)
values (831456, 214238);
insert into HASTRIPS (soldierid, tripid)
values (331126, 451374);
insert into HASTRIPS (soldierid, tripid)
values (445250, 644564);
insert into HASTRIPS (soldierid, tripid)
values (161141, 612267);
insert into HASTRIPS (soldierid, tripid)
values (554170, 674388);
insert into HASTRIPS (soldierid, tripid)
values (390576, 387365);
insert into HASTRIPS (soldierid, tripid)
values (461672, 613311);
insert into HASTRIPS (soldierid, tripid)
values (931157, 986681);
insert into HASTRIPS (soldierid, tripid)
values (435484, 576756);
insert into HASTRIPS (soldierid, tripid)
values (111613, 553632);
insert into HASTRIPS (soldierid, tripid)
values (224328, 328581);
insert into HASTRIPS (soldierid, tripid)
values (672620, 319331);
insert into HASTRIPS (soldierid, tripid)
values (848331, 411923);
insert into HASTRIPS (soldierid, tripid)
values (544948, 969976);
insert into HASTRIPS (soldierid, tripid)
values (967520, 864464);
insert into HASTRIPS (soldierid, tripid)
values (223329, 286159);
insert into HASTRIPS (soldierid, tripid)
values (278049, 253793);
insert into HASTRIPS (soldierid, tripid)
values (470454, 692992);
insert into HASTRIPS (soldierid, tripid)
values (721870, 966164);
insert into HASTRIPS (soldierid, tripid)
values (359971, 146748);
insert into HASTRIPS (soldierid, tripid)
values (440144, 273356);
insert into HASTRIPS (soldierid, tripid)
values (296574, 636315);
commit;
prompt 499 records loaded
prompt Loading MAINTENANCERECORD...
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (256484, to_date('25-07-1977', 'dd-mm-yyyy'), 'Utmcitiwidbjzgcsgwzbxbkdfkwnqtiybappgmvenuwnsohqifikftmmvwmwpofpjnzxfagqckmdcshufchozcy', 269282);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (313727, to_date('15-08-2003', 'dd-mm-yyyy'), 'Wltwqlgccanrnilxwspwjqteuokmxiijsrqxugrxevkprzxmgbkhkhdnysgfeyiafswzyisorhsmsdmwoumhzor', 485274);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (514327, to_date('13-02-2010', 'dd-mm-yyyy'), 'Qxxdpeesbnbzxdgyhbibzxicsbctqufjakesxnokpiyvowuqtgrxzxwnosnzgmfswkgkpvwruhzthfbubqrgpma', 334896);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (532129, to_date('11-08-1982', 'dd-mm-yyyy'), 'Fswllzwvtmiljywjjxzuyqfavefesrhvwvvxqxjrcyyujlwactdefljoexowxwbnolmkhuvcmshphvrglacuzbg', 814835);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (411752, to_date('27-11-1980', 'dd-mm-yyyy'), 'Txnckfrsewqduueffrtadnzagundkkuzwhwfcvcjnoayjprsavafprkrcdjtwnichxdjlxiadbitriouurobcvz', 269578);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (831538, to_date('21-06-1985', 'dd-mm-yyyy'), 'Riruizwavneljbremotbdkvbhhkhuuehdffdzapntqypbhiyfgkyewektazimbqbkdaijpnuswtgwfcivxsozpr', 632974);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (287517, to_date('31-03-1977', 'dd-mm-yyyy'), 'Jriihpjngmaeilwqxminzolunbbnqywrbqwbvbvaavlayaoshvklfaxmxtmtvukhajwaoeabrgvmrotchuywzrf', 325119);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (853842, to_date('25-07-2013', 'dd-mm-yyyy'), 'Yjfisxnuamfkyhpcpptsxxxgycogpgfotbafkevqxfcwbzjoaenknkhqebxkbjrjtjbmdkyvggdhshredygqjul', 814785);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (965452, to_date('08-01-1970', 'dd-mm-yyyy'), 'Ganwaspxgaomgdyafvylcwdhpqfdfolfgpumrtmwpuresueofxgbhhitxmypjzeavqqgfnpddpqcfilzwfdltnd', 947427);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (195589, to_date('15-08-2013', 'dd-mm-yyyy'), 'Slhmykfkcxzfcqvntbsuhzkechbbhzvaixqyuyqdjsbqvkmpxxfptkiuqkmmkreymcvqgmmwpxjtyhvbdsrzhjr', 325119);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (293123, to_date('08-04-2023', 'dd-mm-yyyy'), 'Wkgbgiqcltsbzworttyalufkoedbwpjjnzsnpjxsqsytjzazuskeopgjqqzziyjtytajocxfzrepkovepqyczhs', 251756);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (351661, to_date('30-01-2013', 'dd-mm-yyyy'), 'Xmyzwbpahwxrfhtptzurtmztzwsuhlxvrwinfdkrmnvivtqmpabzdveobxsgobcbkbjvrxkhyxzwbcbyvdyigzp', 313613);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (267263, to_date('24-05-1986', 'dd-mm-yyyy'), 'Mnlehmoxdszbqegybucqldvptbwjyfpbousmmyhonojysvqzgdayiumtebrgwoatffusfjnmrzqowiiskvhibha', 169942);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (536274, to_date('04-03-1973', 'dd-mm-yyyy'), 'Swecvlaqcuhcbojysyyrxzssypthcfaydjdfnjfdgzpysygsipzfiqcvfhbzcmdkbyyecjjofiqewzsiwsqhbuo', 698952);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (157945, to_date('08-06-1973', 'dd-mm-yyyy'), 'Snksgmatppxardecglywsbjgtbwazidqwixudhftzmseadwfjenylzngnefvdkpcfgcttsvvnerdttbieaaiyep', 783324);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (672993, to_date('13-10-1970', 'dd-mm-yyyy'), 'Kyybolqehbprwexjjvtnvxnevuojzxtfuoykhuppppwqzlsgqydplipatqskcjtsejrcjurtfephxmluauvfmpr', 182726);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (628844, to_date('06-09-1986', 'dd-mm-yyyy'), 'Rydlqnssknxuluekuxehunlomubrbrbqzzemxrdcpaztvrdftgnyfjwtrinsqobchsmwgabyoeshcetmxkwbwcf', 497197);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (255684, to_date('10-05-1973', 'dd-mm-yyyy'), 'Exbpoobrxsnkovvkbdirxndejurekefnnvmonanqksonbrxdwbmdllbtymztqvarvuxcmllvjitotcjxzbwzsiv', 399221);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (357621, to_date('05-05-1990', 'dd-mm-yyyy'), 'Rcewmbzbomptdypanqbxlohmmzbizgcslhdhmwgyizuaxjqkngvqmsaohmwzlncgsrnsoiiwdtjeocovkgvonvn', 724245);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (177151, to_date('07-02-1980', 'dd-mm-yyyy'), 'Wdovertuydkyuaqsijjdsokivijpxrjkhbjgeljpnxdimcxkvnjqqfxkffqsxufvauuvvzifdjsqwwcxxtduksp', 299345);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (495446, to_date('22-02-2011', 'dd-mm-yyyy'), 'Ihkncqapnstrbphyjxvvyousnygjjuwryctlltwcxjodcinmzzhpyguiuaaoinozmfpqyskpdnsvkrvevapumcp', 469673);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (795839, to_date('08-10-2007', 'dd-mm-yyyy'), 'Auenhhrbumukdvkmvytwyxduvocktpqiqrgwrzgyfqdddldvrkngrhbkkalphnxrxwpxfdqpiuuummpijdppujb', 192413);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (721437, to_date('04-03-1987', 'dd-mm-yyyy'), 'Xmayqpplgnpdommpnwbyodotbjtekcbijhvzxnzvrabzydbuaobhtvcietrmotnklrwamvoogxshvzcymiycnbu', 575682);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (835819, to_date('16-12-1988', 'dd-mm-yyyy'), 'Dpjsewofvvhohiitxqgmqadgoyzdkqyzbkmvklxriazaoaaekkzlzipscbcapbtbqmoriidihvvzwqpzgqkmwgz', 323711);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (546116, to_date('03-06-2020', 'dd-mm-yyyy'), 'Jnomsjprfnyotglfuijygxldjlnmltxsagjogtbddhprebvrmkrhhkmwofuibwuzflvmqljfnjptlwrlfkrpflq', 396365);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (971918, to_date('05-11-1996', 'dd-mm-yyyy'), 'Glsvjdccvrbkbgnbofdpknxdpecuvemprhrlpyhmxjeyxuentbmupokxawhylltabryschftqgbtkqevlkkpmwh', 823497);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (226225, to_date('04-09-2020', 'dd-mm-yyyy'), 'Xvqgvcgxvhpoaqwecpeunurtkmzyndknvbkgbgyengkbkmycuwlpbokthuwqxopjqllptojnneklguwdsnpswhf', 919592);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (792654, to_date('12-06-1970', 'dd-mm-yyyy'), 'Noklahmoihszcjgbtxncdqxkrtcyekrbhcwhgdvlrbsfyflipxlsweochlgvjxaogdoazxuwjzdzjvxbsklhxgz', 484578);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (758362, to_date('16-09-1980', 'dd-mm-yyyy'), 'Wiurybgytbbetjuzzinlbfweltqeiuuuqpqeneviwczbskhyjxswgvbpgwfywkbfemmpkdmgyqlfwldzwhrxmvv', 142314);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (745845, to_date('12-05-2006', 'dd-mm-yyyy'), 'Xbqneoscntpvdtyodplnhlhkswgsudmbalzetzuphwrkptyoietqlbfagokptbketxriuadbczggjxzpkqttknt', 987433);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (663187, to_date('02-06-2014', 'dd-mm-yyyy'), 'Odkfdkdqoxpqilwbsclhzxeysfwjpmnthblhakbdiahsiydtpzpmrgmzsuarqymtbiyxvdrnoemgwcwdmplqoli', 979728);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (558249, to_date('07-02-1988', 'dd-mm-yyyy'), 'Ydrgissbsrlrujiwudjwlrbocsavibbnwjrgbctoocjdnadrvzneulkjlbetrkgerevewupsahvhowfovygbvmi', 262276);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (343142, to_date('19-05-1994', 'dd-mm-yyyy'), 'Ezomuuwhdavdkswjlzoqvaxkktmekjyvbxdwhewiwokxrmroawzqcbbuydjwdhcrcczfgpmaxptfjfwxqswczwp', 395638);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (761977, to_date('08-07-2014', 'dd-mm-yyyy'), 'Jftwmwxwgqbrnnbuqjemtbsokzjqglsemcocspfkopacsjwrcyksfjchfauhdslzrdtppmwwcnmyzvfnvvezbjs', 497395);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (541338, to_date('27-07-2001', 'dd-mm-yyyy'), 'Zwizuzynjrhmhyzofmfshqzrbozoxpyrrznmtjycitbbhquakwzsfgpfklsnrthbkeebcivullehcmdoqyrmydb', 935292);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (387315, to_date('11-03-2024', 'dd-mm-yyyy'), 'Tjrkzbfjzvlefagwwftqtejqolcognddooweyihwkwdvakdwkjntvhxdhkbsrvfucvjajjuabhoastsvjbqumdp', 712238);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (474997, to_date('15-02-2015', 'dd-mm-yyyy'), 'Xtutgyaradejznnzntcpdcegypjfioxjmpzywbxzmdvuanihpidavmnlarrnbujqkorwnpanmwbwswvjrqssrat', 814785);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (582752, to_date('27-03-1972', 'dd-mm-yyyy'), 'Vnhbpqvczoiwcuuujkxbpfmdpimzbjzynpeckhsjbswpsflbuggjtqjkhahhgjuftmlpsioqfizzpeboqtlpivm', 954969);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (152675, to_date('10-05-1971', 'dd-mm-yyyy'), 'Buvadzfiiwjnafbwfdhcntkhszbmcpdetmjqgxellicqbtkaebhoulqsfapnwnptqyqtfidvntkpvyzwmldxvbq', 299345);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (524258, to_date('11-04-1996', 'dd-mm-yyyy'), 'Fdrgpbdsxsflchgurlvcbyjarkabhaqrdurtgvlfssszavsaribkrfggrbjwgqmfbdgplgmqqwcembabenkidov', 531298);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (237568, to_date('27-02-2004', 'dd-mm-yyyy'), 'Hnybgtxqtuzbpzznlnmnyqufmppnxesajdvgblgjypoijdyfbasllcmuvbxctzjfclsikqnkjeqjyyosubwrwgb', 977788);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (718794, to_date('06-01-1991', 'dd-mm-yyyy'), 'Jibmeodvmwzuphpvgxyqyfoslctklayribpbztpbnzcgixpcuuctolgpxqonhuolpqsonfizqxesuprywbxcboj', 632189);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (366426, to_date('09-04-1992', 'dd-mm-yyyy'), 'Ghlcdvbodaqfobsxiqmtomjrkodpwwiwzdeixhlcxbuwtdanoyccegtrpyxnmafouoqehukqnfshsvtbhhcjacl', 714841);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (684133, to_date('26-08-2020', 'dd-mm-yyyy'), 'Lhpyhooyrbcmbozqjksyafffuomvktzrsgxjjeeaikowjzeunfzfnbdtupryegpbwyujfsroqglhwdzvwhntkvw', 726562);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (351455, to_date('09-01-1985', 'dd-mm-yyyy'), 'Cpvgpmtmlhcvxuwwtaqipcysqtbohetfkxuwzayinujypupdbvkcxewkdeteujbjybzxoncmnkgczchztlhdfdd', 235824);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (759157, to_date('18-06-2017', 'dd-mm-yyyy'), 'Sboxfpwbkfdsugmlnghdkbojivkvltrhztfkiqurdfvrqkdftibfljziywikxquzygbpkieazgatjdvhpjqbnca', 766499);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (324599, to_date('21-12-1994', 'dd-mm-yyyy'), 'Fdklagpudtwblxvxztdhqooglzdrvhfktamzminodnpzehoddzuldzdhmeyuwuozzzcmbsjiiuzszsduducvczo', 842346);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (848395, to_date('16-11-2016', 'dd-mm-yyyy'), 'Zygmbhcszyokvzmascqcmlkqjmhbkentseaecyxellbisxckhnwkqjqkrtirdodncuighectofabokdeiqsbvks', 293134);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (481839, to_date('19-06-2011', 'dd-mm-yyyy'), 'Dlmafnkimjwoygzhzgehnxlljhcmlmyairpabzlxstybgnxocxlptxqdryxcpyboneyyecjtyrgmdtjwnsjpcco', 845557);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (927728, to_date('29-01-1997', 'dd-mm-yyyy'), 'Fuvzllpqkyclbwfhlzplameabgqfkexlbyctzdmadocmklvkowasodygfxeyyivwdmxvycypszqgpbllshwvuvo', 782739);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (245625, to_date('06-10-2023', 'dd-mm-yyyy'), 'Msrskpnnvsnstbqmtkcszfujhnhkdplnyhkogdbakfslcpfhqmvlaeqbckprhwvjrhhvspwlmaiulltvesqogwm', 594746);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (674212, to_date('27-09-1988', 'dd-mm-yyyy'), 'Dynrqrxocknfxbfbzidnesmxauyvsmdpivtplpweoytpwfvbivxbsvbyzqfpdqqeegyuhqhdrdmutjtmehiqhum', 129215);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (173337, to_date('19-12-2021', 'dd-mm-yyyy'), 'Oozgqtjslnjyjsytcpbwglhocitlucdwgiowjwbrnnkfawoxpolaqfnamzxxhkbnqxkgsgmodghvuiuwrqmnhhj', 491965);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (167312, to_date('01-03-2022', 'dd-mm-yyyy'), 'Idptxiaaqrribujkowfbgirghewwxmgjgckrnktrcwxivjbehunyfobfylxotlrwnufaxwpybyjfscrzvylqnpo', 798987);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (711248, to_date('28-06-1986', 'dd-mm-yyyy'), 'Cvknozlfyknulutjsgttnlrwbquuoerevgeruwltkatdqyilmbrvvktcwwpauxkhvggtcvxxoqeqwqycjfcyqzm', 977485);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (531931, to_date('02-05-1994', 'dd-mm-yyyy'), 'Pzqtrsfrvhwwtkyapnyhcswgrvtgtszpdirrbpodhaghgapdffzpbuwdzjyofiiuyxzagrnmmtfieqbbhvifilz', 911472);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (115824, to_date('27-12-2002', 'dd-mm-yyyy'), 'Ccuovmqwqdbakvpgubsnhgyiyqryoyvxxqfwxpxococxjtpwmxkjavneobhomuozuqmpejxrfmqxltofpdmdlyd', 951887);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (517785, to_date('08-05-1972', 'dd-mm-yyyy'), 'Ekfybmgumxezamywhrcplrdrcozjolazmulatnkogxnadoqdpnflhqutluocdjplqangrbwzppthzknhkduwdia', 933449);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (742543, to_date('26-07-2010', 'dd-mm-yyyy'), 'Vwmogetjubbttecksotisupskvvsqghfvctrqagmlmbwchemyptdakjokarldiwbmzocfidlfteyntreaquttok', 954969);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (959333, to_date('15-07-1972', 'dd-mm-yyyy'), 'Oerxavqyhhynkuxademqobhmarnnpzqggpbxqixdxpibciwejanhaeyivkuwinuiatpzdskevydkmavmzmxarhg', 645986);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (158289, to_date('01-09-1972', 'dd-mm-yyyy'), 'Syamqucwmkzzumlstowhgywkxbfpietpcjbmswpjiudjinqlgutaokgxvgsxasemvyxzepkkcvqeroiutrbcvoz', 762345);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (969954, to_date('17-01-2017', 'dd-mm-yyyy'), 'Snnxbehxvaerfgcujkoadcxrdpvrvxudckirldgjxhgeqfcuuvwglobzwjomavvxkbsglpuijbfvnjculdnryqp', 666262);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (161817, to_date('31-01-1973', 'dd-mm-yyyy'), 'Nhokxbkghelahhgctsvnldbbldojxlumdgkijynyvunjyjcqguygfgpcjarkwcushtotohegsbitcjvumuyhuci', 399844);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (391769, to_date('24-12-1986', 'dd-mm-yyyy'), 'Sebmdubsorevktbbcdsqmmfnjksatvaodojzgruugouxiwjfrmmlatqpwsfqodnmbuumbfqetiwmhdggcmvegod', 325135);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (559119, to_date('18-10-2016', 'dd-mm-yyyy'), 'Tbuhrxslxmxvkwcxznnnbwaegycvizkmsiauvitsfwlklhfsvnravvtsuytaltpbjlqzqchnlkbvhrrbxiowqgo', 531838);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (121145, to_date('05-03-1994', 'dd-mm-yyyy'), 'Joogpgjpphnzpsvmnenjjcrrtoikcbgqhrkccgkgjnspthjoyciwthuoozfmmjsrxxdzyrwgvfngoqrpczkkftp', 242996);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (426991, to_date('11-12-1991', 'dd-mm-yyyy'), 'Ykclhmaqurokkujvcavaxrkimqeeptborcwoayhungzyppxulyfwxdtpeaivflygvnkfskvvhldsnkseucpeljp', 226257);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (922379, to_date('27-04-1995', 'dd-mm-yyyy'), 'Ghhuqlvnjjwwfvfglexasfbjydgfnergcsdpqzerjitfbihwtlagtmtulbznfphxdqzhmoebacakvwiwcgcvcaz', 241979);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (268232, to_date('09-06-1970', 'dd-mm-yyyy'), 'Zmjvxybnxvwcxekjnecbwbgcbzxaiobixycxhixtwmefjrxyamiwhkdjtzkcqzqdfftmvndiczzeqaowphbrsnf', 924264);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (869575, to_date('20-04-1985', 'dd-mm-yyyy'), 'Thpfcuvipdqkitwmkjphtjgrsgmpgqwlxlhchbcqubzbvzwxekfvohzfvqmvzhdrqzfwwgtvzhtujvsfgtqjpfn', 182968);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (988591, to_date('23-01-1984', 'dd-mm-yyyy'), 'Olgbwqqpggvcuhxdubjghrmidwlzqcpevekgfrgdtmahpqdvdjfdxngixdeqrblwhdpbveufwmtxaannukfcjfh', 939731);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (334849, to_date('01-10-2003', 'dd-mm-yyyy'), 'Ityzknjqirwhwhrkalteuqvebaqvqzrfodqpbytyjthkhwpgbtkxplraeemtsttppmqnnlynwiegnriskoteqkd', 896965);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (361885, to_date('06-01-1982', 'dd-mm-yyyy'), 'Hnxusdkpxtgxohubrxtoruztgwnhhzhyzinhcwwqiowsjlsqgigzbvlfoyxepmngrdptootaqhcshfiosodnzcw', 465979);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (713689, to_date('21-01-2020', 'dd-mm-yyyy'), 'Hmalezuvzomnyibtxpkmeyxdfqdrflcprtbmxcwrtkffjzrllosngodbvovtqlexualetrzsuezxtcbfqnlllfo', 299532);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (572742, to_date('04-03-1996', 'dd-mm-yyyy'), 'Ppbfdxlxeqqxuvclfnokrxjsxnawlyorssvpxvzicbgotdukxsznpckvmnxvfmvppkmtgozrlvdbgfnrbpittzq', 968148);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (926812, to_date('22-05-2013', 'dd-mm-yyyy'), 'Nynjvzkzcxadafjyivdiartkxeffwleqtwqbbyclnatvqgyhrqyvhbdwgxrgspjbcryiqcswqehlmoaeggfanqe', 372314);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (376241, to_date('20-11-2004', 'dd-mm-yyyy'), 'Dlagevlurxoazuurszuxesfisdxixthslczasvcggphocghwmxrovwrljssdixafalxiixhjwsdocazjklqgtaa', 799539);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (362685, to_date('12-06-2007', 'dd-mm-yyyy'), 'Riikxqjfvwyvwcvhxzfvwvegwiddirwinhtnflmgrlxxmxyhdddqwfjowophdrsmaiapeqpuktwrnxcpmekuhfs', 261842);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (198294, to_date('24-09-1984', 'dd-mm-yyyy'), 'Jjhqgnnzivawjfjokkykjxlhfigobxfisrjmnokamggtyacbndtxucodfvigefzevxkqrexawgncgkszgvfutvo', 497687);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (619252, to_date('28-08-1993', 'dd-mm-yyyy'), 'Qpxoljzwkfwvgycncoppkivphuevewizznlmmofgoindjnymszimexiavlkrcxjsdqdgrptgvcaiiiwirqyzxeh', 457259);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (335152, to_date('06-09-2023', 'dd-mm-yyyy'), 'Kiopmfabhrmogtlzkkccopehlrxqqqvennoeclwiznosscxnvsrlgoindiijwoezjbjfqbkievllmomxkzfnnjh', 935332);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (744531, to_date('30-01-1973', 'dd-mm-yyyy'), 'Otwjxzbemvbheibvprecrevbxleznitijiinjmpfwfrkqvijjurhgqcaqyvhajzqukjiqaesesedzrvkxskkkrl', 924264);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (896528, to_date('25-11-2016', 'dd-mm-yyyy'), 'Jmzmxmuniuycxtjvbgawnfoppcouqhwhvgtoytorxrvygvnjhlbakqyjoiwsflwwdzedqcnwumhgtppdvsvhioa', 958923);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (433658, to_date('24-09-2022', 'dd-mm-yyyy'), 'Afskexbhsmlppbtzuhmctesktchhvxajzvqefccyyyngoykbocefwktdmzjvscfeqoccfgnarjgvsfzgonnksad', 797936);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (171866, to_date('01-03-2011', 'dd-mm-yyyy'), 'Lsvnjuxoofiuertmtpqhkuqjftismucnfrxpyyfiyftbkaobxhijvemsxaafetkrktwalgxvdmvlrmsmvbkxxmg', 465979);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (865168, to_date('28-06-1988', 'dd-mm-yyyy'), 'Wazpsfvhzkfccnqitsajbntjmcosnlmvcwdushggoqtluodqhraqfkqszseyjucxsvtcelqffbucxrsxzsulvwf', 799436);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (779818, to_date('19-09-1976', 'dd-mm-yyyy'), 'Qorbvkdqhnjgonxcnbytvoyepmargszadudggwljaytisfoxxcfcrfkqyyonocwgsyxbjeinqwunskbyqdnusqs', 396511);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (961736, to_date('10-02-1988', 'dd-mm-yyyy'), 'Hqzpcbbhgxmpndadxgotplzbimamamfjrhhxubkphexritqpqmeqzgjglxijfhrfxenhfwfgvkgafunpvcebfhd', 939511);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (828653, to_date('20-03-1983', 'dd-mm-yyyy'), 'Howxhhwqwobiastnjhxbriqvhhwstenxgcywjrezwufzpokfjwvwecdziacxozdfyedjxtxsigpwcwztjiwxgcl', 499926);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (786339, to_date('25-04-2007', 'dd-mm-yyyy'), 'Kkifrhuvkzejqgyywgpcylrabyxoowcdjvdanvsptjkksjkbcblrcixhwydxnjarqthoxvguppgcmcaomcuvxjq', 454592);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (168175, to_date('08-11-1992', 'dd-mm-yyyy'), 'Wjtivklwraqmleqzvtxmwhangaiscmmioiryxuxwkdbmyynrshemensxtdjgnhtzbyquyihfzedbtwwsibuqeiu', 976191);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (516353, to_date('21-06-1992', 'dd-mm-yyyy'), 'Xviwogrttepwpovdadtxymunqzlsdxryytewxcxhzsazasqhuwqvhrkgoohwsyjhcawfoyjwgybwraaumsqarmz', 237817);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (335245, to_date('03-10-1989', 'dd-mm-yyyy'), 'Vtejwfhxmrgqqmyomubjhcqvivckgffkkmciwrqszatrcwnurrsymoaozkvfpmzehdxbmqrlfzijtviaekshtzo', 349886);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (262433, to_date('03-10-1999', 'dd-mm-yyyy'), 'Ghwdlewdzawvxvtppdmnxmnghxakmdxccpapbretucxvugraqisxwdcfoexxgrlkcvindvjmpfyumqayeucxzlw', 645986);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (393762, to_date('07-12-1992', 'dd-mm-yyyy'), 'Vmdqjlsggoarxsiwiffyyrkwqxbbwmmvkkbeynrqcgbojiispnovtzdespjracgdpvplkmekcozvahjpxwipkoz', 913961);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (277577, to_date('12-09-2015', 'dd-mm-yyyy'), 'Mnthbgcxknwhjqsybvvnjhvmdlxttothkxyycgttnowkauvcfpymncrkcfmffouiyzcbtpnwqoqvfwatobobqyu', 714389);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (819859, to_date('28-09-2001', 'dd-mm-yyyy'), 'Jsovjorbnqatxgdwkhoapqdjmrqeccnypucpfiisgnkbyeqaizbnvrljeqvpqcbwwwquhcrlsegvgughmtdazgv', 375151);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (495995, to_date('16-03-1975', 'dd-mm-yyyy'), 'Nsbrrvddwxohubrsqnhwpszshtxmhlyadkakklbmfxqfxocnettyacwtfirxdqyaexxpzftwjalwtygddhtrauc', 975531);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (535848, to_date('20-04-2008', 'dd-mm-yyyy'), 'Ddvkmksgrxuyccgxrwxowhtgsiysokkggupsalxyryydyenuexawaimzqjznfupibxgpqvhoyikdkqvfoxvxbox', 469673);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (711226, to_date('23-06-2005', 'dd-mm-yyyy'), 'Lbnpgkftxxnjxqmbklrekpfktlhidwjtyqtblyaqeioboudegjerqvouqhwvpuxzvxuvklruwggdegjalrlqilq', 481872);
commit;
prompt 100 records committed...
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (831195, to_date('16-11-1993', 'dd-mm-yyyy'), 'Nzydvyrmmpcxgvhkkmnszvumzkusmmqqjzngpjaojkppkrkvcoyjkxuwrulnaqznneivlmlzrnuxtubowqsxhxx', 647562);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (252768, to_date('26-08-1985', 'dd-mm-yyyy'), 'Myqwtipktakaepjxzinmyuqdioohcojmimjlxzoapnwcjoopwctuhqleojzlfdsnhcxflutyjpyzzimwivnxwig', 341175);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (773621, to_date('11-05-1987', 'dd-mm-yyyy'), 'Kymtdqwalpiwbiykpxazztcjbfwbywaqifmaauztjwdhbenmqnexzdwtbexhfpecknutmmrxboxzyclzamrwrie', 834828);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (272335, to_date('11-10-2006', 'dd-mm-yyyy'), 'Ezqbpzjdwpxzbdehcunagsxkkwtkikgykkqxbvggoledwhfvccsldoknbigyifgqhbdyjdcslukqbkragdojklq', 373732);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (729526, to_date('03-01-1993', 'dd-mm-yyyy'), 'Pinbrovatmjofnuncwhwytnnbvroghwlucirokrelfknzkeokfvaknsbzkrpwcnpmddtblhynowzpcnbnphoyyt', 568736);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (996544, to_date('02-08-1998', 'dd-mm-yyyy'), 'Tdatioabxjcdqbjebhkepqyheknkojjcmkjyzkeirduhaycsdqycppfrmporbuguacsrnwsczrhxmeofpvpshug', 314354);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (253611, to_date('02-12-2007', 'dd-mm-yyyy'), 'Ndgtwgfihwnoejffwhfswzghyutbvsfomjecpvqirixfwxxvluksjhvitkqcssmygtgkzihxuqtjjdpkuigzddm', 293134);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (593129, to_date('19-06-2008', 'dd-mm-yyyy'), 'Hrdfhhfgxcbsonccfgrszezzhnsjwocdgzvxntgqaseeawqovlhadpodbkwjiasmtsyjtusksupehmmtbhipwnc', 726562);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (539452, to_date('20-05-1984', 'dd-mm-yyyy'), 'Yzrdwrufoddclpaitzcnasecilfpkdbcclcswbjuahmompsrfxlgfdxprnamxipkavnpcqaupxkckljadngocpd', 879964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (415527, to_date('19-06-1976', 'dd-mm-yyyy'), 'Jfdsmjenafmfwcwjrbqvbyrgqyhdqctnzsryoulprohdfdbsuxlseexwbxygcmxifxwqrrgchkieqvuxobivtlt', 666262);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (778126, to_date('25-10-1999', 'dd-mm-yyyy'), 'Qusprklkxwkjetbhdxlyllpxejuhphokclkxexwrbtgbvhpjatjgdlqwjklnqbdtyswbqytzqsmrqetfxxnltrv', 333691);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (951592, to_date('24-11-2013', 'dd-mm-yyyy'), 'Jzdgswzgdsvrhymqsqzfaoppqauwayluoqbhrbdqapqhuwibdqobsckqsmrcmzzyexsdbpclmpbvulcnhycfmgx', 835233);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (251922, to_date('03-03-2016', 'dd-mm-yyyy'), 'Wohgjhifjmbkqqmfdocyfpgmcmecmbpjvmysbakohxlkdpphxuihdrqgvmvnvzzzxkoatdfsisibomibijjilkh', 939731);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (487415, to_date('19-01-1970', 'dd-mm-yyyy'), 'Esdmaivpavviyfzxluenzcxivpgkadyctscnjhnqjhfdwiqnlgpsfmnjaekfhzjpnygdslzuikwmcapbfkplukv', 334317);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (131745, to_date('15-01-2004', 'dd-mm-yyyy'), 'Okizjndducdthhmvjcsoslercjbzsyniaqhfvecguppymlscbmhmgrpflseytxwwrlblqxqvdgdkabuynbxvfau', 872846);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (272777, to_date('22-07-1986', 'dd-mm-yyyy'), 'Jfforpyjqqegfbyrqcldnkumejpzcmznuamliahltjfskshhfvpeefgtepesxaaetiaalwyllstlbgromslyspo', 293134);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (969693, to_date('18-12-1986', 'dd-mm-yyyy'), 'Xshoioorkikvphzdhakfcrbrtdragemugxvdbsgfwendnfiahdoeyetpyheegiuvtiqwslmfsemzswtdhaptori', 191535);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (749854, to_date('05-02-1992', 'dd-mm-yyyy'), 'Cwqiyjupdjpzkamvqalsnriavjwbyfcttakhvxkhkrdaaidebcdzerstmvbaipnfgpwtawjaizsbaubojelipuy', 913961);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (538732, to_date('08-03-1998', 'dd-mm-yyyy'), 'Hmycuelhtazltjvkrxtoltuplendcqrbptiwherhypxtdoyjmkkkxvhwzxtkseabutztyxeaualkptyewyosban', 472969);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (775231, to_date('11-05-1987', 'dd-mm-yyyy'), 'Mondcimirycshuvtbxbpxevmjhtbhafxkunwavedxrogstgqgrrzgfutlbxuwgehtioiipikxxcccvawajazsco', 824889);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (899737, to_date('31-10-1972', 'dd-mm-yyyy'), 'Endyorrmpjzftfszcrgvwcnapgjtleqsovhfpmxhwoxhccimblqdwxycyykttlhposylixbncfiqoccourzlflu', 998412);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (466593, to_date('01-12-1994', 'dd-mm-yyyy'), 'Umegbrwndwpkmyrqvlrtoztexzqjmacgawinuoatfmlvworxqlvnthrdhssgvbqaqnhdwtxvawcytdghxjkyqfv', 566661);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (622778, to_date('15-08-2015', 'dd-mm-yyyy'), 'Nthemwaruvuhqbxrjgzwthsnypntrjqyvxlcducimgokkmmqcwioubswybvwrpymglgeqxsqnvhgityyvqqwwue', 864399);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (818383, to_date('23-12-2018', 'dd-mm-yyyy'), 'Epihpsbkekkueyhxvebggaqxzrmxmrcacvchociudlwobopiqcgvcggtuotcfpthnjzhfqhkptiuhxzscvbexso', 519837);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (532394, to_date('28-02-2008', 'dd-mm-yyyy'), 'Daxwkufvuliyktkqydbwicoztwijvnljmkleanvhhezczwyrkyqulecfguiydktbrvidrpnjjehhvobcwbxmaqs', 481999);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (675695, to_date('13-02-2017', 'dd-mm-yyyy'), 'Ylpgmfimejpscahwtreliqztemvxnbjyccigpoyxdogohfzakoididtujgfopqwrmjzqqwtdegvwvvdvtptgcol', 467767);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (456227, to_date('30-08-1995', 'dd-mm-yyyy'), 'Kyirbfpbmopsrsatbiobkxergvqpmmdgygquotidkytcrepieokzlqiacxaktdfrubjckeujnjwylncxevurrxt', 119637);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (711238, to_date('24-03-1975', 'dd-mm-yyyy'), 'Uyvamhcacjgzymgtzphpjpxghceyuggqdbbofdvfqqldoyxmrpcjtdkxmenaulkkuhaktigukdeiayizmxhyrnx', 958314);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (398456, to_date('15-08-1986', 'dd-mm-yyyy'), 'Pikxlvlyhvrbkjkinnurrggoveqbiflfdvtuznlapgfbikbaekfckxgcezlsvsfmsxfsvbqkrdtpwoknrgogigs', 941218);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (936617, to_date('17-11-1980', 'dd-mm-yyyy'), 'Psrjmfbqmtxilvgxdnrxrghebcxozxplecufxvgkjfadtzltkvvwugfmfylslkquzrlmqutfwtykdzbzvljpazl', 865927);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (697695, to_date('26-08-2010', 'dd-mm-yyyy'), 'Zzxgifsxqhcfmnmrlfynyonsskvjvbzrpfxkqariqtjhsgcpxjqxfnjaaalgcksyxxqqtlcxlwsspbjavjkuizn', 694336);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (978223, to_date('15-08-1998', 'dd-mm-yyyy'), 'Ueiodqrztrzpzrcuvpjzxuvldwmhtvdcgkzarwvthgarrpvvrkrslsvxfttiyazcclnzloxffjptjafxzfrsets', 449621);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (977658, to_date('13-01-1982', 'dd-mm-yyyy'), 'Fyyrbhkutkqxxqtmiyyzrldbosedbkeozbljtkrfbdywibskmnfieyrhsbantihczpgparhykwnzngtaqmnojav', 896965);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (684913, to_date('03-11-1992', 'dd-mm-yyyy'), 'Lsioqtipllhxjcwyvyggsdnmzgfsbhzwlpzjsjgrfhlawyojqrclwbtgtinuijnzkbwlictcooobxcxfswbfjmn', 375151);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (394871, to_date('02-06-2008', 'dd-mm-yyyy'), 'Gbldlbusaugfoourssrygpihfmmuevonflbtwsdnfyvfkoooercggejwkdzxradwmcejzdjazbhotfzecacissy', 744769);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (798242, to_date('13-03-1987', 'dd-mm-yyyy'), 'Tuvamyjmrhazqdpaiwnshwefrmpzfvyvdwytgtngiortalgrsdlsxwlzfwmrdskpzpclsczbnwryowofcmibwqs', 782739);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (341722, to_date('10-05-1998', 'dd-mm-yyyy'), 'Tjxhgorezcwpfkvjehrfmnagshilfsosphvydiwrwptxwyghgzlktbokvhizarsesvkxciaehaiymvhmgctsohs', 838487);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (777629, to_date('08-04-2005', 'dd-mm-yyyy'), 'Puyvkcodqjuazgakuhinipzsbrqokhbumuuiaawgzdzseqqltsputmosbtneakjxvwlgtruakdcymtdnlysqxuf', 645912);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (874731, to_date('20-11-2014', 'dd-mm-yyyy'), 'Aijaazwrcftfwxzidqsnidzychxxvvamniupbmirvuawcehcdsxybfomvwobscxtdvyjzkuqntrdzbbupuqveez', 391262);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (295425, to_date('04-05-1993', 'dd-mm-yyyy'), 'Gyktljixefudqiccvzmgdeoosiyfcriyvhikzyegtvtplovsbceeumgsskqasbugtxngfoiklarxfqoqnctfrso', 694722);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (238849, to_date('23-12-2018', 'dd-mm-yyyy'), 'Mjumvhalwhkqobeoanjxfuocrorlhxirikikxmhsdxiyvrjbnqtwhcszxicpufbxxvednykpovabsfwagshmvpz', 665411);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (659542, to_date('17-04-1989', 'dd-mm-yyyy'), 'Ivwkcuzmzpgnlwibktvkiihhxrxlpvvbqbzikcwsfmdqwqhtaalyomepajhpjpzoidzpuavhyoiddctnqmdxzhi', 983467);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (669348, to_date('30-08-2016', 'dd-mm-yyyy'), 'Ytxxgqieqgbinfazhucvsbutnuhccqlethvypzbfcpdkdhwtuaesewlnmvkqqxzfdcsuimjhfuyqdovgesoeher', 797936);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (158333, to_date('06-04-2011', 'dd-mm-yyyy'), 'Svhvdjlrsodovoluifdnznhhnseimccszfuydbunwugapfnihhltcnhgxvhrldppvdmgecdtcpdjhtktwitlslv', 712238);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (198623, to_date('03-06-1989', 'dd-mm-yyyy'), 'Socdkujrivufmbsyamwygjodxfqevlazfadjmyfhnkihitjdwyzweurgolpcxuzhwowsbtgnshcptawbqoiiubu', 681494);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (386754, to_date('03-01-1993', 'dd-mm-yyyy'), 'Efanrdpllmxdrnifymhdwcmhpeulnblnrkwxmefbxqsqnkueedmianovyijandrebjxjjcnsigdtmelkieafeye', 548665);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (228492, to_date('20-09-2006', 'dd-mm-yyyy'), 'Frrpwkgtjtnrtjlyiaujvrskpmdkopmvhyswwrmjgxwwahwuhcxlrrqqvqdirlnfvokdoybczcyeyuzgjlbrzfy', 516232);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (291991, to_date('19-06-1999', 'dd-mm-yyyy'), 'Tcgojobsamkndcujinfrckiitbqfltiubfyncdrpizkrhaqltmqsdgvataiwejmmocrmgdhjpcjqfjasdwaxukm', 612374);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (823653, to_date('27-10-1978', 'dd-mm-yyyy'), 'Ulnqfjykcqsfvmybmtdysqixapsrjpdlvqceglphimbnyrofesnafqaqyekzzzktqvftvbqgbotktjbkavcahjc', 232339);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (362579, to_date('30-11-2013', 'dd-mm-yyyy'), 'Yfndzxfgisjpvjfmxhruylxupkoiexxdfqyyqdncogwwdawwjesivyuuihrnmgegesdnoubnwzdcneyiwwahwse', 566661);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (429765, to_date('27-05-1983', 'dd-mm-yyyy'), 'Bukupvzlkzroetldcukmbkkpvuytcnsnonmnuplteprwhdtcmbxvxajfgitolnakvdupkfpqyipyzvdowvjlugr', 735159);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (883368, to_date('04-03-2020', 'dd-mm-yyyy'), 'Kbuacscqggorzdkvgqtsorybdiysvxczylaxwsvjgirnmwgjvjvxdfzzhwepsyuboivbmifkvyyeduikcrlvxzk', 652587);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (339146, to_date('20-05-2018', 'dd-mm-yyyy'), 'Escnbhgbarllezreuvelgiilvuasnyecnzfvnmzkdztfmftcqtsyztlldczoyjgspvgyxxxlkmjdollyfsboudi', 896965);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (997671, to_date('24-02-2009', 'dd-mm-yyyy'), 'Sywuirfekhlkcgjrgzmefhhxibmjwwuwqmppwgwvvuposycnesxaheutpgprgmkfufrlyzbsfrgzpjynneusmzy', 522964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (695855, to_date('19-05-1978', 'dd-mm-yyyy'), 'Szkqedetlhmdnevnmspajaivihczuiynotmdtqdqpzkqqxzqnwemgiqjmyokyhrfigdudvcflfhmfyykdslaqkj', 237817);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (988638, to_date('29-01-2011', 'dd-mm-yyyy'), 'Fwhdfmpeteesbxnkgcodoxmzmplevletwlhqdzenhtdaftpjvnmdzohuqykkapsrqohvdvggozneindiaycphcx', 193718);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (564155, to_date('14-02-1998', 'dd-mm-yyyy'), 'Biccfzjwiemxxglzgbbstkevdstjpgjpvafaljbjvktzpkmuphzfehmyftqhypgvjbmbkaiprjcpjrzeeoffowu', 494271);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (482475, to_date('18-03-2000', 'dd-mm-yyyy'), 'Amatvdquvsxptboarismxwgyaxaaynijxntfryzaovqgpcxfpwcxdeiwrtyzjicizflilhwvvuxuiugrfyevjwf', 666262);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (992431, to_date('21-04-1985', 'dd-mm-yyyy'), 'Rtukztwazzkxvkzofthtculxgmoyqlbvepwihtnihvjnvjjhdfbuuermyqkirrthespeuikmvmhlbxfmkotsfwl', 146385);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (995251, to_date('24-01-2022', 'dd-mm-yyyy'), 'Qrgmbhzulomvcpwpqlqnafzyppmozvqikfhpmytdzovnsiffujctnuemignleitfqwrjefmeydvxgaannuqlkjv', 689253);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (449883, to_date('28-06-2016', 'dd-mm-yyyy'), 'Rxhgtcyouhlemmhprxatazrwetqtotbnjivtcnfacvxzqwmhmntuhxsyasorerrlvkhshynoknxtuswrmllbobw', 395638);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (349639, to_date('20-10-1970', 'dd-mm-yyyy'), 'Mdicqneqmfhykfamkzhztpqwvlalunuupesgwpfrugbpefpghwfzxqatcasbcicpamqhsqldbkupubbvhvwoniz', 911685);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (277762, to_date('02-08-2000', 'dd-mm-yyyy'), 'Uyivkijjtovmpgysvnfkjktkxboilsnrourljsvxpevblczqoebnrinpwctsilrrzdddkwodekxpbchshrekixq', 979342);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (246251, to_date('26-06-1970', 'dd-mm-yyyy'), 'Nxsedmnpkemvcjmwoznatvqpjisszjfuaahtdamjktenolyupnjtuczitmlxkdzgrvwslchuagycaklazpafgue', 324351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (496273, to_date('23-09-2015', 'dd-mm-yyyy'), 'Ousqnsimgllxyqlkkqslalzmbyiupkfqxkvtigwlnbltnkxqvggrmcnyfdqkrqqqhkerbwpkwqowrmcidhhymmq', 573952);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (422398, to_date('06-05-1976', 'dd-mm-yyyy'), 'Lvipygutpadqhgxlbbyyrvlhdsfrehikbnnufexkbdtqqlxotjgygvixmybzdqpizgeejxnytwbygqnxvryylox', 632189);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (215423, to_date('08-12-2020', 'dd-mm-yyyy'), 'Tyzcchblomhtjajzhzromyxoxxusrqlvqdoztdbbvzywvpjmjkxkwshddyadqvxsbftgadagcytttcqdaqylfvx', 163538);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (163464, to_date('17-03-1992', 'dd-mm-yyyy'), 'Zcbjcurtjdugywliedngplmtezhjmgxaeydclrhskjyggdduwsmgjlaiyxwtpkjxsxdqabqdrutcvyhqkvdjetx', 986351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (345234, to_date('01-02-1994', 'dd-mm-yyyy'), 'Ocjgpiiozexjrzzrqcppxbxvtpjxbcwonwrznpoyujxvdjftsdhjgzcmixsyzgrqrokhywrxxfnefwaocvdipnm', 865581);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (266329, to_date('10-08-1973', 'dd-mm-yyyy'), 'Jbrdmkvlrjeafbqbufnotddzxjwvmgrqzxunhgdmpwghricivomagbzixszwyjiilqmiuybggwztgbydpzcaxma', 299345);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (281719, to_date('21-11-2018', 'dd-mm-yyyy'), 'Igxijmuqygnjmksddulqfdmxxcvswxcufpoyngcurjpzbqixhpengubeujtxnufowjqyvkbajnrxreisxzpcybe', 171715);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (872256, to_date('02-02-1980', 'dd-mm-yyyy'), 'Cnakagnyutwzrcgnirlgucqtnbcnswhjotrhsatwfjnlkrzhtmfzarkskdlsctpphkaauhmzeqxtriilgrbudqv', 893735);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (269645, to_date('07-11-1980', 'dd-mm-yyyy'), 'Carojxkphjumgqoedlvnwrcrzevbpfcsoqdgltrgufwxyykgcbxrrafdvlcbwuhofipuoapdnysxqtpfmgfgurf', 784986);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (184637, to_date('07-02-1979', 'dd-mm-yyyy'), 'Bqpgocmrgildmtriqwhhrcdklizrmigonxerktwmydooqmzjyhwdyoxfpheomibubozqamxubtrkorielhvzskm', 197992);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (946673, to_date('01-06-1985', 'dd-mm-yyyy'), 'Vqnjjqglhsydxqxyrjuhjjcloqgddguscfhujclfvomyzhmnlverhuhhheglkmgpupsckxmainzxoehkpvjryqt', 645912);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (948947, to_date('09-12-2011', 'dd-mm-yyyy'), 'Rmlchsibtuxdohbcgvfpfxbpyksjwxscelihtsbcfhomgruglkusmczazlscdqbtznunahpsfznqabmusfgwzsy', 566851);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (395452, to_date('21-11-2005', 'dd-mm-yyyy'), 'Vicdmynzdsciavphpjrcukiarldqljqnibdrhrxaxnxydehnchvvpvvckdxwkcjtunemppfztpwqjoyqmtftulk', 578981);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (715547, to_date('21-04-1983', 'dd-mm-yyyy'), 'Smnjqkjpynujdbbfgrrbdnvqlxwfdnwdtmmlahvnokcamoqndgkccetjolfjwvhrlkgrndgtbqljeczgdowqpth', 828532);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (398313, to_date('06-06-1979', 'dd-mm-yyyy'), 'Hnsgxvkblkuuecxmmhokpppulliloowrhvmjqnyyyepdenclfuyzmwpvevrusnlpujoavbcwcnxmhawuexeahcz', 387731);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (272646, to_date('03-03-2015', 'dd-mm-yyyy'), 'Ougkfcwqdyjyujsggacjmsvpgxxkshuwyasgjqfufyeydlzhkezivzppegcavgkiyceclfgewwcnnqrzmygobwr', 659778);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (645882, to_date('30-01-1983', 'dd-mm-yyyy'), 'Wllglyeaaeswibdzfojuhrtkuqtuclwmebjosyjmvlzxktcnxklpmrovrigpyoopwixywwilsejhvuxhxrwwsow', 163538);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (329199, to_date('16-10-1984', 'dd-mm-yyyy'), 'Qnkakrudqchysyezrzpgvjltydvjusqfvphkaphlszwbmictkxjzzmwxickiigjqyrrscskldtgnpsqusivivtw', 644968);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (951976, to_date('29-05-1974', 'dd-mm-yyyy'), 'Wcbdhyxtyhgdhqbztdyqidqbrhhjpodrjufxjeskinuiuynijojdysipoxrbfgibqwlaaljzpycbrimujkdoupp', 179589);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (224387, to_date('13-01-2017', 'dd-mm-yyyy'), 'Fhrahenvqgrktbimqritvnxbphjqezqrbxvfgmktzkqkcgeiafnsqmyzwwpbliexpgkfhnengurebyryfallmvb', 372314);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (179791, to_date('20-11-1983', 'dd-mm-yyyy'), 'Wuexdmqcebpoiwehmmezgnrwpuehgsmkbroccsbnlpuwvagckaxlnvwbjjcmoenvggjhdovzwpsefhxvgdlnmdb', 529282);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (649329, to_date('07-11-1978', 'dd-mm-yyyy'), 'Hinqbhltcoikxjqbxuddhlzvbdgugxawgmpnmlooskmlhslciaikfmqmzjofxemivzmfwpvtuzhaobertdztcve', 313547);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (556568, to_date('27-05-2012', 'dd-mm-yyyy'), 'Qslizcoxrippvurttmmnsfokzymgiraqfioefiegmpfqfzjerntgzfqzsxusdgpaurhejdedezmgbzhvbjrogde', 319454);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (918884, to_date('29-09-2006', 'dd-mm-yyyy'), 'Dkjulxninpyvswnbjxhgvkiafihlxxawoltlcmuhdjejxrhwpldsmfqdxbmlvnbhzpttissrozkveduetklmwsh', 441216);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (937293, to_date('10-04-1978', 'dd-mm-yyyy'), 'Lmyymhkmcbtoujklbfqicnzvmqcjublzhivnqfjobqwtjwipyqnpmubfiidsarwaidzjjgnxbefeoogltaorofe', 895249);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (592346, to_date('24-02-2020', 'dd-mm-yyyy'), 'Skrjyarvvogpdwxdbvnuqpfpnvbnvejqiwbkmeskayesdsvlmbrleaisiuipafvnaorsqqpipocxwasjoqecqkc', 946737);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (819492, to_date('01-12-1993', 'dd-mm-yyyy'), 'Tyrciyjpwarwozoonbjbrarytxavaphfbzyhpkoahepesmsweqjpmztnuziwdfrorbmjfsodainkhkqpewhiauz', 414943);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (773633, to_date('08-08-1970', 'dd-mm-yyyy'), 'Oowzscfzhldpscxegxegbgitygdkhbctrcbldqyqverybtjuxkytwkdrzfwxaomzziejlkmmbuipfpetafiuczm', 682623);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (157279, to_date('19-01-1981', 'dd-mm-yyyy'), 'Ozxquzmctizzpoxaasmlvizdssezivddbuzsbecrvcmuyjtqfnyitloocqfhsvvkrxhrduxuhrfloqcxqnxxxog', 961253);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (357748, to_date('24-11-2003', 'dd-mm-yyyy'), 'Fjmgogvwqznbwhepwkjfxcdzzwzaunvxxudsjgohaxbzmznvrfdkaqtxcusigdjwzgygyjpukgrdckxfrolkuek', 644968);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (414133, to_date('21-04-2021', 'dd-mm-yyyy'), 'Qbwpwchshymxqvimyinmytwgwjauoqvtayjfgldzbieethlacebweekuzmcpmgtstnemqomttydauljemaqvvjt', 791347);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (479645, to_date('02-12-2022', 'dd-mm-yyyy'), 'Qjwnpvwkqgwmwcosgvtobijobynlmxggzgffgfrlnvuihflblrhvsnhrbwircwpkzovwquemncyeurfvpjwbpzz', 668164);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (368921, to_date('02-09-1979', 'dd-mm-yyyy'), 'Dsigsocoycyirybjpjcurwuhgkzttpnxdylbseftswpnpidurgxmsiowxofctdbebgnaqiwqcvrtanqvljonygp', 414784);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (417786, to_date('17-07-2018', 'dd-mm-yyyy'), 'Rmzcbthjavdaxfbldhsupxlrdwpkcdycpxenffunpegxnpqnvkzcqsefqcwigxyylxsyrufvwuyxsuwwiastpih', 275497);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (131997, to_date('14-06-1999', 'dd-mm-yyyy'), 'Tcxfiszjgitgvhsipnjdzqhccqxneodqvygcnvypkisjysjtwrngsbxmdjcxacfcspjldqptlarvuabvxkoxtfe', 821516);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (124292, to_date('23-05-1971', 'dd-mm-yyyy'), 'Xyeogrxpfdqdnfyfecsooutvwavqnvbwacdaelldvucaklvnnucnqgjffacijrtgjxkbroiicjirwysvqoiidlw', 564872);
commit;
prompt 200 records committed...
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (645449, to_date('12-01-2011', 'dd-mm-yyyy'), 'Xxdeuyasvwgdamqfgfxpxylgmqgrapniusqdiznxappgicrpazlncrhrqddxbfihztjhtntkcgaeixovpuzcrss', 448399);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (263478, to_date('01-12-2017', 'dd-mm-yyyy'), 'Evahddcesuhsjggdktjhrmehtcyklrcxbwqolkzzpsrmgstoogofadankytvacdntvphknfiyaxsbwkidhcshix', 651392);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (911515, to_date('01-11-1981', 'dd-mm-yyyy'), 'Cqqatrjqctrbiwgjgqdxwbrgriofwmayjumygfttcdhpxuxcnefutgthqkbkbxcdkxrnfknzwlfqnrgipmhpofb', 979728);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (331279, to_date('29-05-2005', 'dd-mm-yyyy'), 'Xphuvcbkjwclrwjhahzgfopbcbjrnzgcqrznamhbvhruugohlrtfpcpfcnxtctbixrnxhzrfzfvqqlvechlloqq', 926356);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (385894, to_date('01-12-2007', 'dd-mm-yyyy'), 'Prafatiekgomegxrfuxkmcqrkrateuvjsbiyhphcguaqfhpmboppacszcdantrqdvosghbtefndjjyemaswpapm', 313547);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (226823, to_date('24-02-2019', 'dd-mm-yyyy'), 'Yqumisirotejzuusvqvmromsksbdquriqguiypqbtifvwoaapbtntyufbaaehsrfzgthpbfbpivpqgjiruqkitm', 891425);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (928827, to_date('16-11-1992', 'dd-mm-yyyy'), 'Joqdskniulacnzgypywuyorqqldfdsdqgyythcohozrrisqpgctxehrgqbzmzpimwnaqyayjrfpfnufljsiwnzw', 459429);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (986817, to_date('28-08-1971', 'dd-mm-yyyy'), 'Uupiacfrwpqxxljkhnhywurpcsebetxxuejqmjjycudtwhsjjzhlhydkmjxbgogdfuxhwsudlvxgwafbnmxcyms', 122174);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (622546, to_date('04-09-1972', 'dd-mm-yyyy'), 'Vkxezgmjvfjqlpnkbzkiosbmkrnpbawpodmbyahsvvdhhikzoprqcwtarsbcozflutzivsdbeqyhtfftrruugwz', 726562);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (393161, to_date('12-08-1981', 'dd-mm-yyyy'), 'Eobkpshihaasmtdgszcwpdoljrkxixtkqskmkewlxuliadtqyzepuhxdrqjsxzkdsssieewmadixnsmirruezsg', 542827);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (821544, to_date('29-07-1972', 'dd-mm-yyyy'), 'Mmthtgfyslvcnygnfhyjmtuddrlpeqqmkduceufctpxgkrluvjhtwlljesugsaditbjnmznnnoogumzbrnwljja', 221689);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (918323, to_date('03-11-1984', 'dd-mm-yyyy'), 'Xcrvmfszrhagpcmmtaoqinriqangvulkixrflmxwhqjpurfndamfxmmprnncisawmmuejyjwlnpljcqpgpiwbyu', 568924);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (172592, to_date('25-04-2017', 'dd-mm-yyyy'), 'Wawyfsxseifhtwzafvnirjgjhwkazashqicfjmdmlofswwxevmjxitfzmrlozwrxjqvsnecetxnwdyrcvlomguh', 416275);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (212748, to_date('24-10-2002', 'dd-mm-yyyy'), 'Vcvtwfvtcpkhfgqbimwkuqmpxxchccfdkyrfbqyslbldzapbtenypgjqcpwtzjkynxpmysqbinqyaoloqcbdvqn', 683451);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (379836, to_date('25-01-2014', 'dd-mm-yyyy'), 'Vjzwqhdlpvxvxubuqqlvqnbnkocbgojuppblozflotndpkzhmwkzcymmfccfwznueebeaaahwygzwpaqgrbkwlm', 976191);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (185714, to_date('13-10-1973', 'dd-mm-yyyy'), 'Fpmuooqgayahbzvangzmvenmdismcifemyibwockhxqjfkcapwyrpctmpflvetpibjxpfhwqhheqtabipogpzmz', 383922);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (637615, to_date('28-06-1985', 'dd-mm-yyyy'), 'Blcsbksotqhatbabkguweybcirwzlzhrgcltdbsxjotktwycxigfhejetbrtksztyoujknbttszlefpssoobtet', 456442);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (452491, to_date('29-08-2013', 'dd-mm-yyyy'), 'Fiiqhkyfevhxeyiedxtmpiglbzghzackkvxnprfohhbampteiurxkukkspypsbirfcxcxqzgknglfxgktvdskul', 568924);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (948269, to_date('27-09-1991', 'dd-mm-yyyy'), 'Vhzvaatsjzoquahxboszwazxmovuvnxgnwnhdhiorpfmjnnbppjanyydtjlzsgvbotyxgkrmxyznyeufwhvdthf', 349886);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (753374, to_date('25-03-2014', 'dd-mm-yyyy'), 'Jfnshildfnxadyivizslfvqhbmcdyjqpvbimakwwgwmfdigvlkpsbbwqeblnvoiimxxbuonbwbufurbhzyhirvh', 668664);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (131639, to_date('18-08-2015', 'dd-mm-yyyy'), 'Npbuofyrwbdegabvjotwfxpqruupgeskgrazgavzjpwaiegmndgxlswxaibrcvodzoqfowplobwwednvsxfsjbi', 724245);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (934342, to_date('26-06-2016', 'dd-mm-yyyy'), 'Bqhdwdmpmlurmehtokgtgnxqtshwkhrmbrfbxwoiyaunrloiijxjaoeplljnejdyxwyeawwjacaolvjinawthly', 144335);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (436191, to_date('27-11-1972', 'dd-mm-yyyy'), 'Ijngtljdihoztwuriqbkbwifxngtffmjeyljhcvdztgdvioyowtzqhmyeklgilmpvdtqopzrcuwqlcbcskujirn', 361431);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (988475, to_date('29-05-1999', 'dd-mm-yyyy'), 'Qziesucsnoddiavxsdhhqdtcemyhilcxbbrunlkbnizsxvelstlvbnzftykutmknwakegjcjnkwfwxzssbtmgek', 968148);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (162135, to_date('19-12-1994', 'dd-mm-yyyy'), 'Aojmiksfciztfjgekrdxrbftsiztbhfpsefwtqxpyuexfjoxzepmknyhaomtkvyhpjgjiyvovvhcsrklohsbcbe', 115382);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (697488, to_date('04-02-2021', 'dd-mm-yyyy'), 'Ancurlqogviqkctfdapgangyoopgiyvhpvbpiyeoghfrjuwfoxfppbcoewrvjliwushdxcirzrjxwdbmiltsakr', 848765);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (794388, to_date('09-08-1994', 'dd-mm-yyyy'), 'Kraljsqfyittxdjewioieivkrvjzjqqemihqybtbwzkjixtscmyqbmybnpxqeshelauozabnfcscxglatxztbix', 632823);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (185566, to_date('29-07-1983', 'dd-mm-yyyy'), 'Xmfnjesskcrcamorgdurllqhegclyyiwpslbuxbfwxdabxslfnouwczbinkyeebmhxkuyzwoflsfhfywpxswtly', 819964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (855757, to_date('11-02-1997', 'dd-mm-yyyy'), 'Jrvywpyvgctfptjwxscxzhlxhreulctstjybyavqdnhcilpoouwycgtdbexhelufvpqvpxgrpnuktmaittsusxm', 926914);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (884617, to_date('23-09-1988', 'dd-mm-yyyy'), 'Urmbnxnjkmqiykyzbggxmdzjfapmfojysmugowraczohaawuwzushjvtcglpwerhpfdalyqoxxfkrnlykqpanbe', 615292);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (477438, to_date('03-09-1973', 'dd-mm-yyyy'), 'Anxwbyngxxjwspdtyozptsrkfvfetnjxbvmdvuovoazaqadzjuspnmfivcrnapcofkwuqzsfqcwlwxdgxtkdvrm', 396511);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (977181, to_date('04-01-1994', 'dd-mm-yyyy'), 'Mljxnqqluuwnelwwshqqlydbewckbevzdwiltuzujhzymsbhqjzzqazbjipdihxmxnheqykpkzypykkpebrymbk', 497395);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (774877, to_date('02-03-2006', 'dd-mm-yyyy'), 'Bhqqvdsliufdikojcojcypvtutzpwoodwtnbdyntgxawnymblahwihymkhpebgybivmsqpsdgtyhyyxijwbdnsv', 388351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (387175, to_date('11-09-1998', 'dd-mm-yyyy'), 'Uczzfziioyscnwauowhviutvxghbxljfhaumlqcjcpvgnzbnucpxkjaafpeunpdgfbtqsdtpzinrdlfstldspnz', 418488);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (355747, to_date('23-09-1988', 'dd-mm-yyyy'), 'Gvnlcswuppvvgcvyjunernjtnivrlxvucbvlpqfoukmglchxvwdahhzhfqbwulpnalqiyxocldlvfpgatpfcghn', 417299);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (774543, to_date('14-12-2021', 'dd-mm-yyyy'), 'Xpessckehqnodgatpchatfkyimevshlinsbffykisinkdssebevxhxugoltzajarhoqilqpeteednjxkdqtnegc', 418488);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (954258, to_date('20-10-2014', 'dd-mm-yyyy'), 'Hhtzocgbxnuttioptykgquchcjkanvqszycwmvaepyoowefvbrvehpnvkgtwsaehbxwsbifvhsscweulmxlyrzn', 485274);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (998327, to_date('10-10-1996', 'dd-mm-yyyy'), 'Eednmghgfbfhaualgtlhrflihpqbrdfgvnuzylkoywrecjutwzjoenlezxzgrkaposjkiakqcoccfcfzvubxtlm', 428738);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (466415, to_date('18-11-1990', 'dd-mm-yyyy'), 'Irvpirrcdzcdpmdlypgcgnyafaizfovzufjlonhesmfjzcifamuiwcipilndeigzxhjeheyldruznjgsfslzhuz', 823497);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (287175, to_date('03-01-1993', 'dd-mm-yyyy'), 'Eeseiblxrfflbetfrajojmopbkulhwitusjssqxssxaykuxdkpmagraxbscbjuhioeyiigrzjflxncprprxdmlj', 163538);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (492943, to_date('06-11-2021', 'dd-mm-yyyy'), 'Xuuyunhprldgxupshollqjrmfnvnilzbzgjyiyrcwwxpmgohbcvtvgpywekkpdkltgigsilhvltydvfnsohjizu', 865349);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (797399, to_date('11-04-2019', 'dd-mm-yyyy'), 'Dbpqczxewccxfjcmttrtufncymmtwnhpgoqwrvzofisvtmlgjkwxieduuilunmancmfdahhvhmfzgyadbnzwgdi', 439258);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (455198, to_date('04-11-2023', 'dd-mm-yyyy'), 'Kbxtdbvqivrnvuzupntjjpryrkkiwzttxtlaeolhxbeqcvwkzqkyvmqayhurqfdpowonchorrxolkgwijmlcasm', 939731);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (715384, to_date('04-02-2020', 'dd-mm-yyyy'), 'Rpgickuzmbymzohbtseouoeaevgoubuatdwpgbpdsvkxflqrswbgkkmpslfhayxhnexwwrcrqcdyeyiswjooxgf', 919592);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (618273, to_date('26-08-2011', 'dd-mm-yyyy'), 'Nhloikmnyrgpzwbtgvsghuixdipsvsrtmgogxwdbnsbyljytfvdwbzjvaldafueqwhaogtctpspyessoowuizbu', 387731);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (692647, to_date('23-04-2007', 'dd-mm-yyyy'), 'Niczesbentzgabzqtevopcaojmzoyqjgbmdpxgixfaevffhaixhevyjeerzmfmpzbxputqnipwaigbrhronghwd', 834828);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (567316, to_date('16-02-1983', 'dd-mm-yyyy'), 'Bzcmhuhhefhrdkcixpwsgmyxaigfybxetlplshkroqrnascilenriyxufgyqndmikptcjqtfjfveatzwnbeboke', 437415);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (285549, to_date('15-12-2005', 'dd-mm-yyyy'), 'Pmyyqpkxbyfcomuycvdlixryrgpirnyyxljpdjfcvgwfucsjgftxoatzloyaewaaewewkqyhqwfljzbtlnratnv', 952842);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (761839, to_date('26-02-2011', 'dd-mm-yyyy'), 'Vjlzczcmedvgjxkbxxszhosdzgpfjoolmmwylfhybmxtelcluyuednxcddgiswtzhmakaeoobjinkebtpswexua', 394876);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (118454, to_date('26-09-2023', 'dd-mm-yyyy'), 'Wukthzuetwyzdcorbrncgykzkahhgqlahtfauiqcazageslocpqvdodmgfnbppqybbzxocdfzptfzettgfjivxm', 178171);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (849213, to_date('10-03-2022', 'dd-mm-yyyy'), 'Eqvtnpglfnowjxxwpnlzawfuahyjiadnkblpcirnpmlqxdrhspmwlapbovdarawuudlpwnfzszoxptvwcuthcpe', 261842);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (798793, to_date('29-01-2012', 'dd-mm-yyyy'), 'Mrfowgktjthvwtscrbawrsfzqgaorpypnvhtlrnzvrsajhxrbgxoiywawxxruncmfgbdoqwrlhtlspberrqwrrz', 323711);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (113242, to_date('09-04-2008', 'dd-mm-yyyy'), 'Bzitbhsunwhbgtvvtjocacskmyfhqguolqwjevqacselfvpuyhpujbchrhiwouxlcfuldidtaffvvubhtwsvpyv', 355515);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (655318, to_date('05-07-2014', 'dd-mm-yyyy'), 'Zcanfyzbmvkoghcbsrueblfbgbrkbwvjpuototagczeeynoxfozpxzixqsxuooryuctnyzquzzbwfdqpyuryklu', 814567);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (238153, to_date('09-05-2010', 'dd-mm-yyyy'), 'Ovjqemdcrudkfpkfrwfjlgecxcixosaasxlojabqbqwitrjuevcttwxstvllieiyqbmfdyrnfalsrgtiurextej', 329156);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (932449, to_date('08-04-1999', 'dd-mm-yyyy'), 'Lyghlvieajudgdgyguaqarvrdwyapkdrbakykbwznygdhaqcpbkbsdcaaikjoaimusfbnwxqfkzpbesbvyiotax', 872846);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (417667, to_date('18-07-2017', 'dd-mm-yyyy'), 'Jclhtnokyngdqldshalbsepvuzwodvsnlcggnhuaxudbieiecsdvmkjzshqqfabzpgulhcoasisqstzsjxeuhzh', 387833);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (794318, to_date('26-04-2008', 'dd-mm-yyyy'), 'Girfenlchunubtkfatfhxbuoexpdewpjjwxgscbdjsveyidwaqsuddzttxxaiwmroebibiyolipuhjsttzzoejy', 712238);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (835331, to_date('18-07-1992', 'dd-mm-yyyy'), 'Yexuhgzksiogrnsrjkpeatyiotwdftqakrldrehaeoshxjcidgxxglpczovlebmteutuooanxeecpbishuchvsn', 477897);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (793267, to_date('16-07-2003', 'dd-mm-yyyy'), 'Vcfqxoafbeznfacasuqzbawhtcgxbaxyevwpdzemyphqbnlwxpldjndawnkfvbwjoawsrplyudfnflnmqjewwss', 333554);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (781234, to_date('25-03-1995', 'dd-mm-yyyy'), 'Rlxixgudamzjkdhzjbqucvopwohitcuwrdurtbnlsetbskpzabtlmymrjzhfiebqcqqimvjnkgjhcnzazhynllr', 814567);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (677243, to_date('10-10-1977', 'dd-mm-yyyy'), 'Sothxbvkiykbpkbeapfejadsoyutlofamubmfguktrolhqryhfzhpagwpepvuuwusivqcjappjyjebwdnfpzyxp', 961253);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (457862, to_date('06-03-1974', 'dd-mm-yyyy'), 'Pmtfdqmivnfzbtcittutthxmjjryubzsrimbdakapcwmcglptmgxxovsdsulgvtqhebyqoqxwtnkjkykgoskpzi', 653924);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (755613, to_date('23-05-1977', 'dd-mm-yyyy'), 'Twivhlrjigvrzbrqklghevurbiyubfkcawmegfbnexokutdufnedckkwkqvgsgxsivtktjjqupbfqhnvoxkfqyl', 679569);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (591789, to_date('13-04-1971', 'dd-mm-yyyy'), 'Hrjotlhoabrjaowdndyiodxojwdfvrlskzevmvbqtlzjexzbqsdtcspqdhpagddnsgbtscqsluawohowhybxsfe', 666262);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (834942, to_date('30-07-2011', 'dd-mm-yyyy'), 'Remwbpfveppxonnswtrjjgforwrehyxmaxqmsezgkhufzstzymptdocnbnaakfzrbguzfnwhbivfpkjfsenaoib', 689987);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (273748, to_date('06-01-1976', 'dd-mm-yyyy'), 'Cwsakipdhvgtrvfanithblizlobyrkaiwhbhyhiwiogzywgrmrgrvxencyxashhzjsftwrpwihhoawdmwfzmjom', 269226);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (723149, to_date('29-12-2006', 'dd-mm-yyyy'), 'Phehllogsafablvvxucmqtgvbicubsasbuksncfcsanslgsvruajyfjtgnybojehleszbimvastmjfhaurlohaq', 753283);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (499276, to_date('14-11-2018', 'dd-mm-yyyy'), 'Wcfbvgrngnkkzwnhvlnkfpmdcdzlwzdpgrxcgeuxxubfsnchafwpptbjjpxbuolotcsbjbjnmgqbvmhuywlifrf', 349886);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (797421, to_date('19-09-1993', 'dd-mm-yyyy'), 'Zengvpbftmcwwdhddhljpvipaqvkhzorwrjpzljehlggwgffphgdyhqvkfxosvtgfyhcrsfgiulghjuqjnwlstq', 668164);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (565871, to_date('07-08-2013', 'dd-mm-yyyy'), 'Xxcjmsjvkhabznlgfkcemsnfvpdumqwjwprsrpomuclkoeegesqgqndmistnutvraatwdjrjobkmuxybmcamrgj', 456442);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (195476, to_date('20-06-1999', 'dd-mm-yyyy'), 'Ktptplvivzwfakpuiohunsubzfcnthwducuryqihckoaoxemhmwvgcokitaquailppxvdbxnogpbjqumtvinwpq', 766753);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (592855, to_date('16-06-2021', 'dd-mm-yyyy'), 'Candcujffmawmousaxvcpuitonbjxkzujxmnusnoufgojxjhyphkksrirpmutctbgnxbozwwvdqjtbfdvcomqri', 414943);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (976118, to_date('17-08-2009', 'dd-mm-yyyy'), 'Ejqqrryztdowhpiyxzfnhmvikrcbaplupepeaugykryutxvckjhtwntdxbwidbvnytgnuztyssrgnomzpsdiawe', 485274);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (772221, to_date('06-03-1995', 'dd-mm-yyyy'), 'Mbwyjouprfqdgvlytqjexnbcfllegfdqyvaoxrgfbzatvgiqismftxbwxhdcmuxjailkxnuhjxsacuyrpfwqrti', 144226);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (211178, to_date('31-08-2012', 'dd-mm-yyyy'), 'Ottamtgjughtkftcccszlclskckklzsgrwmkckaiwqiiinzkpjvayzhpdyixkhcsezzvhjtnbuqwiinmqqjzexl', 835233);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (546328, to_date('09-10-1971', 'dd-mm-yyyy'), 'Ldpwikskechpzycaxmbiknbanfpuozwbvkyxrmerazcfoqiifdotqybzlcsvvfpacrebfzzggzkcoapvxkxwszg', 258784);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (845452, to_date('11-03-1996', 'dd-mm-yyyy'), 'Glifhdwzsnqvnhopejurbiqogekzyhbyhbnuwfqomxthldyanapjwxjiapykkvhnhahncziswylzjtruhfydxqf', 744769);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (868442, to_date('26-06-1980', 'dd-mm-yyyy'), 'Urkgultnbdpznmajslfrezhtfielbdmdnffxxmigsjiatrysuggjhakbbqteqqfnkemmxamajobkxjugdhpkibh', 696558);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (192874, to_date('21-10-2022', 'dd-mm-yyyy'), 'Sjdbasymajqdgorbsvsixtkuslnshhnncgdxhbhjupjiaokisbypvaiqtgegaryxecotumfxlnmyidymyfuluii', 282353);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (998145, to_date('29-12-1974', 'dd-mm-yyyy'), 'Iiaemvjaoqdlqduhqdpmwguckyohqkpceacdunyflmcuqpkdazqqwkejcxuehajrcsrbjrhimspwnfdvdfxhifh', 179589);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (758166, to_date('23-05-1991', 'dd-mm-yyyy'), 'Fxyzvwwfdeljwjsohppawdkqglvqgnuourelwwmlnvkvyrbmeiwpbdmoderkfqleaoynvyqnnjuvdmobqjuldct', 388351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (143228, to_date('31-08-2006', 'dd-mm-yyyy'), 'Ugattxpgvfmiyidrwqbekqsevkkjocqyilsfvpgzmzoggjpgqrwvknspayfdpdtwbdlvjujgnfrijweipxlpkdr', 583224);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (535411, to_date('16-06-2003', 'dd-mm-yyyy'), 'Lnpgffuhguopwomrfecshmfgjxnojcsyvqslzgiiyzquprqhnguuuuyzdlnpysuyopzjsjktaokmvbttcyzyypu', 418488);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (735343, to_date('04-05-2011', 'dd-mm-yyyy'), 'Hhzotboouawunlsaebrksrestsmxgnwddbsglqapqfbznsfqfthmtvxzrovborzgbeymmcvujodgunrpxxyezih', 414943);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (449627, to_date('02-08-2016', 'dd-mm-yyyy'), 'Ibcgicehucwwbhfuvtjadnevuicjhqbfmqrmnvnsqxrxxtrxesijrsgexqkiaioktsyvkgwntsjsnpiujfgarbo', 995385);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (567983, to_date('11-01-2005', 'dd-mm-yyyy'), 'Hasgvzixfxmzpuwczycwmtgacvijguafkbmejxbjijdirqljlksdncgshozeaidsuphpoktbormcwgucueuheod', 653924);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (676188, to_date('01-11-2007', 'dd-mm-yyyy'), 'Bcfxqymwsoviqawdtfnpvyqitxthicxnunhmskqccdflbrwlimnvpnmgdkmykehcwvhtkacjbfpniiwhhxioozu', 782739);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (821531, to_date('28-09-2015', 'dd-mm-yyyy'), 'Rtmkusjrrjtdgcenzqkvlbubqzpfzvvofmjuevfxkwskfvjqqxmwlqqieqwvbocqhpblwdswzlhhasufxefedeo', 334896);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (684468, to_date('22-06-1996', 'dd-mm-yyyy'), 'Hgeqikljjdxqddsejgyfiksaeqvunhvladstfrrztuearbpdjuhsxrssbwqlmyhejtitvbcqdzduzfwbokvogut', 696372);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (635182, to_date('15-02-2020', 'dd-mm-yyyy'), 'Tblpltjfwdcrkqztemqrbqbsgzcmknldczkqflxwldpshlsiowsjghfufcpwfvncxbmbcilalbegctqlclpcqfn', 475242);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (654845, to_date('10-01-2014', 'dd-mm-yyyy'), 'Sslfbrpcbjovemebomgxnilphqkhnutusylwfbmnnywpndvdcgjbtbtpiepfgozxoumltbzwhivvfxdzcvzcnby', 165536);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (825337, to_date('19-09-1976', 'dd-mm-yyyy'), 'Mmhcnixaqkxbbisztmjntaepagxjasnmwmhyneoluilqaumnmvxmnywgyjetwzeriimynzlzwralptgleoinomc', 414943);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (828164, to_date('17-02-1972', 'dd-mm-yyyy'), 'Wdokagaqfticxadfuuvhlulndxaklkdnllklifzsqtmkcndnwfphfsagvejjmgpdhjascpexqsozussmoinswqb', 146173);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (582856, to_date('17-01-1978', 'dd-mm-yyyy'), 'Lrbdfsgkanxhfjiblbzbsqoufeqjzjcccemkvutxjlbqxthgwwwlgyebqqvkotmvvvrffylnymivastkhaurffv', 282353);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (879858, to_date('15-11-2012', 'dd-mm-yyyy'), 'Tlcppvahofnjiamcsgwjmfcryvzhrdnffvtdmzzyxgmezpzwgldgktllshbfybheryzeowywxuajutvugqzatdc', 694336);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (443822, to_date('15-04-1987', 'dd-mm-yyyy'), 'Govjmfldckbvxaxgxyrzfomenjxbowxjhiqxvqmynvwjfhsbhllziptwzngnidtwhlnzzuqwocpbfkfujaxitnu', 583346);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (633852, to_date('17-01-2007', 'dd-mm-yyyy'), 'Wnjuiniiqloiffluosyfszrfqqmrxxiydipucdvyacfnzatbeckkghckvfrkrvmezkryvjmmzemjmwacalsulzt', 746186);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (898289, to_date('26-03-2003', 'dd-mm-yyyy'), 'Gknbtltiypxjoqmcfeaepdigeqkihfnzlaujvhtdcckhkibebjeahooavgogngdcjdjdwbwlowiiuhdqqxmpfmt', 333447);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (383134, to_date('30-09-2016', 'dd-mm-yyyy'), 'Vwptynvkoskdzdeuehuthavduitcurxgffbojsetovizfnmptqqyjfcsmglhzddipzqqzhxehznqqnrlqrrhgod', 532864);
commit;
prompt 300 records committed...
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (736778, to_date('15-03-1977', 'dd-mm-yyyy'), 'Mpafalghzjduriiavfsxfgvdltpwcmpxrbpfzkrbhdyijustoijthvvropaetlqjfcfuznqfhubgpezyzzpnhkm', 868472);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (613662, to_date('20-06-2014', 'dd-mm-yyyy'), 'Ixeurrkkfcevzbcdoxksyhivyopaiqvrkbxnhyufxszmabqpnoeinlcxucoopczeehfxruinngrcysmmnqdkkfe', 936611);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (691193, to_date('25-07-2014', 'dd-mm-yyyy'), 'Zdwiwmnusqpkmostlhgiehfzbwyusvxzhpitnbqxiiseluodrhzdgogbroonhdqrwuucljtjyxksmrjvbaydphi', 924264);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (215557, to_date('13-01-2007', 'dd-mm-yyyy'), 'Obxtmlyuyigpmxlbmyupfmdszzbgyxnbwuxfcsdumdnzuzkfkhuwnljvxssjrvtkiotoltscrhgiqsaagreflkz', 417299);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (295344, to_date('11-03-2010', 'dd-mm-yyyy'), 'Celetkjhdkrkhwxznhexlrqoaijkkmvwfdeyaytzqmhjoyhzjiowxdrjyburcfttooxpgkjpltewrhjyypavjbm', 319162);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (481975, to_date('29-08-2019', 'dd-mm-yyyy'), 'Coenprlbpsanafylyjynmaxfqsjfklavumikiyvxbsfokrurcjqkkpkmvqfempiuudumbfslryfpwllbummtado', 258488);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (511193, to_date('13-06-2007', 'dd-mm-yyyy'), 'Zhdyjxcmkwdwztahllxxdrhqkfwpzfrcjovpeyruzpeegtrmlrmrspbeuynkhuvitzddpbkoqnezwytyofwgfxx', 987167);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (354337, to_date('01-10-2014', 'dd-mm-yyyy'), 'Yueumzchybzlimvnibzilapvcwbcvknphyufyctsklvmcvgfdczxsapdwgvowbydkntnnmporfrciqmyopkgzrs', 814567);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (934818, to_date('01-12-1978', 'dd-mm-yyyy'), 'Gepzmpcedrcscztdwpknwrbqyazxhfmvxeepqeovgsgusceibzcuusvwljalibpwvvzyfqcvchalerwkofcvwqe', 977134);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (542564, to_date('15-08-1971', 'dd-mm-yyyy'), 'Sugrjczjjkdgsctxfipsiqixgrqpgzbqdmjrlysulfiymflmahebehkkyecvpqukgpwfwawgbeencktwjitajtu', 668164);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (259618, to_date('26-03-1997', 'dd-mm-yyyy'), 'Jpsflklxgaiftpwvigiwjbsbcbtsfpbzpdlnfdxywaeissxshcbyrplgwkiaaczdifgwhcwmrtqpsucpgqgajia', 937781);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (712889, to_date('13-12-1998', 'dd-mm-yyyy'), 'Uvoryhokoaqckotfotaqzrxedwvqovgvxkfbgpxkwpcljggdukwvnrzinedpompdimtwclskkwlyjeoclzclygk', 681235);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (216365, to_date('26-11-1988', 'dd-mm-yyyy'), 'Zaqajmvprvsukqanlsgabndgzslllycmcxjiwftkchthzowtstbjecwowgabgrrpkzkiqxvclkbwjuajsvjhhlw', 698952);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (659645, to_date('04-02-1971', 'dd-mm-yyyy'), 'Yzelbvvrtyjiiskfejefhtahzcquzzffkemhbpcqqtvwmnnlrwzsgzafaagbhmxsnnxvcapxbpzmxwsbzqozlhl', 534494);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (586539, to_date('04-03-1971', 'dd-mm-yyyy'), 'Glsmckeymqyopdfrsueejpzcujlntqveyasgcrcohyyuhpnmlnidetgmrlscrazgfrrfywrozwnkbockoebsvjh', 928564);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (592199, to_date('23-02-2016', 'dd-mm-yyyy'), 'Ltnxnxkwxbgfrdgvaskoguigkiavvxreergyeecnhxfijfszcxngcrvfvhfsbdqhejhnhfdleqavsqyiulnroco', 324259);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (729412, to_date('08-09-2019', 'dd-mm-yyyy'), 'Wkopqakblugzjqhvbkyxqcumgnracrtpbchxkmgwebppkircvplyfaqbhhgewgnqntzleukxkvjozsuksfemnuk', 165536);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (392446, to_date('02-03-2002', 'dd-mm-yyyy'), 'Wjdiencmzrozpydjggkubztdsxdsuabpabhjqfqhdpotrskndnqfuhkwodgsoxntsqnldfnqztxwvozbhxnumde', 766753);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (675128, to_date('21-05-1992', 'dd-mm-yyyy'), 'Ylmjilqbklojghirjajbcoqnwhiwichpnqorycxjqtnosjszkihlbczxphqaaannnpdosfotjszvwpxurgkeyvp', 899232);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (373547, to_date('20-04-1992', 'dd-mm-yyyy'), 'Cmncihpkltiihepaogrcyjacxhfulpfpvokprsrlszewvxctfwiavgthnfqtyonjplhklhmtwkbubeanhtxkbwp', 379354);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (363681, to_date('24-06-2018', 'dd-mm-yyyy'), 'Uzkaqurtveigjkxmkttzveswgsdavnpsnykhydxufyhmscwohcgylzulqlouuktlbyvvjghpsnuszaqrrigesph', 944135);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (217286, to_date('21-02-2007', 'dd-mm-yyyy'), 'Vmctckzluhhlkfxqgubjwritlnckxevnorxsnbpjqeoxkmfeyohrdutdxwftleudqdmzktpjbttzyrfglroyaxt', 644968);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (751749, to_date('07-04-2015', 'dd-mm-yyyy'), 'Hcdigziscpqgoptwuslamjknsatimuscoeooyidymkplmjqznswgezdjjpjpfcomifdvxlyqvjsturcbarujlng', 127443);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (782632, to_date('16-01-1998', 'dd-mm-yyyy'), 'Qvsefqdaguxdqohylrxpzjpojjsfbzdqbciskhfzrgdipzjyfswmhorerdzvputvwaunmljbznuwafntddcgxea', 799136);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (339413, to_date('07-11-2019', 'dd-mm-yyyy'), 'Bcibbfjbumfiplrqawvkmaayicdosdycelndmsxugufsojscjtnqmilpkytlooobakzhrrjvxuvqyhtqixsvebj', 937781);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (122712, to_date('26-10-2016', 'dd-mm-yyyy'), 'Zjhxvfjulsqqkfukjjgtcgyhwphzmksrlxbhfinrsdtnyajhualwubfifzcycfzykkoabajeqzuuxdpdwqxbisp', 251756);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (756371, to_date('18-07-2017', 'dd-mm-yyyy'), 'Rfliueyrzdorynrcqwqvdgykxxzekgzexppralnsjxrpxpvltmhevjhkngrkebytusltdxvhfsncxrcgjuwsomx', 958314);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (423273, to_date('08-07-1985', 'dd-mm-yyyy'), 'Mobmigsqtxatwnzbengpvrprujvvlnpngnpddifkwojnxqfquisrwjwfhelcujkiycpvlgwkzrbklkvvvylfvop', 824772);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (381174, to_date('02-12-2006', 'dd-mm-yyyy'), 'Rmsuxnqgmalikclzyxpcimdekfbndibcpvxfreyeghqgbqphltrszkreuweslqcylxijkemmzsoxgcadybnrgwr', 426121);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (371331, to_date('25-09-2007', 'dd-mm-yyyy'), 'Dtrrchykftsdelvgojoruzakmcpdzqngffdrsosqnedwwkkfftarierzozzkdsunluggvglzttntqltzhkdfvpl', 477897);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (748524, to_date('10-05-1981', 'dd-mm-yyyy'), 'Probhnmxbhotmbjxeuuryhbskirpojtgyjwpvdhoitkigphinfpmrcjqqqrgkxothqgxyprtzwvfxqyqhvsijze', 262276);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (539338, to_date('26-05-2023', 'dd-mm-yyyy'), 'Rshmauammfnbytkluwleaweewfzasgaojqtlaqcspxsamtbhyenijhdygymsbrkjjtaiautdqvoijmpnohfrhrw', 214233);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (668836, to_date('07-12-2003', 'dd-mm-yyyy'), 'Vodwlcrknynlisazqktgwphrcsxcwcvjyagojjtvrrmsbzbzokhcvejhmmkoxmlbddscvzoehrwygiwhpvcurxg', 835233);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (646689, to_date('07-04-1986', 'dd-mm-yyyy'), 'Eeoqcuctaantxjihnqeqystjsyqqscuuyldkukxcgksckocsezhrzlogxtipqalvorbrdbnhhcjomqffohejuoi', 485274);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (743426, to_date('26-04-1975', 'dd-mm-yyyy'), 'Acbtmqifhuoltffwhavdcaaapuyxrfjllnhxflxdzygqzxmscqeurxxomdttbytpuqlnpkvpkfpknzlwlmlyfjo', 976191);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (939885, to_date('03-08-2015', 'dd-mm-yyyy'), 'Gigduozgtrmzzjasconfsdwngtbnxjkjpyyjfnhoyzbsjkrsoknlneqmkzrpunbujagqocaijpqcihunykgpzlm', 456142);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (577373, to_date('17-01-1980', 'dd-mm-yyyy'), 'Gtpovwipikvgijpjvoqhqzkvjozihzdnsngfjkoaohckqvrnecrdvssuuqavtlubrydjcsjzfjyycsqmtwteapm', 234178);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (282948, to_date('12-05-1998', 'dd-mm-yyyy'), 'Wltadhqvtrawcwxosjprrnjcdhhtbenmezhfmqhfioopnyzgrrqtwzzhwabepsushahpglzefqjufihidytysqr', 284657);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (163168, to_date('22-10-2005', 'dd-mm-yyyy'), 'Zuxdqfgjrrxvipzyjwdhufczbvicviewzhtqkaghappialuvpvzdigkprgtsiqixeojdofxxvmdiwaqqgdwogmc', 668164);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (187326, to_date('27-08-2021', 'dd-mm-yyyy'), 'Bwnenheirblcgywhtfbwnwofipxbxjwnlfgmejhwgahimizoiiyvjxadhzfaxrfovfydzdsoogluofsdkgjfawf', 821516);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (333952, to_date('21-07-1972', 'dd-mm-yyyy'), 'Nupztjqorvtauyxvsqkyhwqmmmshmvvatrzvpghvbouqrdtmwncmxxwzafcyifvgqqxdubgjzmytcqeffilzroq', 848765);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (724749, to_date('28-04-1994', 'dd-mm-yyyy'), 'Gloopyuezfpcgwyrygajmztsxebyrbhyvmacfoxjixepwcrxzlkqfvbidpfjnoorhxnkzrkpyruxuxhlbhbwoxk', 496964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (369755, to_date('27-12-1970', 'dd-mm-yyyy'), 'Dixeicfthhpfbyvmchdgnbqilyhciusbvxpyjxqamrgneymsreibtifwjqcmuwezkoanawetsiqcwyssboditek', 623573);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (881421, to_date('17-05-1974', 'dd-mm-yyyy'), 'Enaekmpvzdjembtozgsvrjntmatogqdvaypdvvvdhmutoywgghiqlilofssmwxvaxovsvznotantmalhdimrvhd', 783324);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (837239, to_date('13-04-1982', 'dd-mm-yyyy'), 'Mfgtwcsqayriyqgeihooasozxyotiqbeelatjgmjjawxpsumelimutjmlrcthqvejyzqboubapsulpelzgyjzjv', 346449);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (479471, to_date('23-10-1980', 'dd-mm-yyyy'), 'Gmghnqbtccwskqohrylxxnutbmdwktxmgcueauqmenlefuzhnosrdkywvfqzhypgmabybfxvzumuizqrymxyjkq', 814785);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (675254, to_date('24-06-2010', 'dd-mm-yyyy'), 'Kaiozzmdmjftyzsmjoqrillhtrygrjpfhngvuncozkskpdzwmobvpoffagjgqbmcliekxwqarfafesgfnxbfpgn', 477897);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (693267, to_date('19-11-1993', 'dd-mm-yyyy'), 'Wtitvylnfucljvmijjacohmzsjfrhnjjfnevqqfdnhncrffpicewtpqhqyxfjhwpzgblltlxeabukolvngbhqqk', 987433);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (599371, to_date('27-03-2022', 'dd-mm-yyyy'), 'Vlyxwvevccrkyhrqhlqfmznzrmnjybujicsenkumabsltrzerzjrqtowuiaibsvqtpeaawrwwnnedklhcgyejuz', 964955);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (873216, to_date('07-02-1982', 'dd-mm-yyyy'), 'Fgafhhtxuvtetrupeeqdcizfodbgiczpkjpbjiuqoattlrqpvzvdllirkcmnkesbndweklqeunizrckeearhvvq', 977196);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (618528, to_date('22-07-1981', 'dd-mm-yyyy'), 'Lpbpnabzumkanarxobfjmotzrmgzqoijzscxfqwoxdpevevordbjupufncwfymtnqtocwgsabncvgzphxbilplq', 481237);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (362842, to_date('21-05-2012', 'dd-mm-yyyy'), 'Rxmkuglsftvuwwlwniikmtjgntqctuzvgvpvuppcurrmxqrdeogbuifsoyhxtthzearqhkojonabihzptsdmvsl', 435731);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (589547, to_date('28-12-2007', 'dd-mm-yyyy'), 'Dxtfzpmwehdhefnseepejkrfsomnzvzysmtnpmaulvifpotlmanjwoihopcdfgpxaimxounegzcyzaexxfksopb', 197992);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (889414, to_date('22-03-1998', 'dd-mm-yyyy'), 'Oynukksukwnlaxaxwkiszmcoqpfhjkvnccpieetysvjolzuyitjpycwyrhyoizxduwncaipovuinmsgykixpekb', 644968);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (542326, to_date('30-10-2011', 'dd-mm-yyyy'), 'Uchyvvufidshswofmijzafuzfctxxxygtnbyugxxmspekszeanqgqmbhwbgkdgracwqavwodkfwxanhjtmstweo', 951887);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (971871, to_date('17-05-1990', 'dd-mm-yyyy'), 'Lrydkifasyzyjdexvuyvdpnbadxnjjrpsftmpiraseapngzbkyqynkqtzlefeavxtikfwkkskpwshbpaqypsolk', 379354);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (637956, to_date('18-10-2006', 'dd-mm-yyyy'), 'Sgifntsrujxukshbxwkwmljrushhpncslslolnzmhmhsasuwzeptjulgvpnlknsumjsapumtuwcdbikwglvobvn', 744769);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (583378, to_date('14-02-1998', 'dd-mm-yyyy'), 'Gdfaiiuehiveghpeguhauagbodaikgovtsyagtgmwhcowpnbrpddfmibguhoipeajlegvqkmbpnqkddgdrcunht', 217574);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (189418, to_date('16-02-2017', 'dd-mm-yyyy'), 'Lolecdlztiqhfagoybwdmravigzmjgdaqeyarmigndfvijmvkfbzpvzhmurtpexzdmzmbgfaospwkwpbavdaicc', 519646);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (976848, to_date('27-09-2008', 'dd-mm-yyyy'), 'Bpcqeayqoggnkdomifmtnpxccnxxdgrkquawmfhyrnucppaiwncslhtiotbiehcxdnsqneccsxhzaepnsncroah', 961549);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (778897, to_date('18-09-2017', 'dd-mm-yyyy'), 'Nxqyvefhtnlphkogobxegkhhsuxwfmfopkdyibmbjlvknuvnfckmahkqcusmghtgtbahyqxpajjkqliplawpoen', 522964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (418951, to_date('11-10-1999', 'dd-mm-yyyy'), 'Tuilxkcihnruadztkmafjiypyikoqvpgmtqpfmkkqihotvfdkphketfkksjznrhuowmtzufnjspqvdgvtldnsgg', 634346);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (478668, to_date('14-10-1998', 'dd-mm-yyyy'), 'Lqnkgizbagooqlvlmfttsaefollfkumcucjwoupdzgmqqrdjdfnlervzrkomdwnyuygkeifnkluujnuaeuxnglk', 325119);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (925215, to_date('27-09-2023', 'dd-mm-yyyy'), 'Kqteosghzzbomeuylesifhrfhktkecdpzyvkxuggajmltwgeeegjwsaiktkbbniknqdjzdlmzzfxbxnpumkuudm', 941218);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (564184, to_date('05-12-1989', 'dd-mm-yyyy'), 'Yaxdrkriiybwbnjeritvqkdoaiigncfmfxibfufuctrhupvpkzzubajarhgnmvgvrtvtattbazukokmcfgldlaq', 217574);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (874166, to_date('02-06-1976', 'dd-mm-yyyy'), 'Ifkpsiyjwhachrmbwzwvmmuvkklrpcoeyeaeaqyfgbafdbyzbzwayxttzilvhdgiljzmkpnlqmwlhilcobmiksj', 583224);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (242434, to_date('27-01-2014', 'dd-mm-yyyy'), 'Ymbzriahkxogdgwayililieaeujvvyjweryxhuaylfipgrsjpbuffurexabqgreookfzfmvgaftcrjqqrlhezpv', 399221);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (841481, to_date('13-11-2008', 'dd-mm-yyyy'), 'Piclsqtyxrxsteebmlamoibmymudpgvncfyttbmbrytdgfefcsfkafgrobsvtkxwuqcqciiahplvcfpxfxiqkvw', 623573);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (618697, to_date('24-12-1984', 'dd-mm-yyyy'), 'Sxlobcpnwnjfooitszxqbwudqueedaodscfgmelyzfbqcspdxfifcvbdnnwktrdsgrzzuepdueprbhxjndhbqyv', 418488);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (149483, to_date('19-01-1994', 'dd-mm-yyyy'), 'Nlkllhdgfyeaqdwwedmmbzdrahadiyfidamvfukyblbjiwuznfoezwqnclyibefmgmuztnokahsvwwdqktegnnx', 634346);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (198559, to_date('28-12-1976', 'dd-mm-yyyy'), 'Jsaoglekvgvaototzzqpcfqrkzohoijkhonqqnydrknvyxlhzqisunizxuzztfsimxojrdjctydbiqxcmuzvxte', 144335);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (384525, to_date('26-10-1971', 'dd-mm-yyyy'), 'Wwbmqnjoxevoqeqhkccnupefkzfzqzumwglfsxbzokswmbayaignaqxywargzrdawhpmobdqefvjoofcsmdijhz', 367497);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (555836, to_date('12-01-2022', 'dd-mm-yyyy'), 'Semhtoxewfrfrukdyxruygogpravqgfblwbhapwxqkiikfjasvvkbpwotyjdrqcreuepfdysfsvlnuhnmmuhbwh', 577836);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (127832, to_date('12-08-2020', 'dd-mm-yyyy'), 'Jrouktdtbjkjkdocriodwdymuglrsyrkdtpqxxzmdiyhsqmvyhpjsajpuofzlhwiifzkoptxeudklmrociwrohc', 575682);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (862823, to_date('13-03-2003', 'dd-mm-yyyy'), 'Ottslxkviewaulleljkleidqpincsuwrboajbpsircdxubmbtikcvznztgwiltmxxhpmjnmskusjfkrkubdlkrb', 696372);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (576322, to_date('07-02-2000', 'dd-mm-yyyy'), 'Eewcefpnarzzgbdlhzwlvksctaniplvuhaqbnkzfuagzpuphxtnahinruzqwjzcceuhwenxtdtdawbtaitgpujr', 546253);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (966689, to_date('22-08-1973', 'dd-mm-yyyy'), 'Psuzarytxqqzbqyfmtnovxpwaptfjktkovlexhwbgkbdhuvhyhvkibyzlbvulzhlnkguubknbaztookvtfldqlc', 146385);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (588766, to_date('03-01-2002', 'dd-mm-yyyy'), 'Ddlvcaulygpzwaitjkqgmgypcxfmhzmdclvutubshnwcmkudcsufnqiwnussrghsplpxvierqexbltyivqyiugz', 178171);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (625495, to_date('16-06-2016', 'dd-mm-yyyy'), 'Lmnsyvtgufhlelrahbkhsflfgcqjvxghrieewnfdflqrheellwhdoanzinqlvnoyghdapermzvshtctajyztcyv', 165555);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (972494, to_date('09-09-2013', 'dd-mm-yyyy'), 'Nfejhfkfrzzqnrrivdtelsbmyqvdqfgywzkyzvhtxwtidofhbagxluuuztvwtfnieidheqdfbdcijqvmisdjeva', 838524);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (241612, to_date('15-12-2001', 'dd-mm-yyyy'), 'Uxhbwayulveayzprelfsxxkyqmtufiwtosholocmhscvdguscmuxeadgiimshwrdjpbqzxosnxyvpbctmvdiyxv', 975531);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (923525, to_date('31-08-1998', 'dd-mm-yyyy'), 'Wkvqyqevmvkonsqaqzceegyglhbsvsnxvgwjvtomexznpowozqdgifmhojybvsvyxbmbewegnkdkuzckgcdyhiz', 913868);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (515456, to_date('07-09-2009', 'dd-mm-yyyy'), 'Ivhsroufwrvelbletzgmgfexctbavdidgfyxqfkwedvculdnjkrwkwoqblgvbdwkonmnpayjawuulezzqufgcrn', 762345);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (983879, to_date('10-01-2003', 'dd-mm-yyyy'), 'Lrgumpluxlefueppamfgueugocswsijvsoqevzqlsnsmmqehnmqqbyufrugozdbjduwnyljtbjryzfobyrzptad', 979593);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (659193, to_date('22-02-1974', 'dd-mm-yyyy'), 'Ydnazmzcqfelxcgmphtzxwhtlvsvrmplurlbhgzviliyppvxkzzisraipyaccmalyhwwqnahecdlguwvnbfnqtv', 193718);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (752575, to_date('12-08-1972', 'dd-mm-yyyy'), 'Kdzrepqevtlcozwdmvzwcuwoyeasevsdwvfhpgislxvskzvgevvxhsclmqdrovinldatrcmhsqpqjgipkubwkkv', 254611);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (814861, to_date('09-08-1976', 'dd-mm-yyyy'), 'Izwasvdkxybdniwwmtpuzmhplyhohnrtkjoehktowbqudltsxzxpxphipftczayoormdinvrunzyjjvuuybnzps', 254611);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (278812, to_date('04-04-2023', 'dd-mm-yyyy'), 'Ridozcjsuqpwbbbayxtdfcgkkaidfvixacclhoveesbhnizdruovsrhpujiqcnkugcbmfewmjqknuevyhvqqtug', 163538);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (378425, to_date('07-12-2003', 'dd-mm-yyyy'), 'Qujrtkbegeityitvfxgmrkaqwaamnbepkxvryawlrtcvepjoqgbrvjqssmiprpdiamdaprvejinaabgxvaeyrvh', 821516);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (643244, to_date('20-11-2023', 'dd-mm-yyyy'), 'Fjhwtvptwhqokohwhkohflmlyduqurkkafwjbnnaubllpysrkxzxlcmzfgworngdzkkwhgppfnztxryejwekuiq', 468277);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (542672, to_date('06-10-2010', 'dd-mm-yyyy'), 'Aqqyixgqaedplijmbssvyqndusjorkgtyyqiqonvmttzskwxajwioisswkpatzibzhyblztyptscekevuprxcms', 783324);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (728842, to_date('01-09-1989', 'dd-mm-yyyy'), 'Ndjgmhchhrztdsfpvhcmngwzxkojsnmkzqibtmygrpdbnninmlyowlgtodxvkdyuhpsvqerkjutjbfwqmgqcmbs', 881662);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (595417, to_date('10-09-1987', 'dd-mm-yyyy'), 'Zkllcukrhfghusqrtlvzhpfixdkiscfztdmuepxiaoqbwuafzajhhfymffpptcoxymflmgkhogairtxmowcddcz', 552954);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (723211, to_date('16-02-1987', 'dd-mm-yyyy'), 'Trieoipjilsffrmdgzsiqxxbzgwsxqbguhqyoxkbgatnsuzxvwgndovorcrulvqlzijhhnbpdiwwtlpuhbfdmbb', 854683);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (446946, to_date('12-05-1995', 'dd-mm-yyyy'), 'Jwlnzbgvzezxscmxpfsiswgjybzxejcotrpbvnhqapmjdlevnxbjyxbkxxiscohcthxaurshgyxdujglchpboof', 615292);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (527494, to_date('08-11-1984', 'dd-mm-yyyy'), 'Qsdslwzmgescswizdcxzfhgnyffyxjwuymjnidfqvbsnceszptzcqbrrnqptuufybbtduurcbzuluctjtnjbdva', 394876);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (991511, to_date('08-02-1983', 'dd-mm-yyyy'), 'Jiwskvcwsuwxvuoostfmdoqwbpglaftwafriopiwknmgfqdeabanvsodmumqghwtmrngxexzwrkdajwntlkfvnv', 237817);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (244858, to_date('27-12-1974', 'dd-mm-yyyy'), 'Nqtuvzrhayhbzgnmkvveybvrokhngayqsxvfbngceghriqghoqnlvqnmpvwhgpegsdnwnobxzmgixqbbnazrmum', 681494);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (774947, to_date('01-06-2005', 'dd-mm-yyyy'), 'Kvqtbnegmjgrxpjdfugbrhcsrtkznkszaeeroxtaoscqdjsbvtbtpehdeafjyamhrvysjfxpbrodojgykrpjutf', 682623);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (833293, to_date('28-10-2008', 'dd-mm-yyyy'), 'Gkuqpvricwlbvpwendrpndhahgmzryetayxihsbawcmbfkhmxsvbbrrbzkcizkargpxpyyvebtsxnaevvnbobvl', 854717);
commit;
prompt 400 records committed...
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (811416, to_date('13-12-1977', 'dd-mm-yyyy'), 'Feejnexddadkysjgplkfdxksashlijkdvlcwmqgqmykhkpchvnvzfgmjrucabluotjkvnkaubfyjorsjhgvzrak', 855636);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (816764, to_date('19-05-1991', 'dd-mm-yyyy'), 'Huqsnytnpubddpgoomjbrxkaevpbbvdtgoncdpfjsxvnlpjwcofsnstidgmsspkenitjturqltwrntxqkknpsjw', 821516);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (288997, to_date('04-09-2003', 'dd-mm-yyyy'), 'Wicsukgfpsznfbakqbqozmpqbcordhaauamciwfdwdiewzkfprmexwojfumgwsepubzikygblxvfmuxnzdasvvx', 586425);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (741676, to_date('10-06-2018', 'dd-mm-yyyy'), 'Cnepedgnxpxsbygkdcjwzwfrxdztakttblceabjpvarjcepstcmljrsknqakppfktxterlskfpiktfjrvytvtnz', 241979);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (657952, to_date('11-08-2000', 'dd-mm-yyyy'), 'Ifagvpcomtqqqmfobmmnwmfnfwnanzcsaitsbrjetktbbuknprhibmespaqjnggzypxokgdpmkwqyczbxevwpfj', 944135);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (623955, to_date('19-01-2011', 'dd-mm-yyyy'), 'Cmldhgjawpehdryihrklxkojgauzlhctdyxvlojcwimovwvytkqflbzhvdjyjuflosyhwcgahkiqtkhgkqwbnym', 936611);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (668473, to_date('03-11-1978', 'dd-mm-yyyy'), 'Egadplfmaxaatohwwnxxtjanmlrkzhaghnaytfccaeubnmtbmwpiykbcwbwltisugzxnmjnojovhukgnvmdiabl', 765978);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (623618, to_date('14-03-1975', 'dd-mm-yyyy'), 'Cpruvjgcxblqtvzlvsxvcfbjlodjzkneoxbtnvjyrrafugicobazlrepumofryodmxzuddgcxjjaawhjivbvygi', 762345);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (856228, to_date('25-04-2016', 'dd-mm-yyyy'), 'Jhkqxxjseewoyiyikuctoztpyelrbhwznjeqavkplplljuzqtpacjsrefwpqhawdjddzyqyabtaubwxwaltpjbk', 526878);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (358666, to_date('23-08-1979', 'dd-mm-yyyy'), 'Dyzjcqyqbrubiheymcyqaoqgyhivjjrkkkjxstzudvgoptsonzwaqzyfflvltbzndgtxadvrppkebrpqqbxibpd', 293134);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (153549, to_date('30-01-2004', 'dd-mm-yyyy'), 'Uzaqppkjhcxubbpijdrtdiievkugcvpyvlpmijfdnjgsavqqhapfbtbutjqadnbonlztmsfochytkmhngwqasfp', 586425);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (318317, to_date('20-03-2014', 'dd-mm-yyyy'), 'Idskanjxsnwxfdcngjyyyxvtqpvydqtvkhohvzkvnehwusovifctumffdtfglpqnexxgsnkkqfvergqbnovniii', 698952);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (868741, to_date('21-03-1990', 'dd-mm-yyyy'), 'Tjfkffvfbnqxxsjbnypjallmuetiaupxvwtfdxsfeiiducjkaxumczymcqusoxoymymgglazbaygkqzdvyzpvsy', 467767);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (331145, to_date('12-11-2016', 'dd-mm-yyyy'), 'Fzzoackrsyizbwsrppzhvoprupyokjzwgzuprglsucttqcalcmbextllosfmfxcqnpimaoefcrnkbrzttdqmddf', 683451);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (195593, to_date('10-12-1978', 'dd-mm-yyyy'), 'Silwjmdgjxusyrwlvpoihpqvtwralbgciymywdfjlwobevsthnhbbyiehfeqplngemgkusgftzactexunkgzpkn', 333588);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (857139, to_date('06-09-1991', 'dd-mm-yyyy'), 'Oqysfjoxnsqdfcjwyiyxpaxtyfooqtnwiofeudrbyvtwlngrdescpsbticsvtwlqpmcosxsuhpkcqeudvbfdxmc', 511542);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (446634, to_date('13-02-2023', 'dd-mm-yyyy'), 'Cskidvwyjhthrlzeuxpvvwluyazgcybojralqgohhryjkfsqwxzujxzrpkxcejfuiynwhjuhehazbczpfszilvw', 938259);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (853997, to_date('18-03-1978', 'dd-mm-yyyy'), 'Klmtasxsfzxvyhagqnxxlerefpjebgdzgyvadbsxvujjjvrtjclrcetharcyzbkpjtzhixzbqvlpvflprzwtcmq', 979593);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (438872, to_date('26-04-1972', 'dd-mm-yyyy'), 'Uxnmcqffltqbsfcormxegfpehbqojshldcpipzmcmzyawyybuzhzubllqglmwqisalzdleqqyspfhrfpljgjqbk', 868472);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (714797, to_date('20-09-2017', 'dd-mm-yyyy'), 'Ssnlywxbbbzsokojscbrvosjzpakkjnqbhzjktuoxempypausyodnxfptpkssqyeepszonhkyeothjatocoucsu', 939511);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (452687, to_date('15-03-1990', 'dd-mm-yyyy'), 'Chktcbdtjfedyohvqdjxqqmnmeitrbinwghehbgmpbnvasbcpyonjuijzzjkslomzuogufxqubcyerkywjdmgty', 237817);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (564973, to_date('16-11-1988', 'dd-mm-yyyy'), 'Uwjllnryfzbzhqnctplnbleqormjuswviwfahgeqftdolaebjwcxqrhehlyrbgkfkhjcmfvvkcrqozrhcszhsjt', 214233);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (847958, to_date('04-12-1978', 'dd-mm-yyyy'), 'Rrmokwplbmlihmnbumekoytvishafngmrgpimlcfjdtayqskspepkdrgmbrzvcmqnowyqhgxiuixhcythwqlhgs', 388351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (723249, to_date('18-06-2009', 'dd-mm-yyyy'), 'Ztllmbsetexallqseualrqidstcnmxhjvzfjutbtorrbivpvungksopytyuazsdanukrknxqqfifndadsafhvbm', 879964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (322194, to_date('29-12-1973', 'dd-mm-yyyy'), 'Mmycltcyatrwpgknxbsvuyzkeqzydcahtbgsnxyyzhqixabljzglpxybbpiunguraqpbxuiyebemequseqhvkdl', 299532);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (358276, to_date('01-08-1991', 'dd-mm-yyyy'), 'Ssryijalzzkybxcqwbfpcravtjivrrntplpjbubgjngfsdszezwavbnfumizlxtebzvxhxbplpytyhanlcvlxzn', 583224);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (555774, to_date('07-09-1979', 'dd-mm-yyyy'), 'Gokwvikzasskbegxgfuivrwpqieeytibxexejazobxbbbrjkoqqphvebcqqigirvlpygxlgfzuowiqlydljxylf', 152883);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (421465, to_date('10-02-2007', 'dd-mm-yyyy'), 'Glecpxdthwiwfzdscybamaahltnzixwbjuxetuccsrpgdtdwtiptqulqxjtypfezkulhggoshfvtczmccaszqsy', 568924);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (828135, to_date('09-02-1971', 'dd-mm-yyyy'), 'Byaaqrwhapbkdbmyanxtfwefbjuaetzultjorolklypvtpsdquksiqshimyqtcwvqybqanujhidststpntcgggy', 651392);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (591118, to_date('10-06-2003', 'dd-mm-yyyy'), 'Jqvrlnetawrtxayetqsaogcpzmchabdknwadufckslpiibjexjdlorokriiufikyggjpdkztcejqbcpmgqtzwda', 341175);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (395453, to_date('06-12-2014', 'dd-mm-yyyy'), 'Ondaqrnlyeggfhcqnxtprplxzudoybxzcbikdcedeltbmjredvmyspprrovwxwzybpbdhviutttnqvghvwciuiw', 724245);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (448874, to_date('09-04-2021', 'dd-mm-yyyy'), 'Kmqcerwycbghatguqtvgpvxplhotmozymysotcyjsnqgusldkmjcvbbllqmkqmhwwqccgtjzlrxqugjrfgzfjeg', 329156);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (162494, to_date('10-11-1973', 'dd-mm-yyyy'), 'Gskcslebozdkgtvzqhydruakyzvzhsxejsnuajfqydozzewouhxdyzxhwpqqrdqpebyfyeajeqsuoiolvmcgacl', 261842);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (455311, to_date('23-12-2019', 'dd-mm-yyyy'), 'Njofhymcdohmktgwbxpcnhplyfegkweyhgjiuwbhlqysufrsbbwzzpbghcglynxrgahblbytkajlipgtfzamnhm', 484519);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (413924, to_date('19-10-1992', 'dd-mm-yyyy'), 'Abipovimzxqktrmgmkakwxcbvemvmtvsqltaskxgtjozubkugrguauhgrcspeubmzekywnmcgwdwtzwreemmjtl', 839423);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (644298, to_date('18-03-1986', 'dd-mm-yyyy'), 'Fkjgebmfdycvazhiphifixgusktldwptebcvzujrupmjhvjfxkmqrgpwgirwgeknkyqlhehzqizqruxvudiqinb', 712238);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (992921, to_date('31-01-2020', 'dd-mm-yyyy'), 'Trvmdlzcprrhtakyncaousosspbccmzdjnkdnimqmaiqbiizophclsqpzhyrazfnmhcibimqcdkaanexcrcypsq', 683451);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (841964, to_date('08-10-1984', 'dd-mm-yyyy'), 'Vyafxwinsgukykqtyjplgxqcpaigqymtirqwvtvphgwbqdqyulhbjwybeyduxgyhooragftguyrmzhnrllppsnp', 269578);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (948171, to_date('25-01-2001', 'dd-mm-yyyy'), 'Qniokllnslnsblgjyijxmxtbpjlybpzdnpvlsvletmrtpdodwifpyqageuvzuvylwnrgixsdqxnwcwxzooxreup', 819964);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (356982, to_date('02-10-1972', 'dd-mm-yyyy'), 'Iqnppnksljrqhaagxisiyajjoxomaaeppwcdykejqkpbqdqsalsizhoaenbhrlyadqeyowdmstlitkmskiasenp', 885894);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (739666, to_date('13-02-1981', 'dd-mm-yyyy'), 'Btedmjqklhetisivsglifoezxptxisikqjsqgcjhkkudmxornqkwmblgxbjtvksovvqwqhjdfpmxrzdqbsudghk', 215143);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (368192, to_date('28-02-1985', 'dd-mm-yyyy'), 'Kycifbfymlboievmynsiccrzkhjsfyqtfmcirwwcahibrtpingsvdojxdrzwtoaizetfmhbuospmyqspxuaeyeh', 714687);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (596989, to_date('01-10-2002', 'dd-mm-yyyy'), 'Jixapiplrbklyclxthyugpkesrnucowyrlwwhgzghpsdcahcllqgdrqlfdgvbchwjhhhbsppbkrgilvorwcqxah', 459636);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (258423, to_date('17-01-2013', 'dd-mm-yyyy'), 'Nxjuhvonkexbajyzuurrguzrzohopeakgzvawnbvgpoiescimnoyjafazzmohszossnycgumohcryjhstuxsgxt', 681494);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (991667, to_date('09-06-2012', 'dd-mm-yyyy'), 'Evnwracumlvgzawvouzuygxcrbwcehzxptdyprhmsxvzuslyrgsvwqnbfnxvlrntryrngdcqbpokjtuqjwzivuh', 974567);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (511735, to_date('20-10-1978', 'dd-mm-yyyy'), 'Ppclzioxlizfrtlgykudgkaxjijdhhbhpeehiuadmghufpqssyjuemtbiysuftfwwnleevritqncniprrqfyizj', 612374);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (323636, to_date('02-07-1982', 'dd-mm-yyyy'), 'Jgginwupaobjvfyednqevpdfiyxxuoqzwsnraieazsgllbjsuukldljuhqbgnbevcxtntducwiszfazcuvbktag', 497687);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (584781, to_date('07-09-1989', 'dd-mm-yyyy'), 'Qhlacanpapyaaidbszazuberrcprpkxzufwtaphtzalrltrmlspcnogoyggrszenfipucmzpfefbthwvrxputgj', 324351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (735989, to_date('27-01-1997', 'dd-mm-yyyy'), 'Eiqxmlztuybxqjmimkcawblgannrhnssyarzrkvialwpsjwpkajuqdqepvjddwgtjvoxppaehzvvpqslhnlquzu', 334317);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (724819, to_date('26-03-1999', 'dd-mm-yyyy'), 'Strapyyxivvflovbvqjofnxezpedfmqjvfbjzwpcnyijstiyumnncmkjsighwyjjljymuazrchsvhkjamsoussi', 383922);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (441697, to_date('15-08-1994', 'dd-mm-yyyy'), 'Xcswupjtwzpkcgqwzhwliltsdlkgwxgagkiwiaowkwxruzlmepctslqymffhzquwnfcmtklpfzkyojxuwclmcvv', 617679);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (249915, to_date('30-11-2000', 'dd-mm-yyyy'), 'Rokouedmkpfnofpyxeolherdmpqsryausfbxjlipafduypgoyyunehvavdwbhxjqfykchudbmbybmpkoqxwsuib', 318784);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (179642, to_date('07-02-2020', 'dd-mm-yyyy'), 'Eafuvegnsbiljphjvnrzsgsbzrnhjqxomuftjdgishsdwtracwplzenlbtdwevqmoaavwvxjubecajzlduxrssi', 634346);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (654456, to_date('04-06-2009', 'dd-mm-yyyy'), 'Ikxmxzkwgcjybkzkfqdphunjxeglfpqscxjivgoioepplxahiglqbrvkpyvwfiufeydcruldsdidhmzzdpcqvsg', 814923);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (843515, to_date('10-08-2011', 'dd-mm-yyyy'), 'Xjiteqltsalmugklahegfpwbknmrmzfjowwmrbwtysbedpcxwamvqptyutqtivsizfhhslgdlxkucjexguakcau', 299749);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (127282, to_date('28-04-1997', 'dd-mm-yyyy'), 'Odjgbcjpeioibxcnavmfmrkanwofagdhuztjgmppqgpdxeadwjljfehhflmsqznywpahhkcquoupmtahztiwogk', 127443);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (164668, to_date('01-04-2014', 'dd-mm-yyyy'), 'Psdiofevtlbvxixqkaxgxhlpkisrlubbndvgpwzzuxffuddzdpxrtwawjyvonhazebaqyxuyfzbkixkwjjukpne', 457259);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (424345, to_date('01-06-1998', 'dd-mm-yyyy'), 'Zjkbvysldfadvdywtczstnhxkzursaasbxajnzlodrxqpfubrrdziqzykyhhwavbvzwpujaqtfaixbexkmmyezc', 142314);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (815564, to_date('15-10-1974', 'dd-mm-yyyy'), 'Jpwxgciczvefntpeofftytnaoosvipjgrhbddjddrkmydbgfoftrmuguviaebkzalmilyuxksqxcqpvtsydyeoa', 388351);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (928976, to_date('03-03-1998', 'dd-mm-yyyy'), 'Jmjpxobtuxvuccaqthtrjqqrczcofamspwvynyfudvkjxeylitnvsozaqpnmhcivdzitibrbxxbiaavlvxuhtua', 865349);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (948526, to_date('21-12-1989', 'dd-mm-yyyy'), 'Nuqanhagnkmkhknbhxyvygfmudxmjmbpypwqzozebqpjlozvbojmwbsnpshgfbfzrwcqcefaqlexrnkhkxadjak', 783724);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (826925, to_date('28-12-2005', 'dd-mm-yyyy'), 'Itecbafavbkagruhmgkaayyizasznzxljqjwpbuvycvqrukthcvvvgttrtjzdasesiovouabdownozzmpwdhzgg', 924698);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (558295, to_date('22-03-1973', 'dd-mm-yyyy'), 'Cxfbszybipcjwnbnsbzomoajcnqocnenahdooknbgwjzuglsjgeqyfvbvhpwwfrfjfjyseqeowzbcpgourvelhg', 293938);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (577867, to_date('25-07-1981', 'dd-mm-yyyy'), 'Satskycrpaanwppkuzrpebtyrwzffdztepcjhftemmymguijlporygfwokwjpgwxgeczkyiycyvhzbdmgsmucvx', 221689);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (794434, to_date('10-04-1995', 'dd-mm-yyyy'), 'Bckrsquqxrlekmqjqjblymwszhhbjlbahlqncfudhlavfzoqomajsfuecdiqlwkyjkriergxkqxeansqntldcqj', 546253);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (131472, to_date('28-06-1991', 'dd-mm-yyyy'), 'Sssznkuwsxpjucvsdszulokslxwlybwyaoqopsnrynorvrldfuicxzlemswsinatqsxyvneypgvisyqixioazty', 632974);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (783191, to_date('26-07-2001', 'dd-mm-yyyy'), 'Hnutikqijjhuuhammnlztcrhywujspkgytbymkivynbtqvawolaibmafrhjcblllvomusuksyacanyzhkfqxhjm', 696558);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (515651, to_date('28-03-2023', 'dd-mm-yyyy'), 'Mzgucxmzjamgbdqxdsnqnluhxntizrnsgfkjendtjebmejktoyfyoyszlbsfmcbhoeqhwqmvqrrbuaykklfhuzx', 778134);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (188724, to_date('24-02-1996', 'dd-mm-yyyy'), 'Iyjsinwbtjevhjdnrkhqcpeeztxvoflxmqbpazlfnwpqxhrtmwotkxtduurttxyxgslhnsdjqxgxqavnmbyxaao', 378729);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (587544, to_date('23-06-2019', 'dd-mm-yyyy'), 'Icalbvnjqykscnatglxeqmxaaepgqzvhpmdwflvzewozfuusradqqaydpzhmgzndhvjjgsqoyewgawvdzvfqrmc', 465979);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (382222, to_date('20-11-2010', 'dd-mm-yyyy'), 'Pplwivrifvfbewjpjsmkisnvadwzfrqtxzqncrbwqqqdqserztlspwlcrbxmbakvjhrytsftayrlxefonlgxgjh', 456142);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (691937, to_date('27-07-2022', 'dd-mm-yyyy'), 'Fivtpfaiygkzkopvwsninwnurwpwsziwihgbpgsfzsjoynvkdfaaxxxintomnlqxltoqxmfjxkgzbaloyynsdod', 217574);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (934433, to_date('28-12-1990', 'dd-mm-yyyy'), 'Cxjfqghxbfyfhcpqfytwrazawkfophmuqbtbbdymgzkkxrdgjrqieebmfcpimzitxjtivsmqmtovrrxthwpokzm', 639753);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (453891, to_date('08-03-1999', 'dd-mm-yyyy'), 'Vmdfpybxhfqriaflgkcwqmpxoivnigraffuzwfxvmkgrtrrpnlcpzoxruqohrgzbtdudonvwjvrauztoyencmro', 122174);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (778172, to_date('17-12-2001', 'dd-mm-yyyy'), 'Gwkoskpdlgyosypjxotashwzzzokzjrhprloxqgvrqybkrstmbjkycblljaiqeyfjyxgyuduscpwgkxhmsnihwe', 891425);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (285336, to_date('28-01-1998', 'dd-mm-yyyy'), 'Qdbpddvxpjinbbhhtkoxpiadzpjcmthmevbosxcdrjgzlenjecejxujrhegupkjiuspznqhjcfxyemcctttabka', 714687);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (117192, to_date('09-06-1979', 'dd-mm-yyyy'), 'Znkzibzpethkbzoxybwfdwapuhgihcstxvufgwnmyitbsdluuvgcedobtvqsikbdxjdunoyxdgqizjvkyebnwra', 799539);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (229596, to_date('20-12-2020', 'dd-mm-yyyy'), 'Eiczbgscccsuuryyjgjvicilkqtnvlbqrygguqwuucqwdfrpdwbixxzaerpvnylaixfeodsybmvjgvwfbobskrl', 974567);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (685183, to_date('24-07-1978', 'dd-mm-yyyy'), 'Mqzuhnkvqjlrpejisklmknwqpooeacwzccgymkiwyodntzmjsidshqemhjezsuyhkahzztxmbysjuzkxivrlltn', 893735);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (572175, to_date('30-03-1992', 'dd-mm-yyyy'), 'Xqqckholkechznpeggxooimastsrjmzvfmcgaipkgrbvxpknhuhugsezatvdnjcodikpxgeltyhimlctmutuxtr', 952842);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (719615, to_date('18-06-2017', 'dd-mm-yyyy'), 'Obalojqikqmputkocqswjivqpuqgkdsnnxbaaagrjrwdbqpsghocwmsgwfelotyhycovfsjmqotoasytuizwcoo', 411951);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (917626, to_date('25-07-2010', 'dd-mm-yyyy'), 'Rwpbkxolsrcuvljfxyfclgbtjahdcfjofcwwhiziyecwibsbppxrzavaotzrutdrrfyttcqehahuuqsxikycnnx', 532864);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (682487, to_date('09-02-1972', 'dd-mm-yyyy'), 'Fylgccjlnrgnokvazwrifzinnygzqyxwazrwvlrpcnfreseckakopgnhxqclqaggyzngmvbnezknvqicbtkrfap', 199474);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (647784, to_date('08-06-1997', 'dd-mm-yyyy'), 'Lmgkneeyydwnzpoubtdbguxmyemrvrakpcdgfphhwvmkxvdzrammjokohfysauxrpahxkzvmojzgewnkmhdoogy', 714687);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (774747, to_date('13-05-2006', 'dd-mm-yyyy'), 'Zciksrglhnfyhtcejttswzhteehabdhgxlxixdtobneubmbagnnuofrcutkvxleyzvmbhlnpmpjlgkhiiolfrjw', 961253);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (792385, to_date('17-10-1988', 'dd-mm-yyyy'), 'Otfptlscvucgnvkmuvmgzveairlzotlsdrgqqppriopogxlkkzomdjtwbtfmmmqggelvdshzgyykotovswznyjt', 662296);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (855753, to_date('01-05-1982', 'dd-mm-yyyy'), 'Dtqbewllhlmggyytqnpnoupkekyravlnoyjaomfhotdwwoeavbgwqenkxfpqcbqusnqdrvaofxklhhkklywkpti', 998412);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (864486, to_date('24-02-2002', 'dd-mm-yyyy'), 'Iznrxbwrlhmdxynuyqfihdiwxqbpdtpilulrqatqslatkpjptoholswskjpenjoalpcuktsbqwxbkhpkvoxmotk', 267665);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (384437, to_date('21-11-2017', 'dd-mm-yyyy'), 'Bszucbhexaijhpmnzjyivdkedthjzrbmboqcqdkrrceqezvegkfclipplrrldxbxvihbkzvxstksxtlfjcvdaeg', 226257);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (445356, to_date('28-09-2010', 'dd-mm-yyyy'), 'Lhmrdiuaqyglpckrzsokxflzjartresjxtktbjkhxdmmcutgiuaqcrpgefycbsiowommbimutqucypuexjpgvzz', 445426);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (451782, to_date('20-02-2018', 'dd-mm-yyyy'), 'Gkidwsalmmpapukvwxlncsrpmfyilkxcuixwbagmektpudslaeezbpgiptpsqxxwschdfisondqlcjllqfxeeud', 745367);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (549625, to_date('20-12-1998', 'dd-mm-yyyy'), 'Kztrjrlajzhmymuwybegjlbtcrnkzsbpfxzoctlwjuqebnpuhavyvbmkptwxfgpkbaemwwwvwcfjfjvndlqzugm', 472969);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (192235, to_date('15-06-2015', 'dd-mm-yyyy'), 'Qxhiidpsjwwbhksmsitoonhaahjkttqlmaybdmlhacvkbcvlnbpkbkoimnynpmpxoapqcmdgfepqjhqjptxmarn', 144156);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (994761, to_date('07-08-2012', 'dd-mm-yyyy'), 'Taqcysrkthipgrnpzzcbthsrfkrkkinehjysporbgrscwavsudbsvwwshcfiayihtoiatnbarocejispeduuaxl', 361251);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (292425, to_date('27-11-2001', 'dd-mm-yyyy'), 'Jebjxfqmgghdspchkmiwrfvwcxzsunlwbrvyoneovrzfmqoczxpzyygocgbwhchgscddoupywzvlbtsfpnheoky', 899232);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (221478, to_date('03-12-1971', 'dd-mm-yyyy'), 'Iffukusnipqysvhdifiesvlzggbywnakgyscklsvjhmjsarfmhenejmmdorjofwwpbdubawptisdxqqzjywyjdr', 977196);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (123159, to_date('19-01-2018', 'dd-mm-yyyy'), 'Oocayplvbgfzelqxfcvarjjtzihgwqtqjugqgkvxtnjglhrjjjdefmsckohrgmoxvljgshtbhjmzughdpksvrjc', 814835);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (236994, to_date('17-03-1971', 'dd-mm-yyyy'), 'Mfgszyebxoneyatwjuvzfoxtkqwoqiprmmkfwwjwrruhgybplmxvptehhdywacwxairmvxktgwxophgnuzkwctr', 647562);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (531156, to_date('12-02-2020', 'dd-mm-yyyy'), 'Wkcfmpybmertavtblbfmerjaylbwwdhfobxvyzijgotcojycaaxanfxexmjuccnwwomvcmwrngaviylrvokecod', 397394);
insert into MAINTENANCERECORD (recordid, dateofmaintenance, description_, vehicleid)
values (455561, to_date('10-06-2003', 'dd-mm-yyyy'), 'Xkriytouocrotkqvxetvwvhhynxxqgfvatgqniqtweyqtcbopfsyhdbbtzyguexjsdgiiuyztetvsrcdjyvfjbf', 568924);
commit;
prompt 500 records loaded
prompt Loading MADEMAINTENANCE...
insert into MADEMAINTENANCE (soldierid, recordid)
values (998897, 564973);
insert into MADEMAINTENANCE (soldierid, recordid)
values (643759, 564184);
insert into MADEMAINTENANCE (soldierid, recordid)
values (699268, 536274);
insert into MADEMAINTENANCE (soldierid, recordid)
values (601668, 482475);
insert into MADEMAINTENANCE (soldierid, recordid)
values (369909, 117192);
insert into MADEMAINTENANCE (soldierid, recordid)
values (950895, 362579);
insert into MADEMAINTENANCE (soldierid, recordid)
values (756301, 825337);
insert into MADEMAINTENANCE (soldierid, recordid)
values (384076, 334849);
insert into MADEMAINTENANCE (soldierid, recordid)
values (117418, 853997);
insert into MADEMAINTENANCE (soldierid, recordid)
values (630285, 236994);
insert into MADEMAINTENANCE (soldierid, recordid)
values (740158, 345234);
insert into MADEMAINTENANCE (soldierid, recordid)
values (267923, 821544);
insert into MADEMAINTENANCE (soldierid, recordid)
values (953250, 835331);
insert into MADEMAINTENANCE (soldierid, recordid)
values (833922, 339146);
insert into MADEMAINTENANCE (soldierid, recordid)
values (794199, 572742);
insert into MADEMAINTENANCE (soldierid, recordid)
values (327656, 127832);
insert into MADEMAINTENANCE (soldierid, recordid)
values (717850, 711238);
insert into MADEMAINTENANCE (soldierid, recordid)
values (183912, 179642);
insert into MADEMAINTENANCE (soldierid, recordid)
values (796195, 966689);
insert into MADEMAINTENANCE (soldierid, recordid)
values (224328, 695855);
insert into MADEMAINTENANCE (soldierid, recordid)
values (297345, 567983);
insert into MADEMAINTENANCE (soldierid, recordid)
values (721870, 167312);
insert into MADEMAINTENANCE (soldierid, recordid)
values (396576, 226823);
insert into MADEMAINTENANCE (soldierid, recordid)
values (134819, 751749);
insert into MADEMAINTENANCE (soldierid, recordid)
values (125980, 198623);
insert into MADEMAINTENANCE (soldierid, recordid)
values (297396, 351455);
insert into MADEMAINTENANCE (soldierid, recordid)
values (301292, 883368);
insert into MADEMAINTENANCE (soldierid, recordid)
values (361922, 998327);
insert into MADEMAINTENANCE (soldierid, recordid)
values (436276, 481839);
insert into MADEMAINTENANCE (soldierid, recordid)
values (126042, 168175);
insert into MADEMAINTENANCE (soldierid, recordid)
values (312279, 228492);
insert into MADEMAINTENANCE (soldierid, recordid)
values (900955, 633852);
insert into MADEMAINTENANCE (soldierid, recordid)
values (901304, 853997);
insert into MADEMAINTENANCE (soldierid, recordid)
values (409531, 224387);
insert into MADEMAINTENANCE (soldierid, recordid)
values (197432, 131997);
insert into MADEMAINTENANCE (soldierid, recordid)
values (933319, 417786);
insert into MADEMAINTENANCE (soldierid, recordid)
values (754814, 195593);
insert into MADEMAINTENANCE (soldierid, recordid)
values (277712, 189418);
insert into MADEMAINTENANCE (soldierid, recordid)
values (945783, 911515);
insert into MADEMAINTENANCE (soldierid, recordid)
values (632977, 777629);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583667, 531931);
insert into MADEMAINTENANCE (soldierid, recordid)
values (394735, 684913);
insert into MADEMAINTENANCE (soldierid, recordid)
values (912112, 586539);
insert into MADEMAINTENANCE (soldierid, recordid)
values (200551, 546116);
insert into MADEMAINTENANCE (soldierid, recordid)
values (404564, 761977);
insert into MADEMAINTENANCE (soldierid, recordid)
values (672620, 499276);
insert into MADEMAINTENANCE (soldierid, recordid)
values (267923, 267263);
insert into MADEMAINTENANCE (soldierid, recordid)
values (664989, 293123);
insert into MADEMAINTENANCE (soldierid, recordid)
values (294589, 814861);
insert into MADEMAINTENANCE (soldierid, recordid)
values (765676, 272335);
insert into MADEMAINTENANCE (soldierid, recordid)
values (337566, 164668);
insert into MADEMAINTENANCE (soldierid, recordid)
values (686752, 565871);
insert into MADEMAINTENANCE (soldierid, recordid)
values (681635, 592346);
insert into MADEMAINTENANCE (soldierid, recordid)
values (177807, 793267);
insert into MADEMAINTENANCE (soldierid, recordid)
values (644855, 542326);
insert into MADEMAINTENANCE (soldierid, recordid)
values (575615, 712889);
insert into MADEMAINTENANCE (soldierid, recordid)
values (983762, 596989);
insert into MADEMAINTENANCE (soldierid, recordid)
values (133272, 542326);
insert into MADEMAINTENANCE (soldierid, recordid)
values (591927, 424345);
insert into MADEMAINTENANCE (soldierid, recordid)
values (544948, 759157);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335180, 334849);
insert into MADEMAINTENANCE (soldierid, recordid)
values (759116, 238849);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583667, 613662);
insert into MADEMAINTENANCE (soldierid, recordid)
values (869967, 572175);
insert into MADEMAINTENANCE (soldierid, recordid)
values (433646, 645882);
insert into MADEMAINTENANCE (soldierid, recordid)
values (747321, 618528);
insert into MADEMAINTENANCE (soldierid, recordid)
values (706453, 618528);
insert into MADEMAINTENANCE (soldierid, recordid)
values (763442, 684913);
insert into MADEMAINTENANCE (soldierid, recordid)
values (543413, 538732);
insert into MADEMAINTENANCE (soldierid, recordid)
values (475298, 819859);
insert into MADEMAINTENANCE (soldierid, recordid)
values (647570, 835331);
insert into MADEMAINTENANCE (soldierid, recordid)
values (666601, 793267);
insert into MADEMAINTENANCE (soldierid, recordid)
values (933319, 516353);
insert into MADEMAINTENANCE (soldierid, recordid)
values (548719, 735343);
insert into MADEMAINTENANCE (soldierid, recordid)
values (743551, 742543);
insert into MADEMAINTENANCE (soldierid, recordid)
values (950507, 798793);
insert into MADEMAINTENANCE (soldierid, recordid)
values (240771, 343142);
insert into MADEMAINTENANCE (soldierid, recordid)
values (848823, 357621);
insert into MADEMAINTENANCE (soldierid, recordid)
values (569743, 831538);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335180, 162135);
insert into MADEMAINTENANCE (soldierid, recordid)
values (253900, 758166);
insert into MADEMAINTENANCE (soldierid, recordid)
values (617509, 398456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (632977, 258423);
insert into MADEMAINTENANCE (soldierid, recordid)
values (374180, 797399);
insert into MADEMAINTENANCE (soldierid, recordid)
values (331126, 466415);
insert into MADEMAINTENANCE (soldierid, recordid)
values (750281, 238849);
insert into MADEMAINTENANCE (soldierid, recordid)
values (644855, 654456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (912112, 515651);
insert into MADEMAINTENANCE (soldierid, recordid)
values (983154, 633852);
insert into MADEMAINTENANCE (soldierid, recordid)
values (773780, 121145);
insert into MADEMAINTENANCE (soldierid, recordid)
values (826275, 158289);
insert into MADEMAINTENANCE (soldierid, recordid)
values (761104, 281719);
insert into MADEMAINTENANCE (soldierid, recordid)
values (639023, 992921);
insert into MADEMAINTENANCE (soldierid, recordid)
values (959171, 241612);
insert into MADEMAINTENANCE (soldierid, recordid)
values (715495, 272777);
insert into MADEMAINTENANCE (soldierid, recordid)
values (678123, 535411);
insert into MADEMAINTENANCE (soldierid, recordid)
values (588081, 189418);
insert into MADEMAINTENANCE (soldierid, recordid)
values (664989, 418951);
insert into MADEMAINTENANCE (soldierid, recordid)
values (181864, 721437);
insert into MADEMAINTENANCE (soldierid, recordid)
values (269910, 556568);
commit;
prompt 100 records committed...
insert into MADEMAINTENANCE (soldierid, recordid)
values (591819, 786339);
insert into MADEMAINTENANCE (soldierid, recordid)
values (931157, 992921);
insert into MADEMAINTENANCE (soldierid, recordid)
values (630285, 143228);
insert into MADEMAINTENANCE (soldierid, recordid)
values (632977, 122712);
insert into MADEMAINTENANCE (soldierid, recordid)
values (843735, 792654);
insert into MADEMAINTENANCE (soldierid, recordid)
values (836089, 923525);
insert into MADEMAINTENANCE (soldierid, recordid)
values (183222, 994761);
insert into MADEMAINTENANCE (soldierid, recordid)
values (789069, 992921);
insert into MADEMAINTENANCE (soldierid, recordid)
values (743551, 646689);
insert into MADEMAINTENANCE (soldierid, recordid)
values (593954, 449627);
insert into MADEMAINTENANCE (soldierid, recordid)
values (933319, 535848);
insert into MADEMAINTENANCE (soldierid, recordid)
values (183222, 415527);
insert into MADEMAINTENANCE (soldierid, recordid)
values (513153, 966689);
insert into MADEMAINTENANCE (soldierid, recordid)
values (208026, 293123);
insert into MADEMAINTENANCE (soldierid, recordid)
values (182637, 131472);
insert into MADEMAINTENANCE (soldierid, recordid)
values (929656, 825337);
insert into MADEMAINTENANCE (soldierid, recordid)
values (611558, 873216);
insert into MADEMAINTENANCE (soldierid, recordid)
values (572415, 857139);
insert into MADEMAINTENANCE (soldierid, recordid)
values (844333, 162135);
insert into MADEMAINTENANCE (soldierid, recordid)
values (116436, 896528);
insert into MADEMAINTENANCE (soldierid, recordid)
values (326597, 351661);
insert into MADEMAINTENANCE (soldierid, recordid)
values (726404, 668836);
insert into MADEMAINTENANCE (soldierid, recordid)
values (681635, 382222);
insert into MADEMAINTENANCE (soldierid, recordid)
values (719462, 782632);
insert into MADEMAINTENANCE (soldierid, recordid)
values (307338, 153549);
insert into MADEMAINTENANCE (soldierid, recordid)
values (551005, 843515);
insert into MADEMAINTENANCE (soldierid, recordid)
values (557849, 238153);
insert into MADEMAINTENANCE (soldierid, recordid)
values (848331, 411752);
insert into MADEMAINTENANCE (soldierid, recordid)
values (960929, 991511);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335094, 376241);
insert into MADEMAINTENANCE (soldierid, recordid)
values (413001, 376241);
insert into MADEMAINTENANCE (soldierid, recordid)
values (797118, 398456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (167083, 934818);
insert into MADEMAINTENANCE (soldierid, recordid)
values (394735, 555836);
insert into MADEMAINTENANCE (soldierid, recordid)
values (102587, 285336);
insert into MADEMAINTENANCE (soldierid, recordid)
values (848823, 531931);
insert into MADEMAINTENANCE (soldierid, recordid)
values (155332, 682487);
insert into MADEMAINTENANCE (soldierid, recordid)
values (363343, 241612);
insert into MADEMAINTENANCE (soldierid, recordid)
values (447423, 856228);
insert into MADEMAINTENANCE (soldierid, recordid)
values (852809, 645882);
insert into MADEMAINTENANCE (soldierid, recordid)
values (513590, 339413);
insert into MADEMAINTENANCE (soldierid, recordid)
values (232017, 713689);
insert into MADEMAINTENANCE (soldierid, recordid)
values (912112, 393762);
insert into MADEMAINTENANCE (soldierid, recordid)
values (413001, 195476);
insert into MADEMAINTENANCE (soldierid, recordid)
values (297457, 339413);
insert into MADEMAINTENANCE (soldierid, recordid)
values (267796, 761839);
insert into MADEMAINTENANCE (soldierid, recordid)
values (459990, 723211);
insert into MADEMAINTENANCE (soldierid, recordid)
values (688080, 242434);
insert into MADEMAINTENANCE (soldierid, recordid)
values (469386, 998327);
insert into MADEMAINTENANCE (soldierid, recordid)
values (715495, 889414);
insert into MADEMAINTENANCE (soldierid, recordid)
values (135869, 693267);
insert into MADEMAINTENANCE (soldierid, recordid)
values (852186, 215423);
insert into MADEMAINTENANCE (soldierid, recordid)
values (290299, 922379);
insert into MADEMAINTENANCE (soldierid, recordid)
values (535461, 351661);
insert into MADEMAINTENANCE (soldierid, recordid)
values (111677, 739666);
insert into MADEMAINTENANCE (soldierid, recordid)
values (360765, 172592);
insert into MADEMAINTENANCE (soldierid, recordid)
values (361922, 983879);
insert into MADEMAINTENANCE (soldierid, recordid)
values (394735, 349639);
insert into MADEMAINTENANCE (soldierid, recordid)
values (165503, 794388);
insert into MADEMAINTENANCE (soldierid, recordid)
values (333020, 373547);
insert into MADEMAINTENANCE (soldierid, recordid)
values (478332, 262433);
insert into MADEMAINTENANCE (soldierid, recordid)
values (104524, 514327);
insert into MADEMAINTENANCE (soldierid, recordid)
values (676794, 599371);
insert into MADEMAINTENANCE (soldierid, recordid)
values (324630, 855753);
insert into MADEMAINTENANCE (soldierid, recordid)
values (551005, 195593);
insert into MADEMAINTENANCE (soldierid, recordid)
values (444711, 426991);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335094, 335245);
insert into MADEMAINTENANCE (soldierid, recordid)
values (134705, 378425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (726404, 539452);
insert into MADEMAINTENANCE (soldierid, recordid)
values (184598, 559119);
insert into MADEMAINTENANCE (soldierid, recordid)
values (201485, 997671);
insert into MADEMAINTENANCE (soldierid, recordid)
values (772498, 393762);
insert into MADEMAINTENANCE (soldierid, recordid)
values (250977, 936617);
insert into MADEMAINTENANCE (soldierid, recordid)
values (337511, 357748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (235449, 917626);
insert into MADEMAINTENANCE (soldierid, recordid)
values (507405, 657952);
insert into MADEMAINTENANCE (soldierid, recordid)
values (876301, 649329);
insert into MADEMAINTENANCE (soldierid, recordid)
values (802638, 172592);
insert into MADEMAINTENANCE (soldierid, recordid)
values (411649, 455561);
insert into MADEMAINTENANCE (soldierid, recordid)
values (859561, 646689);
insert into MADEMAINTENANCE (soldierid, recordid)
values (844333, 179791);
insert into MADEMAINTENANCE (soldierid, recordid)
values (676794, 511193);
insert into MADEMAINTENANCE (soldierid, recordid)
values (333020, 511193);
insert into MADEMAINTENANCE (soldierid, recordid)
values (678123, 516353);
insert into MADEMAINTENANCE (soldierid, recordid)
values (644325, 195593);
insert into MADEMAINTENANCE (soldierid, recordid)
values (937168, 259618);
insert into MADEMAINTENANCE (soldierid, recordid)
values (155952, 179791);
insert into MADEMAINTENANCE (soldierid, recordid)
values (717850, 988475);
insert into MADEMAINTENANCE (soldierid, recordid)
values (221565, 711226);
insert into MADEMAINTENANCE (soldierid, recordid)
values (719462, 684913);
insert into MADEMAINTENANCE (soldierid, recordid)
values (747321, 758166);
insert into MADEMAINTENANCE (soldierid, recordid)
values (964844, 759157);
insert into MADEMAINTENANCE (soldierid, recordid)
values (933319, 778126);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583116, 177151);
insert into MADEMAINTENANCE (soldierid, recordid)
values (558672, 853842);
insert into MADEMAINTENANCE (soldierid, recordid)
values (611570, 991667);
insert into MADEMAINTENANCE (soldierid, recordid)
values (554170, 741676);
insert into MADEMAINTENANCE (soldierid, recordid)
values (264063, 939885);
insert into MADEMAINTENANCE (soldierid, recordid)
values (967520, 415527);
insert into MADEMAINTENANCE (soldierid, recordid)
values (180861, 115824);
commit;
prompt 200 records committed...
insert into MADEMAINTENANCE (soldierid, recordid)
values (181864, 977658);
insert into MADEMAINTENANCE (soldierid, recordid)
values (765676, 398456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (168097, 453891);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335094, 285336);
insert into MADEMAINTENANCE (soldierid, recordid)
values (834007, 675128);
insert into MADEMAINTENANCE (soldierid, recordid)
values (789069, 623618);
insert into MADEMAINTENANCE (soldierid, recordid)
values (633275, 946673);
insert into MADEMAINTENANCE (soldierid, recordid)
values (211880, 455198);
insert into MADEMAINTENANCE (soldierid, recordid)
values (161141, 357748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (290299, 692647);
insert into MADEMAINTENANCE (soldierid, recordid)
values (126119, 729526);
insert into MADEMAINTENANCE (soldierid, recordid)
values (208026, 295425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (235449, 676188);
insert into MADEMAINTENANCE (soldierid, recordid)
values (201618, 948171);
insert into MADEMAINTENANCE (soldierid, recordid)
values (756210, 745845);
insert into MADEMAINTENANCE (soldierid, recordid)
values (958031, 542564);
insert into MADEMAINTENANCE (soldierid, recordid)
values (458521, 697695);
insert into MADEMAINTENANCE (soldierid, recordid)
values (267796, 835819);
insert into MADEMAINTENANCE (soldierid, recordid)
values (278049, 584781);
insert into MADEMAINTENANCE (soldierid, recordid)
values (404564, 676188);
insert into MADEMAINTENANCE (soldierid, recordid)
values (464468, 268232);
insert into MADEMAINTENANCE (soldierid, recordid)
values (200551, 577373);
insert into MADEMAINTENANCE (soldierid, recordid)
values (967520, 848395);
insert into MADEMAINTENANCE (soldierid, recordid)
values (429637, 386754);
insert into MADEMAINTENANCE (soldierid, recordid)
values (801685, 237568);
insert into MADEMAINTENANCE (soldierid, recordid)
values (763442, 778126);
insert into MADEMAINTENANCE (soldierid, recordid)
values (664989, 841964);
insert into MADEMAINTENANCE (soldierid, recordid)
values (988131, 937293);
insert into MADEMAINTENANCE (soldierid, recordid)
values (114797, 456227);
insert into MADEMAINTENANCE (soldierid, recordid)
values (134819, 798793);
insert into MADEMAINTENANCE (soldierid, recordid)
values (162853, 939885);
insert into MADEMAINTENANCE (soldierid, recordid)
values (201485, 393161);
insert into MADEMAINTENANCE (soldierid, recordid)
values (836895, 192874);
insert into MADEMAINTENANCE (soldierid, recordid)
values (918260, 357621);
insert into MADEMAINTENANCE (soldierid, recordid)
values (384076, 324599);
insert into MADEMAINTENANCE (soldierid, recordid)
values (492453, 535411);
insert into MADEMAINTENANCE (soldierid, recordid)
values (694056, 599371);
insert into MADEMAINTENANCE (soldierid, recordid)
values (810504, 292425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (475298, 482475);
insert into MADEMAINTENANCE (soldierid, recordid)
values (409051, 339146);
insert into MADEMAINTENANCE (soldierid, recordid)
values (721870, 781234);
insert into MADEMAINTENANCE (soldierid, recordid)
values (983762, 229596);
insert into MADEMAINTENANCE (soldierid, recordid)
values (840081, 417786);
insert into MADEMAINTENANCE (soldierid, recordid)
values (409051, 395453);
insert into MADEMAINTENANCE (soldierid, recordid)
values (912112, 524258);
insert into MADEMAINTENANCE (soldierid, recordid)
values (111613, 198623);
insert into MADEMAINTENANCE (soldierid, recordid)
values (950507, 143228);
insert into MADEMAINTENANCE (soldierid, recordid)
values (593954, 162135);
insert into MADEMAINTENANCE (soldierid, recordid)
values (808089, 685183);
insert into MADEMAINTENANCE (soldierid, recordid)
values (601668, 991511);
insert into MADEMAINTENANCE (soldierid, recordid)
values (184598, 443822);
insert into MADEMAINTENANCE (soldierid, recordid)
values (875446, 449883);
insert into MADEMAINTENANCE (soldierid, recordid)
values (950895, 879858);
insert into MADEMAINTENANCE (soldierid, recordid)
values (409531, 692647);
insert into MADEMAINTENANCE (soldierid, recordid)
values (760757, 351455);
insert into MADEMAINTENANCE (soldierid, recordid)
values (943556, 948171);
insert into MADEMAINTENANCE (soldierid, recordid)
values (532936, 948526);
insert into MADEMAINTENANCE (soldierid, recordid)
values (810237, 361885);
insert into MADEMAINTENANCE (soldierid, recordid)
values (104524, 479471);
insert into MADEMAINTENANCE (soldierid, recordid)
values (108002, 211178);
insert into MADEMAINTENANCE (soldierid, recordid)
values (324630, 195589);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583537, 778897);
insert into MADEMAINTENANCE (soldierid, recordid)
values (673839, 735343);
insert into MADEMAINTENANCE (soldierid, recordid)
values (572415, 281719);
insert into MADEMAINTENANCE (soldierid, recordid)
values (773780, 127282);
insert into MADEMAINTENANCE (soldierid, recordid)
values (661423, 242434);
insert into MADEMAINTENANCE (soldierid, recordid)
values (192335, 977181);
insert into MADEMAINTENANCE (soldierid, recordid)
values (639023, 659542);
insert into MADEMAINTENANCE (soldierid, recordid)
values (282991, 278812);
insert into MADEMAINTENANCE (soldierid, recordid)
values (755078, 185566);
insert into MADEMAINTENANCE (soldierid, recordid)
values (183723, 646689);
insert into MADEMAINTENANCE (soldierid, recordid)
values (354993, 272646);
insert into MADEMAINTENANCE (soldierid, recordid)
values (901304, 847958);
insert into MADEMAINTENANCE (soldierid, recordid)
values (908516, 515651);
insert into MADEMAINTENANCE (soldierid, recordid)
values (419983, 446946);
insert into MADEMAINTENANCE (soldierid, recordid)
values (636674, 558295);
insert into MADEMAINTENANCE (soldierid, recordid)
values (938809, 623955);
insert into MADEMAINTENANCE (soldierid, recordid)
values (589388, 896528);
insert into MADEMAINTENANCE (soldierid, recordid)
values (755078, 295425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (484281, 361885);
insert into MADEMAINTENANCE (soldierid, recordid)
values (333020, 446946);
insert into MADEMAINTENANCE (soldierid, recordid)
values (674205, 672993);
insert into MADEMAINTENANCE (soldierid, recordid)
values (717850, 285549);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335180, 862823);
insert into MADEMAINTENANCE (soldierid, recordid)
values (905574, 452491);
insert into MADEMAINTENANCE (soldierid, recordid)
values (438559, 157945);
insert into MADEMAINTENANCE (soldierid, recordid)
values (111677, 387315);
insert into MADEMAINTENANCE (soldierid, recordid)
values (641147, 782632);
insert into MADEMAINTENANCE (soldierid, recordid)
values (827389, 158333);
insert into MADEMAINTENANCE (soldierid, recordid)
values (183912, 715547);
insert into MADEMAINTENANCE (soldierid, recordid)
values (862158, 751749);
insert into MADEMAINTENANCE (soldierid, recordid)
values (425712, 295344);
insert into MADEMAINTENANCE (soldierid, recordid)
values (633275, 972494);
insert into MADEMAINTENANCE (soldierid, recordid)
values (513436, 928827);
insert into MADEMAINTENANCE (soldierid, recordid)
values (183222, 613662);
insert into MADEMAINTENANCE (soldierid, recordid)
values (933319, 843515);
insert into MADEMAINTENANCE (soldierid, recordid)
values (933319, 292425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (162853, 184637);
insert into MADEMAINTENANCE (soldierid, recordid)
values (111677, 417667);
insert into MADEMAINTENANCE (soldierid, recordid)
values (333934, 455198);
commit;
prompt 300 records committed...
insert into MADEMAINTENANCE (soldierid, recordid)
values (256765, 357748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (253900, 395453);
insert into MADEMAINTENANCE (soldierid, recordid)
values (394902, 951592);
insert into MADEMAINTENANCE (soldierid, recordid)
values (462687, 559119);
insert into MADEMAINTENANCE (soldierid, recordid)
values (188447, 582752);
insert into MADEMAINTENANCE (soldierid, recordid)
values (114797, 777629);
insert into MADEMAINTENANCE (soldierid, recordid)
values (471300, 162494);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335094, 582856);
insert into MADEMAINTENANCE (soldierid, recordid)
values (361922, 369755);
insert into MADEMAINTENANCE (soldierid, recordid)
values (219861, 564973);
insert into MADEMAINTENANCE (soldierid, recordid)
values (112644, 381174);
insert into MADEMAINTENANCE (soldierid, recordid)
values (875446, 539452);
insert into MADEMAINTENANCE (soldierid, recordid)
values (561065, 499276);
insert into MADEMAINTENANCE (soldierid, recordid)
values (374180, 965452);
insert into MADEMAINTENANCE (soldierid, recordid)
values (201618, 848395);
insert into MADEMAINTENANCE (soldierid, recordid)
values (682840, 954258);
insert into MADEMAINTENANCE (soldierid, recordid)
values (673839, 586539);
insert into MADEMAINTENANCE (soldierid, recordid)
values (513436, 988475);
insert into MADEMAINTENANCE (soldierid, recordid)
values (250977, 691937);
insert into MADEMAINTENANCE (soldierid, recordid)
values (445250, 285336);
insert into MADEMAINTENANCE (soldierid, recordid)
values (811403, 655318);
insert into MADEMAINTENANCE (soldierid, recordid)
values (394735, 345234);
insert into MADEMAINTENANCE (soldierid, recordid)
values (707368, 251922);
insert into MADEMAINTENANCE (soldierid, recordid)
values (998897, 272335);
insert into MADEMAINTENANCE (soldierid, recordid)
values (773780, 481975);
insert into MADEMAINTENANCE (soldierid, recordid)
values (887554, 645449);
insert into MADEMAINTENANCE (soldierid, recordid)
values (160706, 724749);
insert into MADEMAINTENANCE (soldierid, recordid)
values (357713, 772221);
insert into MADEMAINTENANCE (soldierid, recordid)
values (772498, 414133);
insert into MADEMAINTENANCE (soldierid, recordid)
values (755659, 511735);
insert into MADEMAINTENANCE (soldierid, recordid)
values (834478, 378425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (326597, 821544);
insert into MADEMAINTENANCE (soldierid, recordid)
values (613895, 777629);
insert into MADEMAINTENANCE (soldierid, recordid)
values (116436, 398456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (130363, 322194);
insert into MADEMAINTENANCE (soldierid, recordid)
values (477645, 745845);
insert into MADEMAINTENANCE (soldierid, recordid)
values (943556, 152675);
insert into MADEMAINTENANCE (soldierid, recordid)
values (632977, 555774);
insert into MADEMAINTENANCE (soldierid, recordid)
values (235449, 925215);
insert into MADEMAINTENANCE (soldierid, recordid)
values (945009, 541338);
insert into MADEMAINTENANCE (soldierid, recordid)
values (328827, 237568);
insert into MADEMAINTENANCE (soldierid, recordid)
values (540193, 449627);
insert into MADEMAINTENANCE (soldierid, recordid)
values (207346, 645882);
insert into MADEMAINTENANCE (soldierid, recordid)
values (460464, 339146);
insert into MADEMAINTENANCE (soldierid, recordid)
values (569011, 675128);
insert into MADEMAINTENANCE (soldierid, recordid)
values (661423, 546116);
insert into MADEMAINTENANCE (soldierid, recordid)
values (831379, 466593);
insert into MADEMAINTENANCE (soldierid, recordid)
values (544948, 781234);
insert into MADEMAINTENANCE (soldierid, recordid)
values (791625, 479645);
insert into MADEMAINTENANCE (soldierid, recordid)
values (197432, 972494);
insert into MADEMAINTENANCE (soldierid, recordid)
values (773963, 215423);
insert into MADEMAINTENANCE (soldierid, recordid)
values (668976, 889414);
insert into MADEMAINTENANCE (soldierid, recordid)
values (755078, 976848);
insert into MADEMAINTENANCE (soldierid, recordid)
values (436276, 599371);
insert into MADEMAINTENANCE (soldierid, recordid)
values (264063, 443822);
insert into MADEMAINTENANCE (soldierid, recordid)
values (280890, 281719);
insert into MADEMAINTENANCE (soldierid, recordid)
values (676794, 212748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (222100, 421465);
insert into MADEMAINTENANCE (soldierid, recordid)
values (478332, 584781);
insert into MADEMAINTENANCE (soldierid, recordid)
values (706453, 654456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (773019, 433658);
insert into MADEMAINTENANCE (soldierid, recordid)
values (374180, 826925);
insert into MADEMAINTENANCE (soldierid, recordid)
values (617509, 143228);
insert into MADEMAINTENANCE (soldierid, recordid)
values (639023, 212748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (672620, 872256);
insert into MADEMAINTENANCE (soldierid, recordid)
values (470454, 772221);
insert into MADEMAINTENANCE (soldierid, recordid)
values (495073, 478668);
insert into MADEMAINTENANCE (soldierid, recordid)
values (374180, 659645);
insert into MADEMAINTENANCE (soldierid, recordid)
values (409051, 927728);
insert into MADEMAINTENANCE (soldierid, recordid)
values (224328, 384525);
insert into MADEMAINTENANCE (soldierid, recordid)
values (908516, 744531);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583537, 711226);
insert into MADEMAINTENANCE (soldierid, recordid)
values (458521, 918884);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583537, 333952);
insert into MADEMAINTENANCE (soldierid, recordid)
values (586510, 691937);
insert into MADEMAINTENANCE (soldierid, recordid)
values (788430, 499276);
insert into MADEMAINTENANCE (soldierid, recordid)
values (529972, 127282);
insert into MADEMAINTENANCE (soldierid, recordid)
values (958031, 936617);
insert into MADEMAINTENANCE (soldierid, recordid)
values (491281, 285336);
insert into MADEMAINTENANCE (soldierid, recordid)
values (484281, 723149);
insert into MADEMAINTENANCE (soldierid, recordid)
values (240771, 455311);
insert into MADEMAINTENANCE (soldierid, recordid)
values (169789, 782632);
insert into MADEMAINTENANCE (soldierid, recordid)
values (639023, 835819);
insert into MADEMAINTENANCE (soldierid, recordid)
values (930744, 775231);
insert into MADEMAINTENANCE (soldierid, recordid)
values (184598, 798793);
insert into MADEMAINTENANCE (soldierid, recordid)
values (449775, 446946);
insert into MADEMAINTENANCE (soldierid, recordid)
values (429637, 354337);
insert into MADEMAINTENANCE (soldierid, recordid)
values (485069, 729412);
insert into MADEMAINTENANCE (soldierid, recordid)
values (540193, 971918);
insert into MADEMAINTENANCE (soldierid, recordid)
values (801207, 131639);
insert into MADEMAINTENANCE (soldierid, recordid)
values (408590, 774747);
insert into MADEMAINTENANCE (soldierid, recordid)
values (576839, 452687);
insert into MADEMAINTENANCE (soldierid, recordid)
values (808089, 541338);
insert into MADEMAINTENANCE (soldierid, recordid)
values (809906, 179642);
insert into MADEMAINTENANCE (soldierid, recordid)
values (602541, 131472);
insert into MADEMAINTENANCE (soldierid, recordid)
values (644729, 815564);
insert into MADEMAINTENANCE (soldierid, recordid)
values (876809, 212748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (748168, 499276);
insert into MADEMAINTENANCE (soldierid, recordid)
values (983762, 777629);
insert into MADEMAINTENANCE (soldierid, recordid)
values (312279, 318317);
commit;
prompt 400 records committed...
insert into MADEMAINTENANCE (soldierid, recordid)
values (470454, 918323);
insert into MADEMAINTENANCE (soldierid, recordid)
values (541094, 242434);
insert into MADEMAINTENANCE (soldierid, recordid)
values (384076, 542672);
insert into MADEMAINTENANCE (soldierid, recordid)
values (200551, 684913);
insert into MADEMAINTENANCE (soldierid, recordid)
values (577026, 677243);
insert into MADEMAINTENANCE (soldierid, recordid)
values (523408, 115824);
insert into MADEMAINTENANCE (soldierid, recordid)
values (116436, 357748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (998897, 228492);
insert into MADEMAINTENANCE (soldierid, recordid)
values (863669, 961736);
insert into MADEMAINTENANCE (soldierid, recordid)
values (904407, 368192);
insert into MADEMAINTENANCE (soldierid, recordid)
values (905574, 828135);
insert into MADEMAINTENANCE (soldierid, recordid)
values (470454, 393161);
insert into MADEMAINTENANCE (soldierid, recordid)
values (929656, 168175);
insert into MADEMAINTENANCE (soldierid, recordid)
values (435484, 455198);
insert into MADEMAINTENANCE (soldierid, recordid)
values (789069, 267263);
insert into MADEMAINTENANCE (soldierid, recordid)
values (201618, 939885);
insert into MADEMAINTENANCE (soldierid, recordid)
values (756301, 951976);
insert into MADEMAINTENANCE (soldierid, recordid)
values (819969, 781234);
insert into MADEMAINTENANCE (soldierid, recordid)
values (477362, 976848);
insert into MADEMAINTENANCE (soldierid, recordid)
values (509071, 429765);
insert into MADEMAINTENANCE (soldierid, recordid)
values (707368, 238153);
insert into MADEMAINTENANCE (soldierid, recordid)
values (654041, 743426);
insert into MADEMAINTENANCE (soldierid, recordid)
values (235449, 363681);
insert into MADEMAINTENANCE (soldierid, recordid)
values (515797, 395453);
insert into MADEMAINTENANCE (soldierid, recordid)
values (950507, 212748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (462687, 398456);
insert into MADEMAINTENANCE (soldierid, recordid)
values (391603, 988591);
insert into MADEMAINTENANCE (soldierid, recordid)
values (848823, 668836);
insert into MADEMAINTENANCE (soldierid, recordid)
values (126042, 273748);
insert into MADEMAINTENANCE (soldierid, recordid)
values (591399, 618273);
insert into MADEMAINTENANCE (soldierid, recordid)
values (443754, 773633);
insert into MADEMAINTENANCE (soldierid, recordid)
values (716113, 831538);
insert into MADEMAINTENANCE (soldierid, recordid)
values (630285, 113242);
insert into MADEMAINTENANCE (soldierid, recordid)
values (673752, 256484);
insert into MADEMAINTENANCE (soldierid, recordid)
values (261560, 549625);
insert into MADEMAINTENANCE (soldierid, recordid)
values (146990, 331145);
insert into MADEMAINTENANCE (soldierid, recordid)
values (738920, 659193);
insert into MADEMAINTENANCE (soldierid, recordid)
values (758228, 928976);
insert into MADEMAINTENANCE (soldierid, recordid)
values (639023, 567316);
insert into MADEMAINTENANCE (soldierid, recordid)
values (442084, 723149);
insert into MADEMAINTENANCE (soldierid, recordid)
values (459990, 978223);
insert into MADEMAINTENANCE (soldierid, recordid)
values (385229, 794318);
insert into MADEMAINTENANCE (soldierid, recordid)
values (464468, 195476);
insert into MADEMAINTENANCE (soldierid, recordid)
values (643143, 622546);
insert into MADEMAINTENANCE (soldierid, recordid)
values (521884, 368921);
insert into MADEMAINTENANCE (soldierid, recordid)
values (297322, 211178);
insert into MADEMAINTENANCE (soldierid, recordid)
values (643143, 774877);
insert into MADEMAINTENANCE (soldierid, recordid)
values (333020, 845452);
insert into MADEMAINTENANCE (soldierid, recordid)
values (647570, 623618);
insert into MADEMAINTENANCE (soldierid, recordid)
values (337566, 118454);
insert into MADEMAINTENANCE (soldierid, recordid)
values (873867, 918323);
insert into MADEMAINTENANCE (soldierid, recordid)
values (297457, 238153);
insert into MADEMAINTENANCE (soldierid, recordid)
values (905033, 157279);
insert into MADEMAINTENANCE (soldierid, recordid)
values (757015, 743426);
insert into MADEMAINTENANCE (soldierid, recordid)
values (583537, 383134);
insert into MADEMAINTENANCE (soldierid, recordid)
values (458521, 883368);
insert into MADEMAINTENANCE (soldierid, recordid)
values (636674, 977658);
insert into MADEMAINTENANCE (soldierid, recordid)
values (651520, 948171);
insert into MADEMAINTENANCE (soldierid, recordid)
values (674205, 857139);
insert into MADEMAINTENANCE (soldierid, recordid)
values (181864, 622546);
insert into MADEMAINTENANCE (soldierid, recordid)
values (182637, 173337);
insert into MADEMAINTENANCE (soldierid, recordid)
values (813975, 564184);
insert into MADEMAINTENANCE (soldierid, recordid)
values (591399, 216365);
insert into MADEMAINTENANCE (soldierid, recordid)
values (427631, 959333);
insert into MADEMAINTENANCE (soldierid, recordid)
values (557849, 556568);
insert into MADEMAINTENANCE (soldierid, recordid)
values (889684, 794434);
insert into MADEMAINTENANCE (soldierid, recordid)
values (669976, 351455);
insert into MADEMAINTENANCE (soldierid, recordid)
values (959171, 556568);
insert into MADEMAINTENANCE (soldierid, recordid)
values (301292, 433658);
insert into MADEMAINTENANCE (soldierid, recordid)
values (107181, 474997);
insert into MADEMAINTENANCE (soldierid, recordid)
values (557849, 715384);
insert into MADEMAINTENANCE (soldierid, recordid)
values (460464, 719615);
insert into MADEMAINTENANCE (soldierid, recordid)
values (125980, 928827);
insert into MADEMAINTENANCE (soldierid, recordid)
values (335180, 898289);
insert into MADEMAINTENANCE (soldierid, recordid)
values (408297, 221478);
insert into MADEMAINTENANCE (soldierid, recordid)
values (475353, 588766);
insert into MADEMAINTENANCE (soldierid, recordid)
values (440144, 245625);
insert into MADEMAINTENANCE (soldierid, recordid)
values (225335, 511735);
insert into MADEMAINTENANCE (soldierid, recordid)
values (682840, 487415);
insert into MADEMAINTENANCE (soldierid, recordid)
values (717850, 236994);
insert into MADEMAINTENANCE (soldierid, recordid)
values (130363, 131745);
insert into MADEMAINTENANCE (soldierid, recordid)
values (719462, 719615);
insert into MADEMAINTENANCE (soldierid, recordid)
values (479374, 741676);
insert into MADEMAINTENANCE (soldierid, recordid)
values (996704, 292425);
insert into MADEMAINTENANCE (soldierid, recordid)
values (207346, 421465);
insert into MADEMAINTENANCE (soldierid, recordid)
values (471652, 659645);
insert into MADEMAINTENANCE (soldierid, recordid)
values (429637, 343142);
insert into MADEMAINTENANCE (soldierid, recordid)
values (512844, 794434);
insert into MADEMAINTENANCE (soldierid, recordid)
values (359971, 113242);
insert into MADEMAINTENANCE (soldierid, recordid)
values (224328, 564973);
insert into MADEMAINTENANCE (soldierid, recordid)
values (628314, 865168);
insert into MADEMAINTENANCE (soldierid, recordid)
values (464468, 896528);
insert into MADEMAINTENANCE (soldierid, recordid)
values (385229, 995251);
insert into MADEMAINTENANCE (soldierid, recordid)
values (639219, 911515);
insert into MADEMAINTENANCE (soldierid, recordid)
values (743006, 868741);
insert into MADEMAINTENANCE (soldierid, recordid)
values (270239, 451782);
insert into MADEMAINTENANCE (soldierid, recordid)
values (165503, 853842);
insert into MADEMAINTENANCE (soldierid, recordid)
values (797118, 723149);
insert into MADEMAINTENANCE (soldierid, recordid)
values (130363, 618697);
insert into MADEMAINTENANCE (soldierid, recordid)
values (755659, 759157);
commit;
prompt 500 records loaded
prompt Enabling foreign key constraints for VEHICLE...
alter table VEHICLE enable constraint SYS_C008989;
prompt Enabling foreign key constraints for DRIVEAT...
alter table DRIVEAT enable constraint SYS_C008999;
alter table DRIVEAT enable constraint SYS_C009000;
prompt Enabling foreign key constraints for HADACCIDENT...
alter table HADACCIDENT enable constraint SYS_C009014;
alter table HADACCIDENT enable constraint SYS_C009015;
prompt Enabling foreign key constraints for HADTRIP...
alter table HADTRIP enable constraint SYS_C009004;
alter table HADTRIP enable constraint SYS_C009005;
prompt Enabling foreign key constraints for HASTRIPS...
alter table HASTRIPS enable constraint SYS_C008982;
alter table HASTRIPS enable constraint SYS_C008983;
prompt Enabling foreign key constraints for MAINTENANCERECORD...
alter table MAINTENANCERECORD enable constraint SYS_C008994;
prompt Enabling foreign key constraints for MADEMAINTENANCE...
alter table MADEMAINTENANCE enable constraint SYS_C009009;
alter table MADEMAINTENANCE enable constraint SYS_C009010;
prompt Enabling triggers for ACCIDENT...
alter table ACCIDENT enable all triggers;
prompt Enabling triggers for BASE...
alter table BASE enable all triggers;
prompt Enabling triggers for SOLDIER...
alter table SOLDIER enable all triggers;
prompt Enabling triggers for VEHICLE...
alter table VEHICLE enable all triggers;
prompt Enabling triggers for DRIVEAT...
alter table DRIVEAT enable all triggers;
prompt Enabling triggers for HADACCIDENT...
alter table HADACCIDENT enable all triggers;
prompt Enabling triggers for TRIP...
alter table TRIP enable all triggers;
prompt Enabling triggers for HADTRIP...
alter table HADTRIP enable all triggers;
prompt Enabling triggers for HASTRIPS...
alter table HASTRIPS enable all triggers;
prompt Enabling triggers for MAINTENANCERECORD...
alter table MAINTENANCERECORD enable all triggers;
prompt Enabling triggers for MADEMAINTENANCE...
alter table MADEMAINTENANCE enable all triggers;

set feedback on
set define on
prompt Done
