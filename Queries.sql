=======================================EASY QUERIES======================================

-- 1.List all active members
SELECT member_id, first_name, last_name
    -> FROM Members
    -> WHERE status = 'Active';
+-----------+------------+-----------+
| member_id | first_name | last_name |
+-----------+------------+-----------+
|         1 | Rajesh     | Kumar     |
|         2 | Priya      | Sharma    |
|         3 | Amit       | Patel     |
|         4 | Sneha      | Reddy     |
|         5 | Vikram     | Singh     |
|         6 | Ananya     | Iyer      |
|         7 | Karan      | Malhotra  |
|         8 | Deepa      | Nair      |
|        10 | Meera      | Joshi     |
|        11 | Arjun      | Rao       |
|        12 | Pooja      | Menon     |
+-----------+------------+-----------+
11 rows in set (0.21 sec)

-- 2.Show all membership plans with price greater than 2000
 SELECT plan_name, price
    -> FROM Membership_Plans
    -> WHERE price > 2000;
+---------------------+---------+
| plan_name           | price   |
+---------------------+---------+
| Standard Quarterly  | 2499.00 |
| Premium Semi-Annual | 4499.00 |
| Elite Annual        | 7999.00 |
+---------------------+---------+
3 rows in set (0.03 sec)

-- 3.Display members who joined in 2024
    SELECT first_name, last_name, join_date
    -> FROM Members
    -> WHERE YEAR(join_date) = 2024;
+------------+-----------+------------+
| first_name | last_name | join_date  |
+------------+-----------+------------+
| Rajesh     | Kumar     | 2024-01-10 |
| Priya      | Sharma    | 2024-01-15 |
| Sneha      | Reddy     | 2024-02-01 |
| Ananya     | Iyer      | 2024-01-20 |
| Karan      | Malhotra  | 2024-01-25 |
| Rohit      | Gupta     | 2024-02-05 |
| Meera      | Joshi     | 2024-02-10 |
| Pooja      | Menon     | 2024-01-05 |
+------------+-----------+------------+
8 rows in set (0.03 sec)

-- 4.Show trainers who are currently active
	SELECT first_name, last_name, specialization
    -> FROM Trainers
    -> WHERE status = 'Active';
+------------+-----------+----------------------+
| first_name | last_name | specialization       |
+------------+-----------+----------------------+
| Arjun      | Rao       | Strength Training    |
| Kavita     | Desai     | Yoga & Flexibility   |
| Sameer     | Mehta     | Cardio & Weight Loss |
| Neha       | Kapoor    | Functional Training  |
+------------+-----------+----------------------+
4 rows in set (0.01 sec)

-- 5.List all completed training sessions
	SELECT session_id, member_id, trainer_id, session_date
    -> FROM Training_Sessions
    -> WHERE status = 'Completed';
+------------+-----------+------------+--------------+
| session_id | member_id | trainer_id | session_date |
+------------+-----------+------------+--------------+
|          1 |         1 |          1 | 2024-02-12   |
|          2 |         1 |          1 | 2024-02-14   |
|          3 |         2 |          2 | 2024-02-13   |
|          4 |         3 |          3 | 2024-02-12   |
|          7 |         7 |          1 | 2024-02-15   |
|          9 |        11 |          4 | 2024-02-12   |
|         10 |        12 |          2 | 2024-02-13   |
+------------+-----------+------------+--------------+
7 rows in set (0.04 sec)

-- 6.Show total number of members
	SELECT COUNT(*) AS total_members
    -> FROM Members;
+---------------+
| total_members |
+---------------+
|            12 |
+---------------+
1 row in set (0.12 sec)

-- 7. Display payments made using UPI
	SELECT member_id, amount, payment_date
    -> FROM Payments
    -> WHERE payment_method = 'UPI';
+-----------+---------+--------------+
| member_id | amount  | payment_date |
+-----------+---------+--------------+
|         2 | 2499.00 | 2024-01-15   |
|         6 | 2499.00 | 2024-01-20   |
|         1 | 1500.00 | 2024-02-12   |
|        12 | 2499.00 | 2024-01-05   |
+-----------+---------+--------------+
4 rows in set (0.01 sec)

-- 8.Show members whose membership is expired
	SELECT member_id, status
    -> FROM Member_Memberships
    -> WHERE status = 'Expired';
+-----------+---------+
| member_id | status  |
+-----------+---------+
|         8 | Expired |
+-----------+---------+
1 row in set (0.05 sec)

=======================================MEDIUM QUERIES======================================

-- 9.Show member names with their membership plan names
	SELECT m.first_name, m.last_name, mp.plan_name
    -> FROM Members m
    -> JOIN Member_Memberships mm ON m.member_id = mm.member_id
    -> JOIN Membership_Plans mp ON mm.plan_id = mp.plan_id;
+------------+-----------+---------------------+
| first_name | last_name | plan_name           |
+------------+-----------+---------------------+
| Sneha      | Reddy     | Basic Monthly       |
| Deepa      | Nair      | Basic Monthly       |
| Meera      | Joshi     | Basic Monthly       |
| Priya      | Sharma    | Standard Quarterly  |
| Ananya     | Iyer      | Standard Quarterly  |
| Pooja      | Menon     | Standard Quarterly  |
| Rajesh     | Kumar     | Premium Semi-Annual |
| Vikram     | Singh     | Premium Semi-Annual |
| Arjun      | Rao       | Premium Semi-Annual |
| Amit       | Patel     | Elite Annual        |
| Karan      | Malhotra  | Elite Annual        |
+------------+-----------+---------------------+
11 rows in set (0.06 sec)

-- 10.Calculate total revenue collected
	SELECT SUM(amount) AS total_revenue
    -> FROM Payments
    -> WHERE status = 'Completed';
+---------------+
| total_revenue |
+---------------+
|      41491.00 |
+---------------+
1 row in set (0.02 sec)

-- 11.Show members who have taken personal training
	SELECT DISTINCT m.first_name, m.last_name
    -> FROM Members m
    -> JOIN Payments p ON m.member_id = p.member_id
    -> WHERE p.payment_type = 'Personal Training';
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Rajesh     | Kumar     |
| Amit       | Patel     |
+------------+-----------+
2 rows in set (0.02 sec)

-- 12.Show total number of sessions handled by each trainer
	SELECT t.first_name, t.last_name,
    -> COUNT(ts.session_id) AS total_sessions
    -> FROM Trainers t
    -> LEFT JOIN Training_Sessions ts
    -> ON t.trainer_id = ts.trainer_id
    -> GROUP BY t.trainer_id;
+------------+-----------+----------------+
| first_name | last_name | total_sessions |
+------------+-----------+----------------+
| Arjun      | Rao       |              4 |
| Kavita     | Desai     |              3 |
| Sameer     | Mehta     |              2 |
| Neha       | Kapoor    |              1 |
+------------+-----------+----------------+
4 rows in set (0.03 sec)

-- 13.Find average attendance duration
	SELECT AVG(duration_minutes) AS avg_duration
    -> FROM Attendance;
+--------------+
| avg_duration |
+--------------+
|      98.3333 |
+--------------+
1 row in set (0.03 sec)

-- 14.Show members with more than 2 attendance records
	SELECT member_id, COUNT(attendance_id) AS visits
    -> FROM Attendance
    -> GROUP BY member_id
    -> HAVING COUNT(attendance_id) > 2;
+-----------+--------+
| member_id | visits |
+-----------+--------+
|         1 |      3 |
+-----------+--------+
1 row in set (0.03 sec)

-- 15.Show highest membership plan price
	SELECT MAX(price) AS highest_price
    -> FROM Membership_Plans;
+---------------+
| highest_price |
+---------------+
|       7999.00 |
+---------------+
1 row in set (0.02 sec)

-- 16.Show total payments per payment method
	SELECT payment_method, SUM(amount) AS total_amount
    -> FROM Payments
    -> GROUP BY payment_method;
+----------------+--------------+
| payment_method | total_amount |
+----------------+--------------+
| Credit Card    |     10998.00 |
| UPI            |      8997.00 |
| Bank Transfer  |     20497.00 |
| Cash           |       999.00 |
+----------------+--------------+
4 rows in set (0.04 sec)

=====================================COMPLEX QUERIES=========================================

-- 17.Show top 3 highest paying members
	SELECT m.first_name, m.last_name,
    -> SUM(p.amount) AS total_paid
    -> FROM Members m
    -> JOIN Payments p ON m.member_id = p.member_id
    -> GROUP BY m.member_id
    -> ORDER BY total_paid DESC
    -> LIMIT 3;
+------------+-----------+------------+
| first_name | last_name | total_paid |
+------------+-----------+------------+
| Amit       | Patel     |    9999.00 |
| Karan      | Malhotra  |    7999.00 |
| Rajesh     | Kumar     |    5999.00 |
+------------+-----------+------------+
3 rows in set (0.05 sec)

-- 18.Show members who never attended gym
	SELECT m.first_name, m.last_name
    -> FROM Members m
    -> LEFT JOIN Attendance a ON m.member_id = a.member_id
    -> WHERE a.member_id IS NULL;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Sneha      | Reddy     |
| Deepa      | Nair      |
| Rohit      | Gupta     |
| Meera      | Joshi     |
+------------+-----------+
4 rows in set (0.00 sec)

-- 19.Find member with highest weight loss
	SELECT member_id,
    -> MAX(weight) - MIN(weight) AS weight_loss
    -> FROM Client_Progress
    -> GROUP BY member_id
    -> ORDER BY weight_loss DESC
    -> LIMIT 1;
+-----------+-------------+
| member_id | weight_loss |
+-----------+-------------+
|        11 |        7.00 |
+-----------+-------------+
1 row in set (0.00 sec)

-- 20.Show trainers who handled more than 2 sessions
	SELECT trainer_id, COUNT(session_id) AS session_count
    -> FROM Training_Sessions
    -> GROUP BY trainer_id
    -> HAVING COUNT(session_id) > 2;
+------------+---------------+
| trainer_id | session_count |
+------------+---------------+
|          1 |             4 |
|          2 |             3 |
+------------+---------------+
2 rows in set (0.00 sec)

-- 21.Show membership plans with most members enrolled
	SELECT mp.plan_name, COUNT(mm.member_id) AS total_members
    -> FROM Membership_Plans mp
    -> JOIN Member_Memberships mm ON mp.plan_id = mm.plan_id
    -> GROUP BY mp.plan_id
    -> ORDER BY total_members DESC
    -> LIMIT 1;
+---------------+---------------+
| plan_name     | total_members |
+---------------+---------------+
| Basic Monthly |             3 |
+---------------+---------------+
1 row in set (0.01 sec)


-- 22.Show monthly revenue
	SELECT MONTH(payment_date) AS month,
    ->        SUM(amount) AS monthly_revenue
    -> FROM Payments
    -> GROUP BY MONTH(payment_date);
+-------+-----------------+
| month | monthly_revenue |
+-------+-----------------+
|     1 |        19995.00 |
|    12 |         7999.00 |
|     2 |         4499.00 |
|    11 |         4499.00 |
|     9 |         4499.00 |
+-------+-----------------+
5 rows in set (0.00 sec)

-- 23.Show the names of members whose membership ends between 15-Feb-2024 and 15-Mar-2024.
SELECT m.first_name,
    ->        m.last_name,
    ->        mm.end_date
    -> FROM Members m
    -> JOIN Member_Memberships mm
    -> ON m.member_id = mm.member_id
    -> WHERE mm.end_date
    -> BETWEEN '2024-02-15'
    -> AND '2024-03-15';
+------------+-----------+------------+
| first_name | last_name | end_date   |
+------------+-----------+------------+
| Sneha      | Reddy     | 2024-03-01 |
| Deepa      | Nair      | 2024-02-17 |
| Meera      | Joshi     | 2024-03-10 |
| Arjun      | Rao       | 2024-03-01 |
+------------+-----------+------------+
4 rows in set (0.00 sec)

-- 24.Find second highest membership price
	SELECT DISTINCT price
    -> FROM Membership_Plans
    -> ORDER BY price DESC
    -> LIMIT 1 OFFSET 1;
+---------+
| price   |
+---------+
| 4499.00 |
+---------+
1 row in set (0.00 sec)


