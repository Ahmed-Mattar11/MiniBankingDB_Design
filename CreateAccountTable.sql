USE [MiniBankingDB]
GO

/****** Object:  Table [dbo].[Account]    Script Date: 2026-10-25 4:44:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Account](
	[AccountID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[AccountNumber] [varchar](20) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[AccountType] [varchar](20) NOT NULL,
	[AccountStatus] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Balance]
GO

ALTER TABLE [dbo].[Account] ADD  DEFAULT ('Active') FOR [AccountStatus]
GO

ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO


