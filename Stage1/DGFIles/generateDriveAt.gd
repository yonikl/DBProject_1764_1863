
[General]
Version=1

[Preferences]
Username=
Password=2087
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=DRIVEAT
Count=500

[Record]
Name=DATEOFDRIVE
Type=DATE
Size=
Data=Random(1/1/1970, 1/5/2024)
Master=

[Record]
Name=SOLDIERID
Type=NUMBER
Size=
Data=List(select SoldierID from Soldier)
Master=

[Record]
Name=VEHICLEID
Type=NUMBER
Size=
Data=List(select VehicleID from Vehicle)
Master=

