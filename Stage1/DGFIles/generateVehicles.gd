
[General]
Version=1

[Preferences]
Username=
Password=2200
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##YONI
Name=VEHICLE
Count=500

[Record]
Name=VEHICLEID
Type=NUMBER
Size=
Data=[111111]
Master=

[Record]
Name=MODEL_
Type=VARCHAR2
Size=30
Data=List(Merkava Mk.4,
=Merkava Mk.3,
=Merkava Mk.2,
=Merkava Mk.1,
=Namer,
=Eitan,
=Achzarit,
=Magach 7,
=Magach 6,
=Magach 5,
=Sho't Kal,
=M113 Zelda,
=Nagmachon,
=Puma,
=Nakpadon,
=IDF Caterpillar D9,
=M109 Doher,
=Soltam M-71,
=M270 MLRS,
=ATMOS 2000,
=Sholef,
=Pereh,
=Tiran 4,
=Tiran 5,
=Tiran 6,
=M88 Hercules,
=Eyal,
=David Light Armored Vehicle,
=Wolf Armored Vehicle,
=SandCat,
=Sufa (Storm) Jeep,
=Panther Command Vehicle,
=Humvee,
=Mahatz,
=RBY Mk 1,
=Hafiz,
=Nimda Shoet,
=Nimrod,
=Zibra,
=Doher,
=Keshet,
=Machbet,
=MANTIS,
=M270 Smashing,
=LYNX,
=RAMTA RBY,
=Gaash,
=PULS,
=MANTAK,
=Wildcat)
Master=

[Record]
Name=AQUISITIONDATE
Type=DATE
Size=
Data=Random(1/1/1970, 1/5/2024)
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=30
Data=List(Active,
=In Maintenance,
=Deployed,
=Out of Service,
=Under Repair)
Master=

[Record]
Name=BASEID
Type=NUMBER
Size=
Data=List(select BaseID from Base)
Master=

