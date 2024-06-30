##  Creación de una DB para visitas de una inmobiliaria

## Problema:
El equipo de una inmobiliaria se encuentra realizando un sistema de visitas a distintas propiedades para mostrarlas. Nos vemos en la obligación de crear una base de datos para manejar de manera eficiente todas las operaciones relacionadas con las visitas.

## Descripcion del problema:
1- **Inquilinos y empleados:** Necesitamos una base de datos que nos permita registrar la información de los inquilinos que quieren realizar una visita hacia alguna propiedad y que empleado estará involucrado en el mismo. 

2- **Registro de la visita:** Debemos utilizar un sistema donde se pueda registrar en qué fecha y hora se llevará a cabo la visita.

3- **Características de la propiedad:** Se debe crear una base de datos donde podremos poner como son las dimensiones de la casa, así como cantidad de ambientes y baños y si tiene jardín o no.

### Objetivo:
Diseñar una base de datos relacional que pueda satisfacer las necesidades en cuanto a la administración de las visitas y quienes participaran en ellas. Esta base de datos debe ser ágil, simple y fácil de mantener para una mejor eficiencia.

## Descripción de la base de datos - Gestión de visitas a propiedades
Esta base de datos esta diseñada para gestionar visitas de inmobiliarias a distintas propiedades. En esta se presentan empleados, las propiedades, dueños, inquilinos. A continuación se muestran detalladamente los elementos principales de la base de datos:



### Tablas:
1- **Inquilino:**
- Almacena información de los inquilinos que quieren visitar una propiedad
- Atributos: inquilinoID, nombre, email, tienegarante, dni

2- **Dueño:**
- Guarda datos sobre el dueño de la inmobiliaria (No esta conectado a las visitas por ende, no se utiliza)
- Atributos: duenoID, nombre , email

3- **Contrato:**
- Guarda información sobre que contiene el contrato de la propiedad
- Atributos: contratoID, fechavto, duración

4- **Inmobiliaria:**
- Almacena información sobre la inmobiliaria y datos de contacto
- Atributos: inmobiliariaID, nombre, telefono, ubicacion, dueñoID

5- **Propiedad:**
- Almacena información de la propiedad, sus dimensiones y caracteristicas
- Atributos: propiedadID, ubicacion, departamento, ambientes, jardin, baños, dimensiones, contratoID, inmobiliariaID

6- **Empleado:**
- Guarda información sobre los empleados de la inmobiliaria
- Atributos: empleadoID, nombre, inmobiliariaID

7- **Visita:**
- Registra las visitas de los inquilinos
- Atributos: VisitaID, inquilinoID, propiedadID, empleadoID, fecha, cancelacion


### Problemática resuelta:
Esta base de datos permite administrar de manera eficiente el proceso de visitas de hacia las propiedades desde quienes serán los empleados encargados de las mismas y quienes serán los inquilinos. Aborda algunos aspectos:
- Registro de inquilinos y empleados involucrados en las visitas
- Registro detallado de las características de la propiedad

En conclusión, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de visitas a las propiedades optimizando el trabajo.




+------------------+        +-----------------------+        +------------------+
|      INQUILINO   |        |       VISITA          |        |     INMOBILIARIA |
+------------------+        +-----------------------+        +------------------+
| inquilinoID (PK) |<>-----o| idReserva (PK)        |o-------| idRestaurante(PK)|
| nombre           |        | idCliente (FK)        |        | nombre           |
| telefono         |        | idMesa (FK)           |        | direccion        |
| correo           |        | idEmpleado (FK)       |        | telefono         |
+------------------+        | fecha                 |        +------------------+
                            | cancelacion           |                  |
                            +-----------------------+                  |
                                    |                                  |
                                    |                                  |
                                    v                                  v
+------------------+        +------------------+             +-------------------+
|     Empleado     |        |      Mesa        |             |     Dueno         |
+------------------+        +------------------+             +-------------------+
| idEmpleado (PK)  |        | idMesa (PK)      |             | idDueno (PK)      |
| nombre           |        | idRestaurante(FK)|             | nombre            |
| telefono         |        | capacidad        |             | correo            |
| correo           |        | disponible       |             | telefono          |
| idRestaurante(FK)|        +------------------+             +-------------------+
+------------------+                  |
                             +-------------------+
                             |   TipoReserva     |
                             +-------------------+
                             | idTipoReserva(PK) |
                             | tipo              |
                             +-------------------+
