-- Query to select patient IDs, names, and conditions where the condition starts with 'DIAB1' or contains ' DIAB1' 
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%';
