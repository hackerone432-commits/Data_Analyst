-- Berapa total penjualan kumulatif setiap transaksi?

SELECT
    order_date,
    sales,
    SUM(sales) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM orders;

-- Berapa total penjualan kumulatif per hari?

WITH daily_sales AS (
    SELECT
        order_date,
        SUM(sales) AS daily_total
    FROM orders
    GROUP BY order_date
)

SELECT
    order_date,
    daily_total,
    SUM(daily_total) OVER (
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS running_total
FROM daily_sales
ORDER BY order_date;