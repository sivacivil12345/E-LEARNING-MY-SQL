CREATE DATABASE elearning_db; 
USE elearning_db;
CREATE TABLE learners (
learner_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100) NOT NULL,
country VARCHAR(50));
CREATE TABLE courses (
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
unit_price DECIMAL(10,2));
CREATE TABLE purchases (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    learner_id INT,
    course_id INT,
    quantity INT,
    purchase_date DATE,
    
    FOREIGN KEY (learner_id) REFERENCES learners(learner_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
INSERT INTO learners (full_name, country) VALUES
('Suresh Kumar', 'India'),
('John Cena', 'USA'),
('Maria John', 'Spain'),
('Li Wei', 'China'),
('Sara Khan', 'UAE');
select * from learners;

INSERT INTO courses (course_name, category, unit_price) VALUES
('MySQL Basics', 'Database', 2500),
('Python Programming', 'Programming', 4000),
('Web Development', 'Development', 3500),
('Data Science', 'Analytics', 2000),
('Machine Learning', 'AI', 5000);
select * from courses;

INSERT INTO purchases (learner_id, course_id, quantity, purchase_date) VALUES
(1, 1, 1, '2025-01-10'),
(1, 2, 2, '2025-02-15'),
(2, 3, 1, '2025-02-20'),
(3, 4, 1, '2025-03-05'),
(4, 5, 1, '2025-03-10'),
(5, 2, 1, '2025-03-12'),
(2, 1, 3, '2025-03-15'),
(3, 3, 2, '2025-03-18');
select * from purchases;

SELECT l.full_name AS learner_name,l.country,c.course_name,c.category,p.quantity,FORMAT(p.quantity * c.unit_price, 2) AS total_amount,p.purchase_date
FROM purchases p INNER JOIN learners l ON p.learner_id = l.learner_id INNER JOIN courses c ON p.course_id = c.course_id ORDER BY total_amount DESC;

SELECT l.full_name AS learner_name,l.country,c.course_name,c.category,p.quantity,FORMAT(p.quantity * c.unit_price, 2) AS total_amount,p.purchase_date
FROM learners l LEFT JOIN purchases p ON l.learner_id = p.learner_id LEFT JOIN courses c ON p.course_id = c.course_id
ORDER BY total_amount DESC;

SELECT l.full_name AS learner_name,l.country,c.course_name,c.category, p.quantity,FORMAT(p.quantity * c.unit_price, 2) AS total_amount,p.purchase_date
FROM purchases p RIGHT JOIN courses c ON p.course_id = c.course_id LEFT JOIN learners l ON p.learner_id = l.learner_id
ORDER BY total_amount DESC;


SELECT l.full_name AS learner_name,l.country,FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_spent
FROM learners l JOIN purchases p ON l.learner_id = p.learner_id JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name, l.country ORDER BY total_spent DESC;

SELECT c.course_name,SUM(p.quantity) AS total_quantity_sold FROM purchases p JOIN courses c ON p.course_id = c.course_id
GROUP BY c.course_id, c.course_name ORDER BY total_quantity_sold DESC LIMIT 3;

SELECT c.category,FORMAT(SUM(p.quantity * c.unit_price), 2) AS total_revenue,COUNT(DISTINCT p.learner_id) AS unique_learners
FROM purchases p JOIN courses c ON p.course_id = c.course_id GROUP BY c.category ORDER BY total_revenue DESC;

SELECT l.full_name AS learner_name,COUNT(DISTINCT c.category) AS category_count
FROM learners l JOIN purchases p ON l.learner_id = p.learner_id JOIN courses c ON p.course_id = c.course_id
GROUP BY l.learner_id, l.full_name HAVING COUNT(DISTINCT c.category) > 1;


SELECT c.course_name,c.category FROM courses c LEFT JOIN purchases p ON c.course_id = p.course_id WHERE p.purchase_id IS NULL;













