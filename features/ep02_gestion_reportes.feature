# Language: ES
Característica: Gestión de reportes ciudadanos (EP02)
  Como ciudadano y funcionario municipal
  Quiero registrar, consultar y actualizar reportes de acumulación de residuos
  Para mantener limpios los espacios públicos del distrito

  # -------- US03: Envío de reporte de residuos --------
  Esquema del escenario: Reporte exitoso (US03)
    Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute desde "<distrito>"
    Cuando adjunta la fotografía "<foto>" e ingresa la descripción "<descripcion>"
    Y envía el reporte
    Entonces el sistema captura la ubicación GPS del reporte
    Y asigna automáticamente una zona de recojo según el distrito del ciudadano
    Y genera un ticket único con vigencia de 24 horas
    Y el estado del reporte es "En Revisión"
    Y muestra el mensaje "Reporte enviado exitosamente"

    Ejemplos:
      | ciudadano | distrito | foto           | descripcion                 |
      | María     | SJL      | punto_01.jpg   | Acumulación en Av. Próceres |
      | Pedro     | VES      | punto_02.jpg   | Residuos en vía pública     |
  
  Esquema del escenario: Reporte con pocos datos (US03)
  Dado que el ciudadano "<ciudadano>" ha iniciado sesión en EcoRoute desde "<distrito>"
  Cuando solo adjunta la fotografía "<foto>", solo ingresa la descripción "<descripcion>" o no envía ninguno de los dos datos
  Y envía el reporte
  Entonces el sistema rechaza el envío
  Y muestra el mensaje "<mensaje>"

    Ejemplos:
      | ciudadano | distrito | foto           | descripcion       | mensaje                                   |
      | Laura     | SJL      |                | Basura en esquina | El reporte debe incluir una foto          |
      | Matías    | VES      | residuo_02.jpg |                   | El reporte debe incluir una descripción   |
      | Matías    | VES      |                |                   | Debe incluir información de su reporte    |
  
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
