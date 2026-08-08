-- Growth Rate digunakan untuk melihat seberapa besar pertumbuhan dibanding periode sebelumnya.

-- Apakah revenue terus bertumbuh setiap bulan?

SELECT
    month,
    revenue,
    ROUND(
        (
            revenue
            - LAG(revenue) OVER(ORDER BY month)
        )
        *100.0
        /
        LAG(revenue) OVER(ORDER BY month),
        2
    ) AS growth_rate
FROM monthly_sales;
