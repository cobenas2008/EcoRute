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
