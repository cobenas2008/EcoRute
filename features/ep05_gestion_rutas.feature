# language: es
Característica: Gestión de rutas de recolección (EP05) 
  Como funcionario municipal
  Quiero crear, editar y confirmar rutas de recolección por zona y periodo
  Para planificar el recorrido de los camiones recolectores de forma eficiente

  Esquema del escenario: Creación, edición y confirmación de ruta (US11, US12, US13) 
    Dado que el funcionario "<funcionario>" se encuentra en gestión de rutas para la zona "<zona>" y periodo "<periodo>" 
    Cuando selecciona "<accion_creacion>", edita la parada "<parada>" y ejecuta "<accion_cierre>"
    Entonces el sistema muestra el resultado "<resultado_esperado>"

    Ejemplos:
      | funcionario  | zona    | periodo      | accion_creacion | parada         | accion_cierre  | resultado_esperado                         |
      | Edgar Campos | Zona 01 | Turno Mañana | Crear ruta      | Av. Canto Rey  | Confirmar ruta | Ruta definitiva guardada para la zona      |
      | Edgar Campos | Zona 02 | Turno Tarde  | Crear ruta      | Ninguna        | Crear ruta     | No existen datos suficientes para la ruta  |
      | Edgar Campos | Zona 03 | Turno Noche  | Crear ruta      | Jr. Los Andes  | Cancelar       | Cambios descartados; ruta previa mantenida |
