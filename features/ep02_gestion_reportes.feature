# Language: ES
Característica: Gestión de reportes ciudadanos (EP02)
  Como ciudadano y funcionario municipal
  Quiero registrar, consultar y actualizar reportes de acumulación de residuos
  Para mantener limpios los espacios públicos del distrito

  Esquema del escenario: Registro y validación de reporte de residuos (US03)
    Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute desde "<distrito>"
    Cuando adjunta la fotografía "<foto>" e ingresa la descripción "<descripcion>"
    Y presiona el botón "Enviar"
    Entonces el sistema muestra el mensaje "<mensaje>" con estado "<estado>"

    Ejemplos:
      | ciudadano | distrito | foto           | descripcion                  | mensaje                                   | estado      |
      | María     | SJL      | punto_01.jpg   | Acumulación en Av. Próceres  | Ticket generado con vigencia de 24 horas  | En Revisión |
      | Laura     | SJL      |                | Basura en esquina            | El reporte debe incluir una foto          | Rechazado   |
      | Matías    | VES      | residuo_02.jpg |                              | El reporte debe incluir una descripción   | Rechazado   |
      | Matías    | VES      |                |                              | Debe incluir información de su reporte    | Rechazado   |

  Esquema del escenario: Consulta y actualización de estado de reportes (US04, US05, US06)
    Dado que el funcionario "<funcionario>" selecciona el reporte "<codigo_reporte>" en estado "<estado_actual>"
    Cuando cambia el estado a "<nuevo_estado>" y registra la observación "<observacion>"
    Entonces el sistema actualiza el reporte a "<nuevo_estado>" y muestra la observación "<observacion>"

    Ejemplos:
      | funcionario  | codigo_reporte | estado_actual | nuevo_estado | observacion                                  |
      | Edgar Campos | REP-401        | En Revisión   | Asignado     | Cuadrilla de limpieza asignada a la zona     |
      | Edgar Campos | REP-401        | Asignado      | Atendido     | Limpieza concluida con evidencia fotográfica |
