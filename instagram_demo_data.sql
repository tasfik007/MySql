1. IMPORT PACKAGES				java.sql.*;
2. LOAD & REGISTER DRIVERS		not odbc so mysql driver
								com.mysql.jdbc.driver;
3. CREATE CONNECTION
4. CREATE STATEMENT
5. EXECUTE QUERY
6. PROCESS RESULT
7. CLOSE 


create table Tasfiks_Project(
AuthorOfTheDB varchar(100),
Description   varchar(255)
);

insert into Tasfiks_Project(AuthorOfTheDB,Description)
values('Tasfik Rahman','This is an Instagram DB clone project done in MySql');