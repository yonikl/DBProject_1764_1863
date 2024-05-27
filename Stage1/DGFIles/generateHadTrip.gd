
[General]
Version=1

[Preferences]
Username=
Password=2096
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=HADTRIP
Count=500

[Record]
Name=VEHICLEID
Type=NUMBER
Size=
Data=List(select VehicleID from Vehicle)
Master=

[Record]
Name=TRIPID
Type=NUMBER
Size=
Data=List(select TripID from Trip)
Master=

