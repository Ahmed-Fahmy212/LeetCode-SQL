SELECT e.name, uid.unique_id
FROM Employees e
LEFT JOIN EmployeeUNI uid ON e.id = uid.id;