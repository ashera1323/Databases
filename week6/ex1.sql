CREATE TABLE suppliers (
  sid serial PRIMARY KEY,
  sname varchar(20),
  address varchar(100)
);

CREATE TABLE parts (
  pid serial PRIMARY KEY,
  pname varchar(20),
  colour varchar(8)
);

CREATE TABLE catalog (
  sid serial REFERENCES suppliers(sid),
  pid serial REFERENCES parts(pid),
  cost integer CHECK (cost >= 0)
);

INSERT INTO suppliers(sname, address) VALUES
  ('Yosemite Sham', 'Devil’s canyon, AZ'),
  ('Wiley E. Coyote', 'RR Asylum, NV'),
  ('Elmer Fudd ', 'Carrot Patch, MN'),
  ('Ozon.ru', 'Russia'),
  ('HP', '221 Packer Street');

INSERT INTO parts(pname, colour) VALUES
  ('red1', 'red'),
  ('red2', 'red'),
  ('green1', 'green'),
  ('blue1', 'blue'),
  ('red3', 'red'),
  ('green2', 'green');

INSERT INTO catalog VALUES
  (1, 1, 10),
  (1, 2, 20),
  (1, 3, 30),
  (1, 4, 40),
  (1, 5, 50),
  (2, 1, 100),
  (2, 3, 150),
  (2, 5, 160),
  (5, 3, 300),
  (5, 4, 300),
  (5, 5, 120),
  (5, 6, 60);





-- 1. Names of suppliers who supply some red part
SELECT DISTINCT s.sname FROM suppliers s, catalog c, parts p WHERE
  s.sid=c.sid AND c.pid=p.pid AND p.colour='red';

-- 2. SIDs of suppliers who supply some red or green part
SELECT DISTINCT c.sid FROM catalog c, parts p WHERE
  c.pid=p.pid AND (p.colour='red' OR p.colour='green');

-- 3. SIDs of suppliers who supply some red part or are at 221 Packer Street
SELECT DISTINCT s.sid FROM suppliers s, catalog c, parts p WHERE
  c.sid=s.sid AND c.pid=p.pid AND (p.colour='red' OR s.address='221 Packer Street');
 
-- 4. SIDs of suppliers who supply every red or green part
SELECT DISTINCT c.sid FROM catalog c WHERE NOT EXISTS (
  SELECT p.pid FROM parts p WHERE NOT EXISTS (
    SELECT sid FROM catalog WHERE
      sid=c.sid AND pid=p.pid
  ) AND (p.colour='red' OR p.colour='green')
);

-- 5. SIDs of suppliers who supply every red part or every green part
SELECT DISTINCT c.sid FROM catalog c WHERE NOT EXISTS (
  SELECT p.pid FROM parts p WHERE NOT EXISTS (
    SELECT sid FROM catalog WHERE
      sid=c.sid AND pid=p.pid
  ) AND p.colour='red'
) OR NOT EXISTS (
  SELECT p.pid FROM parts p WHERE NOT EXISTS (
    SELECT sid FROM catalog WHERE
      sid=c.sid AND pid=p.pid
  ) AND p.colour='green'
);

-- 6. pairs of SIDs such that the suppliers with the first sid charges more 
--    for some part that the supplier with the second sid
SELECT DISTINCT s1.sid, s2.sid FROM suppliers s1, suppliers s2, catalog c1, catalog c2 WHERE
  c1.cost > c2.cost AND s1 != s2;

-- 7. PIDs of parts supplied by at least 2 different suppliers
SELECT c.pid FROM catalog c WHERE EXISTS (
SELECT c1.sid FROM catalog c1 WHERE c1.pid = c.pid AND c1.sid != c.sid
);

-- 8. avarage cost of red parts and green parts for each of the suppliers
SELECT avg(c2.cost) FROM catalog c1, catalog c2 WHERE 
C1.pid=C2.pid;

-- 9. sids od suppliers whose most expensive part costs $50 or more
SELECT catalog.sid MAX(catalog.cost FROM catalog WHERE 
catalog.cost >= 50 
    GROUP BY catalog.sid;