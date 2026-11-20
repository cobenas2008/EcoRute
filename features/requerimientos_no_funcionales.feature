# language: es
Característica: Requerimientos no funcionales de EcoRoute
  Como usuario de la aplicación móvil o panel municipal de EcoRoute
  Quiero que el sistema responda rápido, proteja los datos y funcione ante fallos o distintos tamaños de pantalla
  Para asegurar la continuidad y confiabilidad del servicio

  Esquema del escenario: Validación de rendimiento, seguridad, disponibilidad y usabilidad
    Dado que el usuario con rol "<rol>" realiza "<accion>" bajo la condición "<condicion>"
    Cuando el sistema procesa la operación
    Entonces se cumple el criterio "<criterio_esperado>"

    Ejemplos:
      | rol         | accion                         | condicion                   | criterio_esperado                                       |
      | Ciudadano   | Enviar reporte con GPS         | Conexión móvil estable      | Respuesta del sistema en menos de 3 segundos            |
      | Ciudadano   | Consultar panel de funcionario | Sin permisos de funcionario | Acceso denegado y bloqueo de vista administrativa     |
      | Ciudadano   | Registrar reporte en calle     | Sin conexión a internet     | Reporte guardado localmente para envío al reconectar    |
      | Funcionario | Abrir tablero y mapas          | Pantalla móvil y escritorio | Elementos visibles y legibles sin desbordes ni cortes |
