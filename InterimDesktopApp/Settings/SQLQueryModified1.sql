USE [E:\C#\SQLDATABASE\SQLDATABASE\INTERIMDB.MDF]
GO
/****** Object:  StoredProcedure [dbo].[Ajoutert_categorie]    Script Date: 5/21/2018 6:04:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Ajoutert_categorie]
 @id_categ int OUTPUT,
 @nom_categ nvarchar(50),
 @sal_categ float
AS
 IF EXISTS(SELECT * FROM t_categorie WHERE id_categ=@id_categ)
  RAISERROR('Clé primaire existant !',16,1)
 ELSE INSERT INTO t_categorie(id_categ,nom_categ,sal_categ)
  VALUES(@id_categ,@nom_categ,@sal_categ)
 SET @id_categ=@@IDENTITY
RETURN
