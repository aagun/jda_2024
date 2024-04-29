-- 2. tampilkan jumlah perbaikan yang sudah dibayar
SELECT COUNT(*) AS paid_service
FROM services
WHERE status = 'paid';


-- 3. tampilkan tahun beserta jumlah perbaikan yang dilakukan pada tahun tersebut
SELECT YEAR(date) AS year,
       COUNT(*)   AS total_repairment
FROM services
WHERE status = 'on repair'
GROUP BY YEAR(date);


-- 4. tampilkan data client yang tidak pernah melakukan perbaikan ac
SELECT u.*,
       r.name AS role_description
FROM
    users u
    LEFT JOIN roles r ON u.role = r.id
    LEFT JOIN services s ON s.client_id = u.id
WHERE s.client_id IS NULL
  AND u.role = 3;




-- 5. tampilkan data client beserta jumlah perbaikan yang dilakukan, urutkan berdasarkan perbaikan terbanyak
SELECT u.*,
       r.name             AS role_description,
       COUNT(s.client_id) AS total_repairment
FROM users u
         LEFT JOIN roles r ON u.role = r.id
         LEFT JOIN services s ON u.id = s.client_id
WHERE
    u.role = 3
GROUP BY u.id
ORDER BY total_repairment DESC;


-- 6. tampilkan data technician beserta jumlah uang yang diperoleh, urutkan berdasarkan perolehan terbanyak.
SELECT u.*,
       r.name       AS role_description,
       SUM(d.price) AS total_earnings
FROM users u
         LEFT JOIN roles r ON u.role = r.id
         LEFT JOIN services s ON u.id = s.technician_id
         JOIN devices d ON s.ac_id = d.id
GROUP BY u.id
ORDER BY total_earnings DESC;
