-- Iniciar psql

CREATE DATABASE desafio_konstantina_barra_514;

-- \c desafio_konstantina_barra_514

-- ABRIR PGADMIN 4

-- IR A TOOL
-- SELECCIONAR Query Tool

CREATE TABLE clientes (
email VARCHAR(50),
nombre VARCHAR,
telefono VARCHAR(16),
empresa VARCHAR(50),
prioridad SMALLINT
);

INSERT INTO clientes (empresa, nombre, telefono, email, prioridad) 
VALUES 
('Soluciones Digitales S.A.', 'Ana López Pérez', '+34 912 345 678', 'ana.lopez@solucionesdigitales.es', '10'),
('Innova Tech S.L.', 'Carlos García Rodríguez', '+34 934 567 890', 'carlos.garcia@innovatech.es', '6'),
('Eco Green S.A.', 'María Sánchez Martín', '+34 956 789 012', 'maria.sanchez@ecogreen.es', '2'),
('Bio Lab S.L.', 'Pedro Díaz Fernández', '+34 971 234 567', 'pedro.diaz@biolab.es', '9'),
('Smart Edu S.A.', 'Laura González García', '+34 986 345 678', 'laura.gonzalez@smartedu.es', '5'),
('Media Net S.L.', 'Juan Martínez López', '+34 913 567 890', 'juan.martinez@medianet.es', '3'),
('Sport Fit S.A.', 'Sara Jiménez Ruiz', '+34 952 789 012', 'sara.jimenez@sportfit.es', '8'),
('Art Design S.L.', 'Pablo Gómez Sánchez', '+34 981 234 567', 'pablo.gomez@artdesign.es', '4'),
('Travel Fun S.A.', 'Elena Rodríguez Pérez', '+34 922 345 678', 'elena.rodriguez@travelfun.es', '1'),
('Health Care S.L.', 'Luis García Martín', '+34 941 567 890', 'luis.garcia@healthcare.es', '7');

SELECT * FROM clientes;
 
SELECT * FROM clientes
ORDER BY prioridad DESC
LIMIT 3;

SELECT * FROM clientes 
WHERE prioridad = 10 OR empresa = 'Bio Lab S.L.';

--| Empresa                   | Nombre                  | Teléfono         | Email                                    | Prioridad |
--|---------------------------|-------------------------|------------------|------------------------------------------|-----------|
--| Soluciones Digitales S.A. | Ana López Pérez         | +34 912 345 678  | ana.lopez@solucionesdigitales.es         | 10        |
--| Innova Tech S.L.          | Carlos García Rodríguez | +34 934 567 890  | carlos.garcia@innovatech.es              | 6         |
--| Eco Green S.A.            | María Sánchez Martín    | +34 956 789 012  | maria.sanchez@ecogreen.es                | 2         |
--| Bio Lab S.L.              | Pedro Díaz Fernández    | +34 971 234 567  | pedro.diaz@biolab.es                     | 9         |
--| Smart Edu S.A.            | Laura González García   | +34 986 345 678  | laura.gonzalez@smartedu.es               | 5         |
--| Media Net S.L.            | Juan Martínez López     | +34 913 567 890  | juan.martinez@medianet.es                | 3         |
--| Sport Fit S.A.            | Sara Jiménez Ruiz       | +34 952 789 012  | sara.jimenez@sportfit.es                 | 8         |
--| Art Design S.L.           | Pablo Gómez Sánchez     | +34 981 234 567  | pablo.gomez@artdesign.es                 | 4         |
--| Travel Fun S.A.           | Elena Rodríguez Pérez   | +34 922 345 678  | elena.rodriguez@travelfun.es             | 1         |
--| Health Care S.L.          | Luis García Martín      | +34 941 567 890  | luis.garcia@healthcare.es                | 7         |
