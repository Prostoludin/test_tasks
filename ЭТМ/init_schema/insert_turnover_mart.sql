MERGE INTO STV2024071542__DWH.turnover_mart AS target
USING (
    SELECT  MONTH(ctd.DataInfo) AS report_month,
            QUARTER(ctd.DataInfo) AS report_quarter,
            CASE
                WHEN MONTH(ctd.DataInfo) BETWEEN 1 AND 6 THEN 1
                ELSE 2
            END AS report_semester,
            YEAR(ctd.DataInfo) AS report_year,
            LEFT(rdd.Class305_Code, 3) AS division_code,
            LEFT(rdd.Class305_Code, 6) AS product_department_code,
            ctd.SalesChannel AS sales_channel,
            LEFT(c71.Class71_Code, 2) AS client_target_group,
            c71.ClassNameShort AS class_name_short,
            LEFT(c37.Class37_Code, 1) AS region_code,
            LEFT(c37.Class37_Code, 2) AS city_code,
            SUM(SumSaled) AS total_sum
    FROM STV2024071542__DWH.CliTurnoverDtl as ctd
    INNER JOIN STV2024071542__DWH.RgdDivisDprt AS rdd ON rdd.RgdCode = ctd.RgdCode
    INNER JOIN STV2024071542__DWH.DescKontrag AS dk ON dk.CliCode = ctd.CliCode
    INNER JOIN STV2024071542__DWH.Class71 AS c71 ON c71.Class71_Code = dk.Class71_Code
    INNER JOIN STV2024071542__DWH.Class37 AS c37 ON c37.Class37_Code = ctd.Class37_Code
    WHERE MONTH(CURRENT_DATE) - MONTH(DataInfo) <= 24
    GROUP BY    report_month,
                report_quarter,
                report_semester,
                report_year,
                division_code,
                product_department_code,
                sales_channel,
                client_target_group,
                class_name_short,
                region_code,
                city_code) AS source
ON 
    target.report_month = source.report_month
    AND target.report_quarter = source.report_quarter
    AND target.report_semester = source.report_semester
    AND target.report_year = source.report_year
    AND target.division_code = source.division_code
    AND target.product_department_code = source.product_department_code
    AND target.sales_channel = source.sales_channel
    AND target.client_target_group = source.client_target_group
    AND target.class_name_short = source.class_name_short
    AND target.region_code = source.region_code
    AND target.city_code = source.city_code
WHEN MATCHED THEN
    UPDATE SET
        total_sum = source.total_sum
WHEN NOT MATCHED THEN
    INSERT (report_month,
            report_quarter,
            report_semester,
            report_year,
            division_code,
            product_department_code,
            sales_channel,
            client_target_group,
            class_name_short,
            region_code,
            city_code,
            total_sum)
    VALUES (source.report_month,
            source.report_quarter,
            source.report_semester,
            source.report_year,
            source.division_code,
            source.product_department_code,
            source.sales_channel,
            source.client_target_group,
            source.class_name_short,
            source.region_code,
            source.city_code,
            source.total_sum);