
[General]
Version=1

[Preferences]
Username=
Password=2106
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=HASTRIPS
Count=500

[Record]
Name=SOLDIERID
Type=NUMBER
Size=
Data=List(select SoldierID from Soldier)
Master=

[Record]
Name=TRIPID
Type=NUMBER
Size=
Data=List(select TripID from Trip)
Master=

