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
