-- ============================================================================
-- FITNESS CENTER MEMBERSHIP SYSTEM 
-- ===========================================================================

-- ============================================================================
-- PART 1: DATABASE AND TABLE CREATION
-- ============================================================================

DROP DATABASE IF EXISTS fitness_center;
CREATE DATABASE fitness_center;
USE fitness_center;

-- Table 1: Members
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    join_date DATE NOT NULL,
    status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active'
);

-- Table 2: Membership_Plans
CREATE TABLE Membership_Plans (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    duration_months INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    max_trainer_sessions INT DEFAULT 0
);

-- Table 3: Member_Memberships
CREATE TABLE Member_Memberships (
    membership_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    plan_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('Active', 'Expired', 'Cancelled') DEFAULT 'Active',
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (plan_id) REFERENCES Membership_Plans(plan_id)
);

-- Table 4: Trainers
CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialization VARCHAR(100),
    hire_date DATE NOT NULL,
    hourly_rate DECIMAL(10, 2),
    status ENUM('Active', 'On Leave', 'Inactive') DEFAULT 'Active'
);

-- Table 5: Training_Sessions
CREATE TABLE Training_Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    trainer_id INT NOT NULL,
    session_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled', 'No Show') DEFAULT 'Scheduled',
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

-- Table 6: Attendance
CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    check_in_time DATETIME NOT NULL,
    check_out_time DATETIME,
    duration_minutes INT,
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Table 7: Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Cash', 'Credit Card', 'UPI', 'Bank Transfer') NOT NULL,
    payment_type ENUM('Membership Fee', 'Personal Training', 'Other') NOT NULL,
    status ENUM('Completed', 'Pending', 'Failed') DEFAULT 'Completed',
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Table 8: Client_Progress
CREATE TABLE Client_Progress (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT NOT NULL,
    measurement_date DATE NOT NULL,
    weight DECIMAL(5, 2),
    body_fat_percentage DECIMAL(5, 2),
    bmi DECIMAL(5, 2),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);