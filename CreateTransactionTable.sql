USE [MiniBankingDB]
GO

/****** Object:  Table [dbo].[Transaction]    Script Date: 2026-10-25 4:44:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Transaction](
	[TransactionID] [int] NOT NULL,
	[AffectedAccountID] [int] NULL,
	[SenderAccountID] [int] NULL,
	[ReceiverAccountID] [int] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime2](7) NOT NULL,
	[TransactionStatus] [varchar](20) NOT NULL,
	[TransactionType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Transaction] ADD  DEFAULT (sysdatetime()) FOR [TransactionDate]
GO

ALTER TABLE [dbo].[Transaction] ADD  DEFAULT ('Pending') FOR [TransactionStatus]
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([AffectedAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([ReceiverAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([SenderAccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD CHECK  (([Amount]>(0)))
GO

ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD CHECK  (([TransactionType]='Transfer' OR [TransactionType]='Withdrawal' OR [TransactionType]='Deposit'))
GO


