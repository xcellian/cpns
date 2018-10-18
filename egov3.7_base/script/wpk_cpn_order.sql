USE [TEST]
GO

/*********************************************************************************/
/****** Object:  Table [dbo].[WPK_CPNS_CUST_MST]    Script Date: 2018-06-22 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPK_CPNS_CUST_MST](
	[PARK_CD] 				[varchar](5) 		NOT NULL,
	[CUST_SEQ] 				[varchar](14) 		NOT NULL,
	[CUST_ID] 				[varchar](20) 		NOT NULL,
	[CUST_PWD] 				[varchar](100) 		NOT NULL,
	[CUST_NM] 				[nvarchar](30) 		NOT NULL,
	[BIZRNO] 				[varchar](15) 		NULL,
	[OWNER_NM] 				[nvarchar](20) 		NULL,
	[CHARGE_NM] 			[nvarchar](20) 		NOT NULL,
	[E_MAIL_ADDR] 			[varchar](100) 		NULL,
	[DONG] 					[varchar](10) 		NULL,
	[HO] 					[varchar](5) 		NULL,
	[TEL_NO] 				[varchar](15) 		NULL,
	[MOBILE] 				[varchar](100) 		NULL,
	[FAX_NO] 				[varchar](15) 		NULL,
	[USE_YN] 				[bit] 				NOT NULL,
	[REG_DT] 				[datetime2](7) 		NOT NULL,
	[REG_ID] 				[varchar](20) 		NULL,
	[UPDT_DT] 				[datetime2](7) 		NULL,
	[UPDT_ID] 				[varchar](20) 		NULL,
	[MEMO] 					[nvarchar](200) 	NULL,
 CONSTRAINT [IDX_WPK_CPNS_CUST_MST_PK] PRIMARY KEY CLUSTERED 
(
	[CUST_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WPK_CPNS_CUST_MST] ADD  DEFAULT ((1)) FOR [USE_YN]
GO
ALTER TABLE [dbo].[WPK_CPNS_CUST_MST] ADD  DEFAULT (getdate()) FOR [REG_DT]
GO


/***********************************************************************************/
/****** Object:  Table [dbo].[WPK_CPNS_COUPON_MST]    Script Date: 2018-06-22 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPK_CPNS_COUPON_MST](
	[PARK_CD] 				[varchar](5) 		NOT NULL,
	[CPN_SEQ] 				[varchar](5) 		NOT NULL,
	[CPN_NM] 				[nvarchar](30) 		NOT NULL,
	[DC_TYPE] 				[char](5) 			NOT NULL,
	[DC_AMT] 				[int] 				NULL,
	[DC_TM] 				[int] 				NULL,
	[DC_RATE] 				[int] 				NULL,
	[PRICE] 				[int] 				NOT NULL,
	[CPN_TYPE] 				[char](5) 			NOT NULL,
	[USE_YN] 				[bit] 				NOT NULL,
	[REG_DT] 				[datetime2](7) 		NOT NULL,
	[REG_ID] 				[varchar](20) 		NULL,
	[UPDT_DT] 				[datetime2](7) 		NULL,
	[UPDT_ID] 				[varchar](20) 		NULL,
 CONSTRAINT [IDX_WPK_CPNS_COUPON_MST_PK] PRIMARY KEY CLUSTERED 
(
	[PARK_CD] ASC,
	[CPN_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WPK_CPNS_COUPON_MST] ADD  DEFAULT ((1)) FOR [USE_YN]
GO
ALTER TABLE [dbo].[WPK_CPNS_COUPON_MST] ADD  DEFAULT (getdate()) FOR [REG_DT]
GO



/*************************************************************************************/
/****** Object:  Table [dbo].[WPK_CPNS_CUST_CPN_MNG]    Script Date: 2018-06-22 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG](
	[PARK_CD] 				[varchar](5) 		NOT NULL,
	[CUST_SEQ] 				[varchar](14) 		NOT NULL,
	[CPN_SEQ] 				[varchar](5) 		NOT NULL,
	[USE_YN] 				[bit] 				NOT NULL,
	[REG_DT] 				[datetime2](7) 		NOT NULL,
	[REG_ID] 				[varchar](20) 		NULL,
	[UPDT_DT] 				[datetime2](7) 		NULL,
	[UPDT_ID] 				[varchar](20) 		NULL,
 CONSTRAINT [IDX_WPK_CPNS_CUST_CPN_MNG_PK] PRIMARY KEY CLUSTERED 
(
	[PARK_CD] ASC,
	[CUST_SEQ] ASC,
	[CPN_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG]  WITH CHECK ADD  CONSTRAINT [IDX_WPK_CPNS_CUST_CPN_MNG_FK0] FOREIGN KEY([CUST_SEQ])
REFERENCES [dbo].[WPK_CPNS_CUST_MST] ([CUST_SEQ])
GO
ALTER TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG] CHECK CONSTRAINT [IDX_WPK_CPNS_CUST_CPN_MNG_FK0]
GO
ALTER TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG]  WITH CHECK ADD  CONSTRAINT [IDX_WPK_CPNS_CUST_CPN_MNG_FK1] FOREIGN KEY([PARK_CD], [CPN_SEQ])
REFERENCES [dbo].[WPK_CPNS_COUPON_MST] ([PARK_CD], [CPN_SEQ])
GO
ALTER TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG] CHECK CONSTRAINT [IDX_WPK_CPNS_CUST_CPN_MNG_FK1]
GO

ALTER TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG] ADD  DEFAULT ((1)) FOR [USE_YN]
GO
ALTER TABLE [dbo].[WPK_CPNS_CUST_CPN_MNG] ADD  DEFAULT (getdate()) FOR [REG_DT]
GO



/**********************************************************************************/
/****** Object:  Table [dbo].[WPK_CPNS_CPN_ORDER]    Script Date: 2018-06-22 10:11:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPK_CPNS_CPN_ORDER](
	[ORDER_SEQ] 			[varchar](40) 		NOT NULL,
	[CUST_SEQ] 				[varchar](14) 		NOT NULL,
	[CPN_TYPE] 				[char](5) 			NOT NULL,
	[AMT] 					[int] 				NOT NULL,
	[ORDER_STAT] 			[char](5) 			NOT NULL,
	[PAY_TYPE] 				[char](2) 			NOT NULL,
	[PAY_TYPE_NM] 			[nvarchar](10) 		NULL,
	[ORDER_DT] 				[datetime2](7) 		NOT NULL,
	[INVOICE_ISSUE] 		[bit] 				NULL,
	[INVOICE_BIZRNO] 		[varchar](15) 		NULL,
	[CHARGE_ID] 			[varchar](20) 		NOT NULL,
	[CHARGE_NM] 			[nvarchar](20) 		NULL,
	[REG_DT] 				[datetime2](7) 		NOT NULL,
	[REG_ID] 				[varchar](20) 		NULL,
	[UPDT_DT] 				[datetime2](7) 		NULL,
	[UPDT_ID] 				[varchar](20) 		NULL,
	[SHIPPING_ADDR] 		[nvarchar](100) 	NULL,
	[RECEIVER_NM] 			[nvarchar](20) 		NULL,
	[RECEIVER_TEL_NO] 		[varchar](15) 		NULL,
	[CANCEL_YN] 			[bit] 				NOT NULL,
	[CANCEL_DT] 			[datetime2](7) 		NULL,
	[MEMO] 					[nvarchar](200) 	NULL,
 CONSTRAINT [IDX_ORDER_PK] PRIMARY KEY CLUSTERED 
(
	[ORDER_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WPK_CPNS_CPN_ORDER] ADD  DEFAULT ((0)) FOR [CANCEL_YN]
GO
ALTER TABLE [dbo].[WPK_CPNS_CPN_ORDER] ADD  DEFAULT (getdate()) FOR [REG_DT]
GO



/*************************************************************************************/
/****** Object:  Table [dbo].[WPK_CPNS_ORDER_DETAIL]    Script Date: 2018-06-22 10:11:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPK_CPNS_ORDER_DETAIL](
	[ORDER_SEQ] 			[varchar](40) 		NOT NULL,
	[CUST_SEQ] 				[varchar](14) 		NOT NULL,
	[CPN_SEQ] 				[varchar](5) 		NOT NULL,
	[CPN_NM] 				[nvarchar](30) 		NOT NULL,
	[DC_TYPE] 				[char](5) 			NOT NULL,
	[DC_TYPE_NM] 			[nvarchar](20) 		NOT NULL,
	[DC_AMT] 				[int] 				NULL,
	[DC_TM] 				[int] 				NULL,
	[DC_RATE] 				[int] 				NULL,
	[QTY] 					[int] 				NOT NULL,
	[PRICE] 				[int] 				NOT NULL,
	[AMT] 					[int] 				NOT NULL,
	[REG_DT] 				[datetime2](7) 		NOT NULL,
	[REG_ID] 				[varchar](20) 		NULL,
	[UPDT_DT] 				[datetime2](7) 		NULL,
	[UPDT_ID] 				[varchar](20) 		NULL,
 CONSTRAINT [IDX_WPK_CPNS_ORDER_DETAIL_PK] PRIMARY KEY CLUSTERED 
(
	[ORDER_SEQ] ASC,
	[CUST_SEQ] ASC,
	[CPN_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WPK_CPNS_ORDER_DETAIL]  WITH CHECK ADD  CONSTRAINT [IDX_WPK_CPNS_ORDER_DETAIL_FK0] FOREIGN KEY([ORDER_SEQ])
REFERENCES [dbo].[WPK_CPNS_CPN_ORDER] ([ORDER_SEQ])
GO
ALTER TABLE [dbo].[WPK_CPNS_ORDER_DETAIL] CHECK CONSTRAINT [IDX_WPK_CPNS_ORDER_DETAIL_FK0]
GO

ALTER TABLE [dbo].[WPK_CPNS_ORDER_DETAIL] ADD  DEFAULT (getdate()) FOR [REG_DT]
GO



/*********************************************************************************/
/****** Object:  Table [dbo].[WPK_CPNS_PAY_INFO]    Script Date: 2018-06-22 10:11:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WPK_CPNS_PAY_INFO](
	[ORDER_SEQ] 			[varchar](40) 		NOT NULL,
	[PAY_SEQ] 				[int] 				NOT NULL,
	[ORDER_DT] 				[datetime2](7) 		NOT NULL,
	[CUST_SEQ] 				[varchar](14) 		NOT NULL,
	[CUST_NM] 				[nvarchar](30) 		NULL,
	[RES_CD] 				[char](4) 			NULL,
	[RES_MSG] 				[varchar](100) 		NULL,
	[CNO] 					[varchar](20) 		NULL,
	[AMOUNT] 				[int] 				NOT NULL,
	[AUTH_NO] 				[varchar](20) 		NULL,
	[TRAN_DATE] 			[varchar](14) 		NULL,
	[ESCROW_YN] 			[char](1) 			NULL,
	[COMPLEX_YN] 			[char](1) 			NULL,
	[STAT_CD] 				[char](4) 			NULL,
	[STAT_MSG] 				[varchar](100) 		NULL,
	[PAY_TYPE] 				[varchar](4) 		NULL,
	[CARD_NO] 				[varchar](40) 		NULL,
	[ISSUER_CD] 			[varchar](3) 		NULL,
	[ISSUER_NM] 			[varchar](20) 		NULL,
	[ACQUIER_CD] 			[varchar](3) 		NULL,
	[ACQUIER_NM] 			[varchar](20) 		NULL,
	[INSTALL_PERIOD] 		[char](2) 			NULL,
	[NOINT] 				[char](2) 			NULL,
	[PART_CANCEL_YN] 		[char](1) 			NULL,
	[CARD_GUBUN] 			[char](1) 			NULL,
	[CARD_BIZ_GUBUN] 		[char](1) 			NULL,
	[BANK_CD] 				[varchar](3) 		NULL,
	[BANK_NM] 				[varchar](20) 		NULL,
	[ACCOUNT_NO] 			[varchar](20) 		NULL,
	[DEPOSIT_NM] 			[varchar](10) 		NULL,
	[EXPIRE_DATE] 			[varchar](14) 		NULL,
	[CASH_RES_CD] 			[varchar](4) 		NULL,
	[CASH_RES_MSG] 			[varchar](64) 		NULL,
	[CASH_AUTH_NO] 			[varchar](20) 		NULL,
	[CASH_TRAN_DATE] 		[varchar](14) 		NULL,
	[CASH_ISSUE_TYPE] 		[char](2) 			NULL,
	[CASH_AUTH_TYPE] 		[char](1) 			NULL,
	[CASH_AUTH_VALUE] 		[varchar](20) 		NULL,
	[CANC_ACQ_DATE] 		[varchar](14) 		NULL,
	[CANC_DATE] 			[varchar](14) 		NULL,
	[JOIN_NO] 				[varchar](100) 		NULL,
	[REG_DT] 				[datetime2](7) 		NOT NULL,
	[REG_ID] 				[varchar](20) 		NULL,
	[UPDT_DT] 				[datetime2](7) 		NULL,
	[UPDT_ID] 				[varchar](20) 		NULL,
 CONSTRAINT [IDX_WPK_CPNS_PAY_INFO_PK] PRIMARY KEY CLUSTERED 
(
	[ORDER_SEQ] ASC,
	[PAY_SEQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[WPK_CPNS_PAY_INFO]  WITH CHECK ADD  CONSTRAINT [IDX_WPK_CPNS_PAY_INFO_FK0] FOREIGN KEY([ORDER_SEQ])
REFERENCES [dbo].[WPK_CPNS_CPN_ORDER] ([ORDER_SEQ])
GO
ALTER TABLE [dbo].[WPK_CPNS_PAY_INFO] CHECK CONSTRAINT [IDX_WPK_CPNS_PAY_INFO_FK0]
GO

ALTER TABLE [dbo].[WPK_CPNS_PAY_INFO] ADD  DEFAULT ((1)) FOR [PAY_SEQ]
GO
ALTER TABLE [dbo].[WPK_CPNS_PAY_INFO] ADD  DEFAULT (getdate()) FOR [REG_DT]
GO
