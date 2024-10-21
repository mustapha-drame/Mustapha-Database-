USE pet_database;


INSERT INTO petPet (petName, owner, species, gender, birth, death) VALUES
    ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL),
    ('Fluffy', 'Owner', 'F', 'F', CURRENT_DATE(), NULL),  
    ('Kitten1', 'Fluffy', 'cat', 'M', CURRENT_DATE(), NULL),
    ('Kitten2', 'Fluffy', 'cat', 'M', CURRENT_DATE(), NULL),
    ('Kitten3', 'Fluffy', 'cat', 'F', CURRENT_DATE(), NULL),
    ('Kitten4', 'Fluffy', 'cat', 'F', CURRENT_DATE(), NULL),
    ('Kitten5', 'Fluffy', 'cat', 'F', CURRENT_DATE(), NULL);


INSERT INTO petEvent (petName, eventDate, eventType, remark) VALUES
    ('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
    ('Hammy', '2020-10-15', 'vet', 'antibiotics'),
    ('Claws', '1997-08-03', 'injury', 'broke the rib');


UPDATE petPet
SET death = '2020-09-01'
WHERE petName = 'Puffball';


DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'Dog';
