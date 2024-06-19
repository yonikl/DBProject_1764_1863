/*Ensure DamageLevel is within a valid range */
ALTER TABLE Accident
ADD CONSTRAINT chk_damage_level CHECK (DamageLevel BETWEEN 1 AND 10);

/*Enforce a minimum age requirement for soldiers*/
ALTER TABLE Soldier
ADD CONSTRAINT chk_age CHECK (DateOfBirth <= DATE '2006-10-01');

/*Default status for new vehicles*/
ALTER TABLE Vehicle
MODIFY Status VARCHAR2(30) DEFAULT 'Active';

commit;
