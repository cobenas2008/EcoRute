# Language: ES
Característica: Gestión de rutas de recolección (EP05) 
  Como funcionario municipal
  Quiero crear, editar y confirmar rutas de recolección por zona y periodo
  Para planificar el recorrido de los camiones recolectores de forma eficiente

  # -------- US11: Creación de rutas de recolección --------
  Esquema del escenario: Creación de una ruta óptima
    Dado que el funcionario ha iniciado sesión en EcoRoute
    Y selecciona la zona "<zona>" y el periodo "<periodo>" de planificación
    Cuando solicita generar una ruta de recolección
    Entonces el sistema genera una propuesta de ruta óptima
    Y utiliza la ubicación de los reportes ciudadanos históricos y recientes de la zona
    Y considera la concentración de reportes y los puntos de mayor recurrencia

    Ejemplos:
      | zona     | periodo        |
      | SJM_01   | Noviembre 2026 |
      | SRC_04   | Diciembre 2026 |

  Escenario: Creación de una ruta sin información suficiente
    Dado que el funcionario ha iniciado sesión en EcoRoute
    Y selecciona una zona que no cuenta con información suficiente para generar una ruta
    Cuando solicita generar una ruta de recolección
    Entonces el sistema informa que no existen datos suficientes para generar una propuesta de ruta
