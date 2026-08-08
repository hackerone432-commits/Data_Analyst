WITH sessions AS (
    SELECT
        DATE(created_at) AS order_date,
        COUNT(*) AS total_sessions
    FROM website_sessions
    GROUP BY DATE(created_at)
),

orders AS (
    SELECT
        DATE(created_at) AS order_date,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY DATE(created_at)
)

SELECT
    s.order_date,
    s.total_sessions,
    COALESCE(o.total_orders,0) AS total_orders,
    ROUND(
        COALESCE(o.total_orders,0) * 100.0
        / s.total_sessions,
        2
    ) AS conversion_rate
FROM sessions s
LEFT JOIN orders o
ON s.order_date = o.order_date
ORDER BY s.order_date;