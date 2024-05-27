
[General]
Version=1

[Preferences]
Username=
Password=2330
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=MADEMAINTENANCE
Count=500

[Record]
Name=SOLDIERID
Type=NUMBER
Size=
Data=List(select SoldierID from Soldier)
Master=

[Record]
Name=RECORDID
Type=NUMBER
Size=
Data=List(select RecordID from MaintenanceRecord)
Master=

