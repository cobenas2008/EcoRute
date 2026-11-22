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
  
  # -------- US12: Visualización y edición de rutas --------
  Escenario: Visualización de la ruta propuesta
    Dado que el sistema ha generado una propuesta de ruta para una zona
    Cuando el funcionario consulta la propuesta
    Entonces el sistema muestra el recorrido sugerido
    Y muestra los puntos de recolección considerados para generar la ruta
  
  Escenario: Edición de una ruta
    Dado que el funcionario está consultando una ruta propuesta
    Cuando modifica el recorrido
    Entonces el sistema actualiza la propuesta de ruta
    Y permite consultar la versión modificada antes de confirmarla
  
  # -------- US13: Confirmación de rutas --------
  Escenario: Confirmación de una ruta
    Dado que el funcionario ha revisado una ruta propuesta
    Y ha realizado los cambios que considera necesarios
    Cuando confirma la ruta
    Entonces el sistema registra la versión final como la ruta establecida
    Y la asocia con la zona y el periodo de planificación seleccionados
  
  Escenario: Cancelación de una ruta
    Dado que el funcionario está revisando una ruta propuesta
    Cuando cancela la planificación
    Entonces el sistema descarta los cambios realizados
    Y mantiene la ruta previamente establecida si existe
