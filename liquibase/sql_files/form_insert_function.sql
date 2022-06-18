DROP FUNCTION IF EXISTS insert_form;
GO
CREATE FUNCTION insert_form(name varchar(50), version varchar(3), uuid varchar(36))
    RETURNS INT
BEGIN
DECLARE inserted_id integer;

INSERT INTO form(name,version,build,published,xslt,template,description,encounter_type,creator,date_created,changed_by,date_changed,retired,retired_by,date_retired,retired_reason,uuid) VALUES (name,version,NULL,1,NULL,NULL,NULL,3,4,'2022-05-01 09:15:07',4,'2022-05-01 10:29:03',0,NULL,NULL,NULL,uuid);
SELECT LAST_INSERT_ID() into inserted_id;
insert into form_resource(form_id, name,value_reference,datatype,datatype_config,preferred_handler,handler_config,uuid,date_changed,changed_by) values(inserted_id,name,concat('/home/bahmni/clinical_forms/', uuid, '.json'),'org.bahmni.customdatatype.datatype.FileSystemStorageDatatype', concat('/home/bahmni/clinical_forms/', uuid, '.json'),NULL,NULL,uuid(),NULL,NULL);
RETURN 1;
END
GO
