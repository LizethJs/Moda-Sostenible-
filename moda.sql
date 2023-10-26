create database moda_sostenible;
use moda_sostenible;

CREATE TABLE Roles (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreRol VARCHAR(255)
);


CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Identificacion VARCHAR(255),
    Apellidos VARCHAR(255),
    Edad INT
    
);


CREATE TABLE Prendas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Categoria VARCHAR(255),
    Tamaño VARCHAR(50),
    Estado VARCHAR(50),
    Precio DECIMAL(10, 2)

);


CREATE TABLE DescripcionPrendas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PrendaID INT,
    DescripcionDetallada TEXT,
    FOREIGN KEY (PrendaID) REFERENCES Prendas(ID)
);


CREATE TABLE MediosDePago (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NombreMedioPago VARCHAR(255)
);

CREATE TABLE Factura (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    Fecha DATE,
    Total DECIMAL(10, 2),
    PrendaID INT,
    MedioPagoID INT,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID),
    FOREIGN KEY (PrendaID) REFERENCES Prendas(ID),
    FOREIGN KEY (MedioPagoID) REFERENCES MediosDePago(ID)
);


INSERT INTO Roles (NombreRol) VALUES
('Vendedor'),
('Comprador'),
('Diseñador'),
('Vendedor'),
('Comprador'),
('Diseñador'),
('Vendedor'),
('Comprador'),
('Diseñador'),
('Vendedor');


-- Insertar datos ficticios en la tabla Usuarios
INSERT INTO Usuarios (Nombre, Identificacion, Apellidos, Edad) VALUES
('Ana Smith', '123456789A', 'Johnson', 28),
('John Doe', '987654321B', 'Doe', 35),
('Maria Rodriguez', '456123789C', 'García', 32),
('David Lee', '789654123D', 'Smith', 29),
('Laura Kim', '321987654E', 'Brown', 26),
('Juan Pérez', '654321987F', 'López', 30),
('Sara Martinez', '987123456G', 'Gómez', 33),
('Michael Johnson', '456789321H', 'Williams', 31),
('Elena López', '654321789I', 'Pérez', 27),
('Samuel Davis', '789123456J', 'Jackson', 34);

INSERT INTO Prendas (Nombre, Categoria, Tamaño, Estado, Precio) VALUES
('Camiseta', 'Ropa', 'M', 'Buen estado', 15.99),
('Pantalones', 'Ropa', 'L', 'Nuevo', 29.99),
('Vestido', 'Ropa', 'S', 'Usado', 12.50),
('Abrigo', 'Ropa', 'XL', 'Excelente estado', 49.99),
('Zapatos', 'Calzado', '40', 'Buen estado', 19.99),
('Sudadera', 'Ropa', 'M', 'Usado', 9.99),
('Chaquetón', 'Ropa', 'L', 'Nuevo', 59.99),
('Bufanda', 'Accesorio', '', 'Nuevo', 7.99),
('Gorra', 'Accesorio', '', 'Buen estado', 5.99),
('Camisa', 'Ropa', 'S', 'Excelente estado', 22.99);

INSERT INTO DescripcionPrendas (PrendaID, DescripcionDetallada) VALUES
(1, 'Camiseta de algodón en color blanco.'),
(2, 'Pantalones vaqueros azules.'),
(3, 'Vestido floral con mangas cortas.'),
(4, 'Abrigo de lana en color gris.'),
(5, 'Zapatos deportivos negros.'),
(6, 'Sudadera con capucha en color gris.'),
(7, 'Chaquetón de invierno impermeable.'),
(8, 'Bufanda suave en color rojo.'),
(9, 'Gorra de béisbol en color negro.'),
(10, 'Camisa formal a rayas en tonos azules.');

INSERT INTO MediosDePago (NombreMedioPago) VALUES
('Tarjeta de Crédito'),
('PayPal'),
('Transferencia bancaria'),
('Efectivo'),
('Tarjeta de Débito'),
('Bitcoin'),
('Apple Pay'),
('Google Wallet'),
('Cheque'),
('Venmo');


INSERT INTO Factura (UsuarioID, Fecha, Total, PrendaID, MedioPagoID) VALUES
(1, '2023-10-01', 15.99, 1, 1),
(2, '2023-10-02', 29.99, 2, 2),
(3, '2023-10-03', 12.50, 3, 3),
(4, '2023-10-04', 49.99, 4, 4),
(5, '2023-10-05', 19.99, 5, 5),
(6, '2023-10-06', 9.99, 6, 6),
(7, '2023-10-07', 59.99, 7, 7),
(8, '2023-10-08', 7.99, 8, 8),
(9, '2023-10-09', 5.99, 9, 9),
(10, '2023-10-10', 22.99, 10, 10);



DELIMITER //
CREATE PROCEDURE ObtenerDetallesPrenda(IN prendaID INT)
BEGIN
    SELECT Nombre, Categoria, Tamaño, Estado, Precio
    FROM Prendas
    WHERE ID = prendaID;
END;
//
DELIMITER ;
CALL ObtenerDetallesPrenda(10); 

