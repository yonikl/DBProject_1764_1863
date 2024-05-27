
[General]
Version=1

[Preferences]
Username=
Password=2069
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=HADACCIDENT
Count=500

[Record]
Name=ACCIDENTID
Type=NUMBER
Size=
Data=List(select AccidentID from Accident)
Master=

[Record]
Name=VEHICLEID
Type=NUMBER
Size=
Data=List(select VehicleID from Vehicle)
Master=

