CREATE OR REPLACE VIEW v_lista_ficheros
AS
   SELECT ''          AS caso,
          cliente.nif AS DNI,
          fichero.id_alfresco,
          fichero.nombre,
          fichero.descripcion,
          fichero.notas
   FROM cliente_fichero
        INNER JOIN fichero ON fichero.id = cliente_fichero.fichero_id
        INNER JOIN cliente
           ON cliente.id = cliente_fichero.cliente_ficheros_id
   UNION
   SELECT caso.num_asunto,
          cliente.nif,
          fichero.id_alfresco,
          fichero.nombre,
          fichero.descripcion,
          fichero.notas
   FROM caso_fichero
        INNER JOIN caso ON caso.id = caso_fichero.caso_ficheros_id
        INNER JOIN fichero ON fichero.id = caso_fichero.fichero_id
        INNER JOIN cliente ON cliente.id = caso.cliente_id
   UNION
   SELECT caso.num_asunto,
          cliente.nif,
          fichero.id_alfresco,
          fichero.nombre,
          fichero.descripcion,
          fichero.notas
   FROM actuacion_fichero
        INNER JOIN fichero ON fichero.id = actuacion_fichero.fichero_id
        INNER JOIN actuacion
           ON actuacion.id = actuacion_fichero.actuacion_ficheros_id
        INNER JOIN caso ON caso.id = actuacion.caso_id
        INNER JOIN cliente ON caso.cliente_id = cliente.id;