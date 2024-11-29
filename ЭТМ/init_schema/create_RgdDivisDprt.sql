CREATE TABLE  STV2024071542__DWH.RgdDivisDprt
  ( 
   RgdCode    integer NOT NULL,
   Class305_Code   varchar(12) NOT NULL,
   Class305_Code_1 varchar(6) NOT NULL,
   CONSTRAINT fk_Class305 FOREIGN KEY (Class305_Code) REFERENCES STV2024071542__DWH.Class305(Class305_Code)
   );