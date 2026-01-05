-- CLIENTES
CREATE TABLE clientes (
  id_cliente SERIAL PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  email VARCHAR(1509),
  telefono VARCHAR(50),
  tipo_cliente VARCHAR(50),
  fecha_alta DATE DEFAULT CURRENT_DATE
);

-- OPORTUNIDADES (CRM)
CREATE TABLE oportunidades (
  id_oportunidad SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES clientes(id_cliente),
  nombre VARCHAR(150),
  estado VARCHAR(50), -- Nuevo, Negociación, Ganado, PErdido
  importe_estimado DECIMAL (10,2),
  fecha_creacion DATE DEFAULT CURRENT_DATE
);

-- ACTIVIDADES (seguimiento)
CREATE TABLE actividades (
  id_actividad SERIAL PRIMARY KEY,
  id_oportunidad INT REFERENCES oportunidades(id_oportunidad),
  tipo VARCHAR(50), -- llamada, reunión o tarea
  descripcion TEXT,
  fecha DATE
);

-- SERVICIOS / PEDIDOS
CREATE TABLE servicios (
  id_servicio SERIAL PRIMARY KEY,
  id_oportunidad INT REFERENCES oportunidades(id_oportunidad),
  descripcion TEXT,
  fecha_servicio DATE
);

-- FACTURAS (simuladas)
CREATE TABLE facturas (
  id_factura SERIAL PRIMARY KEY,
  id_servicio INT REFERENCES servicios(id_servicio),
  importe DECIMAL(10,2),
  fecha_factura DATE
);



