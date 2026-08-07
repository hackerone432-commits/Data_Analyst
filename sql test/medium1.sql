-- Cari 2 produk dengan total penjualan (spend) tertinggi di masing-masing kategori pada tahun 2022. 
-- Tampilkan kategori, nama produk, dan total spend-nya

WITH tabel AS (
  SELECT
    category,
    product,
    SUM(spend) AS total_spend
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
),
tabel1 AS (
  SELECT
    *,
    ROW_NUMBER() OVER(
      PARTITION BY category
      ORDER BY total_spend DESC
    ) AS ranke
  FROM tabel
)
SELECT
  category,
  product,
  total_spend
FROM tabel1
WHERE ranke IN (1,2);