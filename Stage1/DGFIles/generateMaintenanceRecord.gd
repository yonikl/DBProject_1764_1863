
[General]
Version=1

[Preferences]
Username=
Password=2776
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=MAINTENANCERECORD
Count=500

[Record]
Name=RECORDID
Type=NUMBER
Size=
Data=[111111]
Master=

[Record]
Name=DATEOFMAINTENANCE
Type=DATE
Size=
Data=Random(1/1/1970, 1/5/2024)
Master=

[Record]
Name=DESCRIPTION_
Type=VARCHAR2
Size=200
Data=[Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa]
Master=

[Record]
Name=VEHICLEID
Type=NUMBER
Size=
Data=List(select VehicleID from Vehicle)
Master=

