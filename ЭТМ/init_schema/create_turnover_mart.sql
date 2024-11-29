CREATE TABLE IF NOT EXISTS STV2024071542__DWH.turnover_mart (
    report_month INT NOT NULL CHECK(report_month >= 1 AND report_month <= 12),
    report_quarter INT NOT NULL CHECK(report_quarter >= 1 AND report_quarter <= 4),
    report_semester INT NOT NULL CHECK(report_semester IN (1, 2)),
    report_year INT NOT NULL CHECK(report_year >= 2022),
    division_name VARCHAR(160) NOT NULL, -- Class305_Name_Level1, наименование может потребобваться для дашборда
    division_code VARCHAR(6) NOT NULL, -- первые 3 символа Class305_Code
    product_department_name VARCHAR(160) NOT NULL, -- Class305_Name_Level2, наименование может потребобваться для дашборда
    product_department_code VARCHAR(12) NOT NULL, -- первые 6 символов Class305_Code
    sales_channel VARCHAR(6) NOT NULL, -- из таблицы CliTurnoverDtl
    client_target_group VARCHAR(4) NOT NULL, -- первые два символа Class71_Code
    class_name_short VARCHAR(100) NOT NULL, -- поле требуется для дашбордов согласно примечанию к таблице Class71 
    region_code VARCHAR(2) NOT NULL, -- первый символ Class37_Code
    city_code VARCHAR(4) NOT NULL, -- первые два символа Class37_Code
    total_sum NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (total_sum >=0) -- требует уточнения, временно принят оборот в миллиардах
)
UNSEGMENTED ALL NODES;