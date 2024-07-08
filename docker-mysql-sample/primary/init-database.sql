USE my_database;

-- Create a test table
CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255) NOT NULL
);

-- Insert some data on the table
INSERT INTO test_table (data) VALUES ('Primary: Test Data 1');
INSERT INTO test_table (data) VALUES ('Primary: Test Data 2');

