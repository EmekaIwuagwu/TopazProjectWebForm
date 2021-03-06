USE [SakalGBNewSignatureDB]
GO
/****** Object:  Table [dbo].[SakalPicturebase64_test]    Script Date: 1/19/2019 11:23:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SakalPicturebase64_test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[systemuser] [varchar](150) NULL,
	[base64string] [varchar](max) NULL,
 CONSTRAINT [PK_SakalPicturebase64_test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
