CREATE TABLE STV2024071542__DWH.DescKontrag (
            CliCode   integer NOT NULL PRIMARY KEY,
            CliHeadCode    integer NOT NULL,   
            Class71_Code varchar(10) NOT NULL,
            Class72_Code varchar(4) NOT NULL,
            Class42_Code varchar(14),
            dateArbDelay   date,
            SuppCust               varchar(60),
            CancelPenaltySymb       varchar(6),
            CancelRsrvPenCliSymb  varchar(6),   
            CliName  varchar(510) ,
            Class172_Code varchar(4),
            Class173_Code varchar(4),
            Class174_Code varchar(4),
            CliStructName varchar(60),
            CliInn varchar(24),
            CliDeact varchar(1),
            IsArbitration varchar(1),
            DateCre date,
            CONSTRAINT fk_Class71 FOREIGN KEY (Class71_Code) REFERENCES Class71 (Class71_Code)
)
UNSEGMENTED ALL NODES;