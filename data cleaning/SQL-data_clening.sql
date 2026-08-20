-- cek nilai kosong

select
COUNTIF(nama IS NULL OR TRIM(nama) = '')
from sql007.vw_dim_pelanggan

-- cek nilai duplicate

select
*
from `sql007.vw_dim_produk`
qualify count(*) over(partition by produk_id) > 1

-- memperbaiki nilai duplicate

from `your_tabel`
qualify row_number() over(partition by produk_id order by produk_id) = 1

-- cek nilai null

select
  kolom,
  countif(nilai is null) as jumlah_null
from `sql007.vw_fact_penjualan`
unpivot (nilai for kolom in (nama_toko, kota, region, total_neto))
group by kolom
order by jumlah_null desc

#                                   -- DATA CLENING FOR GNERATE QUERY --


-- 1. atau dengan melakukan generate query dan ini cara cepat untuk menghitung nilai null di semua kolom

select string_agg(
  format("countif(%s is null) as null_%s", column_name, column_name), ",\n"
)
from `sql007.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'vw_fact_penjualan'

-- 2. Cek jumlah nilai unik (distinct) per kolom

select string_agg(
  format("countif(trim(%s) = '') as blank_%s", column_name, column_name), ",\n"
)
from `sql007.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'vw_fact_penjualan'
  and data_type = 'STRING'

-- 3. Generate TRIM() untuk semua kolom teks sekaligus — buat bersihin spasi di awal/akhir

select string_agg(
  format("trim(%s) as %s", column_name, column_name), ",\n"
)
from `sql007.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'vw_dim_toko'
  and data_type = 'STRING'

-- 4. Cek min & max untuk semua kolom numerik — deteksi outlier atau data aneh (misal harga negatif)

select string_agg(
  format("min(%s) as min_%s, max(%s) as max_%s", column_name, column_name, column_name, column_name), ",\n"
)
from `sql007.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'vw_fact_penjualan'
  and data_type in ('INT64', 'FLOAT64', 'NUMERIC')

-- 5. Generate INITCAP() untuk semua kolom teks sekaligus — rapiin kapitalisasi semua kolom nama/kota/region dalam satu langkah

select string_agg(
  format("initcap(trim(%s)) as %s", column_name, column_name), ",\n"
)
from `sql007.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'vw_dim_toko'
  and data_type = 'STRING'

-- 6. List semua kolom + tipe datanya — buat cek cepat struktur tabel tanpa buka schema manual

select column_name, data_type, is_nullable
from `sql007.INFORMATION_SCHEMA.COLUMNS`
where table_name = 'vw_fact_penjualan'
order by ordinal_position

-- Ringkasnya: generator-nya universal secara mekanisme (bisa jalan di tabel mana saja), 
-- tapi hasil akhirnya tetap perlu di-review manual sebelum dipakai
-- karena BigQuery nggak tahu mana kolom yang "seharusnya" dibersihkan dan mana yang bukan, dia cuma ngikutin tipe data doang.