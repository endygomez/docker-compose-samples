USE my_database;

-- Crea una tabla de prueba
CREATE TABLE test_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255) NOT NULL
);

-- Inserta algunos datos en la tabla
INSERT INTO test_table (data) VALUES ('Primary: Test Data 1');
INSERT INTO test_table (data) VALUES ('Primary: Test Data 2');

