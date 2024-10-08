# Entrega Proyecto MySQL

## Entrega del proyecto final

<p>Alumno: Agustín Lombardi</p>

<p>Comisión: 57190</p>

<p>Tutor: Leonel Lo Presti</p>

<p>Docente: Anderson Michel Torres</p>

##  Creación de una DB para visitas de una inmobiliaria

### Problema:
El equipo de una inmobiliaria se encuentra realizando un sistema de visitas a distintas propiedades para mostrarlas. Nos vemos en la obligación de crear una base de datos para manejar de manera eficiente todas las operaciones relacionadas con las visitas.

### Descripcion del problema:
1- **Inquilinos y empleados:** Necesitamos una base de datos que nos permita registrar la información de los inquilinos que quieren realizar una visita hacia alguna propiedad y que empleado estará involucrado en el mismo. 

2- **Registro de la visita:**  Debemos utilizar un sistema donde se pueda registrar en qué fecha y hora se llevará a cabo la visita.

3- **Características de la propiedad:**  Se debe crear una base de datos donde podremos poner como son las dimensiones de la casa, así como cantidad de ambientes y baños y si tiene jardín o no.

### Objetivo:
Diseñar una base de datos relacional que pueda satisfacer las necesidades en cuanto a la administración de las visitas y quienes participaran en ellas. Esta base de datos debe ser ágil, simple y fácil de mantener para una mejor eficiencia.

### Descripción de la base de datos - Gestión de visitas a propiedades
Esta base de datos esta diseñada para gestionar visitas de inmobiliarias a distintas propiedades. En esta se presentan empleados, las propiedades, dueños, inquilinos. A continuación se muestran detalladamente los elementos principales de la base de datos:



### Tablas:
1- `Inquilino:` 
- Almacena información de los inquilinos que quieren visitar una propiedad
- Atributos: inquilinoID, nombre, email, tienegarante, dni

2- ` Dueño:` 
- Guarda datos sobre el dueño de la inmobiliaria (No esta conectado a las visitas por ende, no se utiliza)
- Atributos: duenoID, nombre , email

3- `Contrato:` 
- Guarda información sobre que contiene el contrato de la propiedad
- Atributos: contratoID, fechavto, duracion_en_dias

4- `Inmobiliaria:` 
- Almacena información sobre la inmobiliaria y datos de contacto
- Atributos: inmobiliariaID, nombre, telefono, ubicacion, dueñoID

5- `Propiedad:`
- Almacena información de la propiedad, sus dimensiones y caracteristicas
- Atributos: propiedadID, ubicacion, departamento, ambientes, jardin, baños, precio, moneda, ocupada contratoID, inmobiliariaID

6- `Empleado:` 
- Guarda información sobre los empleados de la inmobiliaria
- Atributos: empleadoID, nombre, inmobiliariaID

7- `Visita:` 
- Registra las visitas de los inquilinos
- Atributos: VisitaID, inquilinoID, propiedadID, empleadoID, fecha, cancelacion

8- `Garante:` 
- Registra los garantes de cada inquilino
- Atributos: GaranteID, nombre, email, inquilinoID

### Problemática resuelta:
Esta base de datos permite administrar de manera eficiente el proceso de visitas de hacia las propiedades desde quienes serán los empleados encargados de las mismas y quienes serán los inquilinos. Aborda algunos aspectos:
- Registro de inquilinos y empleados involucrados en las visitas
- Registro detallado de las características de la propiedad

En conclusión, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de visitas a las propiedades optimizando el trabajo.





**Tabla Inquilino**

| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| inquilinoID    | INT          | PK            | No admite datos nulos y es autoincremental.                                                          |
| Nombre         | VARCHAR(60)  |               | Nombre del inquilino              |
| Email          | VARCHAR(100) |    UNIQUE     | No admite datos nulos                                                                                  |
| Tiene Garante  | BOOLEAN      |    UNIQUE     | Por default coloca que este no tiene garante                 |
| Dni            | INT          |    UNIQUE     | Debe ser unico               |


**Tabla Dueño**

| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| duenoID        | INT          | PK            | No admite datos nulos y es autoincremental.                                                          |
| Nombre         | VARCHAR(60)  |               | Nombre del dueño            |
| Email          | VARCHAR(100) |    UNIQUE     | No admite datos nulos                                                                                  |


**Tabla Contrato**
| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| contratoID     | INT          | PK            | No admite datos nulos y es autoincremental.                                                          |
| Fecha_vto       | VARCHAR(60) |  DATETIME    | Fecha de vencimiento del contrato             |
| Duracion en dias   | INT |    UNIQUE   | Alterado por un Trigger                                                                                  |
| Tiene Garante  | BOOLEAN      |    UNIQUE     | Por default coloca que este no tiene garante                 |
| Dni            | INT          |    UNIQUE     | Debe ser unico               |


**Tabla Inmobiliaria**
| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| inmobiliariaID | INT          | PK            | No admite datos nulos y es autoincremental.                                                           |
| Nombre         | VARCHAR(60)  |               | Nombre de la inmobiliaria                                                                             |
| Telefono       | VARCHAR(20)  |               | Telefono de la inmobiliaria                                                                           |
| Ubicación      | VARCHAR(200) |               | Por default coloca que este no tiene garante                                                          |
| DuenoID        | INT          | FK            | Proviene de la tabla dueño                                                                            |


**Tabla Propiedad**
| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| propiedadID    | INT          | PK            | No admite datos nulos y es autoincremental.                                                           |
| Ubicacion      | VARCHAR(200) |               | Ubicacion de la propiedad                                                                            |
| Departamento   | BOOLEAN      |               | Por default es FALSE                                                                                  |
| Ambientes      | VARCHAR(200) |               | Ambientes de la propiedad                                                           |
| Jardin         | BOOLEAN      |               | Indica si tiene jardin o no                                                                            |
| Banos          | INT          |               | Por default coloca que este tiene 1 solo baño                                                           |
| Precio         | INT          |               | No acepta nulos                                                                     |
| Ocupada        | BOOLEAN      |               | No acepta nulos                                                                    |
| Moneda         | ENUM         |               | No acepta nulos y toma ARS como default                                                                     |
| ContratoID     | INT          |FK             | Proviene de la tabla contrato                                                          |
| inmobiliariaID | INT          |FK             | Proviene de la tabla inmobiliaria                                                           |


**Tabla Empleado**
| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| EmpleadoID     | INT          | PK            | No admite datos nulos y es autoincremental.                                                           |
| Nombre         | VARCHAR(60)  |               | Nombre de los empleados                                                                               |
| InmobiliariaID | VARCHAR(20)  | FK            | Proviene de la tabla inmobiliaria                                                                     |


**Tabla Visita**
| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| VisitaID       | INT          | PK            | No admite datos nulos y es autoincremental.                                                           |
| InquilinoID    | INT          | FK            | Proviene de la tabla inquilino                                                                       |
| PropiedadID    | INT          | FK            | Proviene de la tabla propiedad                                                                     |
| EmpleadoID     | INT          | FK            | Proviene de la tabla empleado                                                                     |
| Fecha          | DATETIME     |               | Fecha de la visita                                                                    |
| Cancelacion    | DATETIME     |               | Por default es NULL                                                                    |


**Tabla Garante**
| COLUMNA        | TIPO DE DATO | TIPO DE CLAVE | DESCRIPCIÓN                                                                                           |
|----------------|--------------|---------------|-------------------------------------------------------------------------------------------------------|
| GaranteID      | INT          | PK            | No admite datos nulos y es autoincremental.                                                           |
| Nombre         | INT          |               | Nombre del garante                                                                       |
| Email          | INT          |               | Email del garante                                                                     |
| InquilinoID    | INT          | FK            | Proviene de la tabla inquilino                                                                     |



### Objetos de la base de datos
___

# Documentación Usuarios y permisos
***Roles:***
 En esta DB al haber pocos empleados, no existen roles y son muy pocos los que tienen permisos.

 ***Usuarios:***
 `Alma:` Una de los dueños de la inmobiliaria la cual tiene todos los privilegios de la base de datos. Su contraseña es 032014.

 `Felipe:` Otro dueño de la inmobiliaria la cual tiene todos los privilegios de la base de datos. Su contraseña es 092009

 `Juan:` Uno de los empleados con mayor cargo en la inmobiliaria tiene todos los privilegios en la tabla propiedad y en la tabla visita. Su contraseña es 789
 
 `Ana:` Uno de los empleados con mayor cargo en la inmobiliaria tiene todos los privilegios en la tabla propiedad y en la tabla visita. Su contraseña es 987

___

# Documentación Vistas


## Vista: vw_inquilinos_con_garante

### Descripción: Esta vista muestra cuales son los inquilinos que tienen o no tienen garante

### Columnas
- InquilinoID: Trae el ID del inquilino
- nombre: Trae el nombre del inquilino
- email: Trae el email del inquilino

**Ejemplo de consulta:**
```sql
SELECT * FROM vw_inquilinos_con_garante
WHERE tiene_garante = "No"
```

##Vista: vw_propiedades_ocupadas

### Descripción: Esta vista me trae todas las propiedades que ya estan ocupadas

**Ejemplo de consulta**
```sql
SELECT * FROM vw_propiedades_ocupadas
ORDER BY p.precio DESC
```


## Vista: vw_visitas_realizadas

### Descripcion: Me trae información de todas las visitas que ya fueron realizadas al día de la fecha

**Ejemplo de uso**
```sql
SELECT * FROM vw_visitas_realizadas
WHERE nombre_empleado = Juan Perez
```

___

# Documentación Triggers

### Trigger: confirm_email_inquilino

**Descripción: Utilizando una función permite verificar que el email del inquilino no se repita** 

**Detalles** 
- Tabla Afectada: Inquilino
- Acción: Insert
- Información registrada: email

**Ejemplo** 
- Se inserta un nuevo inquilino
- El trigger revisa si el email insertado ya existe

## Trigger: confirm_email_garante

**Descripción: Utilizando una función permite verificar que el email del garante no se repita** 

**Detalles** 
- Tabla Afectada: Garante
- Acción: Insert
- Información registrada: email

**Ejemplo** 
- Se inserta un nuevo Garante
- El trigger revisa si el email insertado ya existe

### Trigger: calcular_duracion_en_dias

**Descripción: Permite calcular la duración de dias del contrato a partir de una fecha** 

**Detalles** 
- Tabla Afectada: Contrato
- Acción: Insert
- Información registrada: duracion_en_dias, fecha_vto

**Ejemplo** 
- Se inserta un nuevo contrato
- El trigger realiza un recuento de los días que faltan para que el contrato quede vencido


___

# Documentación de Stored Procedures

### Procedure: sp_propiedades_a_desocuparse

**Descripción: Este procedure almacena las propiedades que estan proximas a desocuparse**

**Parámetros:**
- dias_limites

**Retorno:**
- Mensaje de éxito o error

**Ejemplo de uso**
```sql
CALL sp_propiedades_a_desocuparse(1200)
```

### Procedure: procedure_listar_propiedades_precio

**Descripción: Este procedure me lista las propiedades en un rango de precio**

**Parámetros:**
- precio_min
- precio_max
- moneda_busqueda

**Retorno:**
- Mensaje de éxito o error

**Ejemplo de uso**
```sql
CALL procedure_listar_propiedades_precio(50000, 100000, 'USD')
```

### Procedure: procedure_tipo_propiedad

**Descripción: Este procedure me facilita el poder calcular el total de propiedades por tipo**

**Parámetros:**
- Ninguno

**Retorno:**
- Mensaje de éxito o error

**Ejemplo de uso**
```sql
CALL procedure_tipo_propiedad()
```

### Procedure: procedure_obtener_empleado_visita

**Descripción: Este procedure me dice la cantidad de visitas de cada empleado**

**Parámetros:**
- Ninguno

**Retorno:**
- Mensaje de éxito o error

**Ejemplo de uso**
```sql
CALL procedure_obtener_empleado_visita()
```

___

# Documentación de Funciones

### Función: fn_estado_visita

**Descripción: Esta función me ayuda a revisar el estado de la visita, si esta pendiente, a realizar o cancelada**

**Parámetros:**
- fecha_visita
- cancelacion

**Retorno:**
- Cancelada si cancelacion no es nula
- Realizada si la fecha_visita ya paso
- Pendiete si ninguna de las anteriores se cumplió

**Ejemplo de uso**
```sql
SELECT
	  fn_estado_visita(fecha, cancelacion) AS estado_visita,
    COUNT(*) AS total_visitas
    FROM visita
    GROUP BY fn_estado_visita(fecha, cancelacion)
```

### Función: fn_revisar_emails_duplicados

**Descripción: Esta función revisa que los emails de los garantes e inquilinos no se repitan**

**Parámetros:**
- new_email

**Retorno:**
- El email existente

**Ejemplo de uso**
```sql
SELECT
   *,
  fn_revisar_emails_duplicados(email) AS email_duplicado
  FROM inquilino;
```
