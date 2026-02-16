
-- ============================================================================
-- PART 2: INSERT SAMPLE DATA
-- ============================================================================

-- Insert Membership Plans
INSERT INTO Membership_Plans (plan_name, duration_months, price, max_trainer_sessions) VALUES
('Basic Monthly', 1, 999.00, 0),
('Standard Quarterly', 3, 2499.00, 6),
('Premium Semi-Annual', 6, 4499.00, 24),
('Elite Annual', 12, 7999.00, 96);

-- Insert Members
INSERT INTO Members (first_name, last_name, email, phone, date_of_birth, gender, join_date, status) VALUES
('Rajesh', 'Kumar', 'rajesh.k@email.com', '9876543210', '1990-05-15', 'Male', '2024-01-10', 'Active'),
('Priya', 'Sharma', 'priya.s@email.com', '9876543211', '1992-08-22', 'Female', '2024-01-15', 'Active'),
('Amit', 'Patel', 'amit.p@email.com', '9876543212', '1988-03-10', 'Male', '2023-12-01', 'Active'),
('Sneha', 'Reddy', 'sneha.r@email.com', '9876543213', '1995-11-30', 'Female', '2024-02-01', 'Active'),
('Vikram', 'Singh', 'vikram.s@email.com', '9876543214', '1987-07-18', 'Male', '2023-11-15', 'Active'),
('Ananya', 'Iyer', 'ananya.i@email.com', '9876543215', '1993-09-25', 'Female', '2024-01-20', 'Active'),
('Karan', 'Malhotra', 'karan.m@email.com', '9876543216', '1991-04-12', 'Male', '2024-01-25', 'Active'),
('Deepa', 'Nair', 'deepa.n@email.com', '9876543217', '1994-12-05', 'Female', '2023-10-10', 'Active'),
('Rohit', 'Gupta', 'rohit.g@email.com', '9876543218', '1989-06-20', 'Male', '2024-02-05', 'Inactive'),
('Meera', 'Joshi', 'meera.j@email.com', '9876543219', '1996-02-14', 'Female', '2024-02-10', 'Active'),
('Arjun', 'Rao', 'arjun.r@email.com', '9876543220', '1985-03-25', 'Male', '2023-09-01', 'Active'),
('Pooja', 'Menon', 'pooja.m@email.com', '9876543221', '1998-07-08', 'Female', '2024-01-05', 'Active');

-- Insert Trainers
INSERT INTO Trainers (first_name, last_name, email, specialization, hire_date, hourly_rate, status) VALUES
('Arjun', 'Rao', 'arjun.rao@fitness.com', 'Strength Training', '2023-06-01', 800.00, 'Active'),
('Kavita', 'Desai', 'kavita.d@fitness.com', 'Yoga & Flexibility', '2023-07-15', 750.00, 'Active'),
('Sameer', 'Mehta', 'sameer.m@fitness.com', 'Cardio & Weight Loss', '2023-08-01', 850.00, 'Active'),
('Neha', 'Kapoor', 'neha.k@fitness.com', 'Functional Training', '2023-09-10', 900.00, 'Active');

-- Insert Member Memberships
INSERT INTO Member_Memberships (member_id, plan_id, start_date, end_date, status) VALUES
(1, 3, '2024-01-10', '2024-07-10', 'Active'),
(2, 2, '2024-01-15', '2024-04-15', 'Active'),
(3, 4, '2023-12-01', '2024-12-01', 'Active'),
(4, 1, '2024-02-01', '2024-03-01', 'Active'),
(5, 3, '2023-11-15', '2024-05-15', 'Active'),
(6, 2, '2024-01-20', '2024-04-20', 'Active'),
(7, 4, '2024-01-25', '2025-01-25', 'Active'),
(8, 1, '2023-10-10', '2024-02-17', 'Expired'),
(10, 1, '2024-02-10', '2024-03-10', 'Active'),
(11, 3, '2023-09-01', '2024-03-01', 'Active'),
(12, 2, '2024-01-05', '2024-04-05', 'Active');

-- Insert Training Sessions
INSERT INTO Training_Sessions (member_id, trainer_id, session_date, start_time, end_time, status) VALUES
(1, 1, '2024-02-12', '07:00:00', '08:00:00', 'Completed'),
(1, 1, '2024-02-14', '07:00:00', '08:00:00', 'Completed'),
(2, 2, '2024-02-13', '09:00:00', '10:00:00', 'Completed'),
(3, 3, '2024-02-12', '18:00:00', '19:00:00', 'Completed'),
(5, 2, '2024-02-15', '10:00:00', '11:00:00', 'Cancelled'),
(6, 3, '2024-02-13', '19:00:00', '20:00:00', 'No Show'),
(7, 1, '2024-02-15', '11:00:00', '12:00:00', 'Completed'),
(1, 1, '2024-02-19', '07:00:00', '08:00:00', 'Scheduled'),
(11, 4, '2024-02-12', '16:00:00', '17:00:00', 'Completed'),
(12, 2, '2024-02-13', '08:00:00', '09:00:00', 'Completed');

-- Insert Attendance Records
INSERT INTO Attendance (member_id, check_in_time, check_out_time, duration_minutes) VALUES
(1, '2024-02-12 06:45:00', '2024-02-12 08:30:00', 105),
(1, '2024-02-13 17:00:00', '2024-02-13 18:45:00', 105),
(1, '2024-02-14 06:50:00', '2024-02-14 08:15:00', 85),
(2, '2024-02-12 08:30:00', '2024-02-12 10:00:00', 90),
(2, '2024-02-13 08:45:00', '2024-02-13 10:15:00', 90),
(3, '2024-02-12 17:45:00', '2024-02-12 19:30:00', 105),
(3, '2024-02-14 18:00:00', '2024-02-14 20:00:00', 120),
(5, '2024-02-12 07:00:00', '2024-02-12 09:00:00', 120),
(6, '2024-02-13 18:30:00', '2024-02-13 20:00:00', 90),
(7, '2024-02-14 16:00:00', '2024-02-14 17:30:00', 90),
(11, '2024-02-12 16:00:00', '2024-02-12 17:30:00', 90),
(12, '2024-02-13 08:00:00', '2024-02-13 09:30:00', 90);

-- Insert Payments
INSERT INTO Payments (member_id, amount, payment_date, payment_method, payment_type, status) VALUES
(1, 4499.00, '2024-01-10', 'Credit Card', 'Membership Fee', 'Completed'),
(2, 2499.00, '2024-01-15', 'UPI', 'Membership Fee', 'Completed'),
(3, 7999.00, '2023-12-01', 'Bank Transfer', 'Membership Fee', 'Completed'),
(4, 999.00, '2024-02-01', 'Cash', 'Membership Fee', 'Completed'),
(5, 4499.00, '2023-11-15', 'Credit Card', 'Membership Fee', 'Completed'),
(6, 2499.00, '2024-01-20', 'UPI', 'Membership Fee', 'Completed'),
(7, 7999.00, '2024-01-25', 'Bank Transfer', 'Membership Fee', 'Completed'),
(1, 1500.00, '2024-02-12', 'UPI', 'Personal Training', 'Completed'),
(3, 2000.00, '2024-02-13', 'Credit Card', 'Personal Training', 'Completed'),
(11, 4499.00, '2023-09-01', 'Bank Transfer', 'Membership Fee', 'Completed'),
(12, 2499.00, '2024-01-05', 'UPI', 'Membership Fee', 'Completed');

-- Insert Client Progress
INSERT INTO Client_Progress (member_id, measurement_date, weight, body_fat_percentage, bmi) VALUES
(1, '2024-01-10', 85.5, 22.5, 26.8),
(1, '2024-02-10', 83.2, 20.8, 26.1),
(2, '2024-01-15', 62.0, 28.5, 23.5),
(3, '2023-12-01', 92.0, 25.0, 28.5),
(3, '2024-01-01', 89.5, 23.5, 27.8),
(3, '2024-02-01', 87.0, 22.0, 27.0),
(5, '2023-11-15', 78.0, 18.5, 24.5),
(11, '2023-09-01', 95.0, 30.0, 29.5),
(11, '2024-02-01', 88.0, 26.0, 27.3);
