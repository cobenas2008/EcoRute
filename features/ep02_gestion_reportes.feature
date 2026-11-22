# Language: ES
Característica: Gestión de reportes ciudadanos (EP02)
  Como ciudadano y funcionario municipal
  Quiero registrar, consultar y actualizar reportes de acumulación de residuos
  Para mantener limpios los espacios públicos del distrito

  # -------- US03: Envío de reporte de residuos --------
  Esquema del escenario: Reporte exitoso (US03)
    Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute desde "<distrito>"
    Cuando adjunta la fotografía "<foto>" e ingresa la descripción "<descripcion>"
    Y presiona el botón "Enviar"
    Entonces el sistema muestra el mensaje "<mensaje>" con estado "<estado>"
    Y envía el reporte
    Entonces el sistema captura la ubicación GPS del reporte
    Y asigna automáticamente una zona de recojo según el distrito del ciudadano
    Y genera un ticket único con vigencia de 24 horas
    Y el estado del reporte es "En Revisión"
    Y muestra el mensaje "Reporte enviado exitosamente"

    Ejemplos:
      | ciudadano | distrito | foto           | descripcion                  | mensaje                                   | estado      |
      | María     | SJL      | punto_01.jpg   | Acumulación en Av. Próceres  | Ticket generado con vigencia de 24 horas  | En Revisión |
      | Laura     | SJL      |                | Basura en esquina            | El reporte debe incluir una foto          | Rechazado   |
      | Matías    | VES      | residuo_02.jpg |                              | El reporte debe incluir una descripción   | Rechazado   |
      | Matías    | VES      |                |                              | Debe incluir información de su reporte    | Rechazado   |
  
  Esquema del escenario: Reporte con pocos datos (US03)
  Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute desde "<distrito>"
  Cuando solo adjunta la fotografía "<foto>", solo ingresa la descripción "<descripcion>" o no envía ninguno de los dos datos
  Y envía el reporte
  Entonces el sistema rechaza el envío
  Y muestra el mensaje "<mensaje>"

  # -------- US04: Consulta y detalle de mis reportes --------
  Esquema del escenario: Visualización de todos mis reportes (US04)
    Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute
    Y tiene "<cantidad_reportes>" reportes registrados
    Cuando ingresa al apartado "Mis Reportes"
    Entonces el sistema muestra todos sus reportes
    Y muestra el estado actual de cada reporte

    Ejemplos:
      | ciudadano | cantidad_reportes |
      | María     | 3                 |
      | Laura     | 2                 |
      | Matías    | 5                 |
  
  Esquema del escenario: Consulta del detalle de un reporte (US04)
  Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute
  Y tiene un reporte con estado "<estado>"
  Cuando consulta el detalle de dicho reporte
  Entonces el sistema muestra la fotografía enviada
  Y muestra la descripción enviada
  Y muestra el estado actual del reporte
  Y muestra "<informacion_adicional>"
    
    Ejemplos:
      | ciudadano | estado      | informacion_adicional                        |
      | María     | En Revisión | no muestra comentario ni evidencia           |
      | Laura     | Asignado    | muestra el comentario del funcionario         |
      | Matías    | Atendido    | muestra comentario y fotografía de evidencia |

  Escenario: Consulta de un reporte expirado (US04)
  Dado que el ciudadano "Matías" ha iniciado sesión en EcoRoute
  Y tiene un reporte con estado "Expirado"
  Cuando consulta el detalle del reporte
  Entonces el sistema muestra el mensaje "Reporte no atendido en el plazo de 24 horas"
  
# -------- US05: Consulta de reportes ciudadanos --------
  Esquema del escenario: Visualización de reportes ciudadanos
    Dado que el funcionario "<funcionario>" ha iniciado sesión en EcoRoute
    Y pertenece al distrito "<distrito>"
    Cuando consulta los reportes ciudadanos
    Entonces el sistema muestra los reportes correspondientes al distrito
    Y los ordena según su prioridad de atención
    Y muestra el código del reporte
    Y muestra el DNI del ciudadano que lo registró
    Y muestra la fecha y hora
    Y muestra el estado actual
    
    Ejemplos:
      | funcionario | distrito |
      | Carlos      | SJL      |
      | Ana         | VES      |
  
  Esquema del escenario: Consulta a detalle de un reporte
    Dado que el funcionario "<funcionario>" ha iniciado sesión en EcoRoute
    Y tiene acceso a los reportes de su distrito
    Cuando consulta el reporte "<codigo>"
    Entonces el sistema muestra la ubicación del reporte en el mapa
    Y muestra la fotografía del reporte
    Y muestra la descripción del reporte
    Y muestra el código del reporte
    Y muestra la fecha y hora
    Y muestra el ciudadano que lo registró
    Y muestra el estado actual

    Ejemplos:
      | funcionario | codigo  |
      | Carlos      | ECO-001 |
      | Ana         | ECO-002 |
      
  # -------- US06: Actualización de reportes ciudadanos --------
  Esquema del escenario: Actualización de reporte desde "En Revisión"
    Dado que el funcionario "<funcionario>" ha iniciado sesión en EcoRoute
    Y consulta un reporte en estado "En Revisión"
    Cuando solicita cambiar el estado a "<nuevo_estado>"
    Entonces el sistema solicita una observación dirigida al ciudadano
    Cuando el funcionario registra la observación "<observacion>"
    Entonces el sistema actualiza el estado del reporte a "<nuevo_estado>"
    Y registra la observación
    Y el ciudadano puede consultar la observación en el detalle de su reporte

    Ejemplos:
      | funcionario | nuevo_estado | observacion                                       |
      | Carlos      | Asignado     | Equipo de limpieza asignado a la zona del reporte |
      | Carlos      | Rechazado    | Foto borrosa y descripcion poco clara             |
  
  Escenario: Actualización de reporte asignado a atendido
    Dado que el funcionario "Carlos" ha iniciado sesión en EcoRoute
    Y consulta un reporte en estado "Asignado"
    Cuando solicita cambiar el estado a "Atendido"
    Entonces el sistema solicita una observación dirigida al ciudadano
    Cuando el funcionario registra la observación
    Entonces el sistema actualiza el estado del reporte a "Atendido"
    Y registra la observación
    Y el ciudadano puede consultar la observación en el detalle de su reporte

 Esquema del escenario: Expiración automática de un reporte
    Dado que el reporte "<codigo>" se encuentra en estado "<estado>"
    Cuando transcurren 24 horas desde su creación
    Entonces el sistema cambia automáticamente el estado del reporte a "Expirado"

    Ejemplos:
      | código  | estado      |
      | ECO-001 | En Revisión |
      | ECO-002 | Asignado    |
      | ECO-003 | Rechazado   |
  
  Escenario: No permitir actualizar un reporte atendido o expirado
  Dado que el funcionario "Carlos" ha iniciado sesión en EcoRoute
  Y consulta un reporte en estado "Atendido" o "Expirado"
  Cuando solicita actualizar el estado del reporte
  Entonces el sistema no permite modificar el estado del reporte
