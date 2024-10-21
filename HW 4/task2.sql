
INSERT INTO petEvent (petName, eventDate, eventType, remark) VALUES
    ('Fluffly', '2020-10-15', 'vet', 'antibiotics'),
    ('Hammy', '2020-20-15', 'vet', 'antibiotics'),
    ('Claws', '1997-08-03', 'injury', 'broke the rib');

INSERT INTO petPet (petName, owner, species, gender, birth, death)
    ('Hammy', 'Diane', 'M', 'hamster', '2010-10-30', NULL),
    ('Kitten1', 'Fluffy', 'M', NULL, CURRENT_DATE(), NULL),
    ('Kitten2', 'Fluffy', 'M', NULL, CURRENT_DATE(), NULL),
    ('Kitten3', 'Fluffy', 'F', NULL, CURRENT_DATE(), NULL),
    ('Kitten4', 'Fluffy', 'F', NULL, CURRENT_DATE(), NULL),
    ('Kitten5', 'Fluffy', 'F', NULL, CURRENT_DATE(), NULL);

UPDATE petPet
SET death = '2020-09-01'
WHERE petName = 'Puffball'

DELETE FROM petPet
WHERE owner = 'Harold' AND species = 'Dog';