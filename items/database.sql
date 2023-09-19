INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('salad', 'Salat', 0.1, 0, 1),
    ('burgerbread', 'Burgerbolle', 0.1, 0, 1),
    ('cheese', 'Ost', 0.1, 0, 1),
    ('beef', 'Bøf', 0.1, 0, 1),
    ('oil', 'Olie', 0.1, 0, 1),
    ('salt', 'Salt', 0.1, 0, 1),
    ('burgershot_burger', 'Burger', 0.1, 0, 1),
    ('milkshake', 'Milkshake', 0.1, 0, 1),
    ('fries', 'Pomfritter', 0.1, 0, 1)
;

INSERT IGNORE INTO `jobs` (name, label) VALUES
	('burgershot','Burgershot')
;

INSERT IGNORE INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('burgershot',0,'medarbejder','Medarbejder',0,'{}','{}')
;
