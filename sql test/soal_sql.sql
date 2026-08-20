#-------------------------------------------------------
SOAL 1

select
*
from `sql007.vw_dim_produk`
where status_aktif = 1

#-------------------------------------------------------
SOAL 2

select
penjualan_id, 
produk_id, 
kuantitas, 
total_neto, 
gross_profit
from `sql007.vw_fact_penjualan`
where total_neto > 5000000
order by total_neto desc

#------------------------------------------------------
SOAL 3

with penjualan as (
  select
  a.penjualan_id, 
  a.waktu_id,
  a.total_neto,
  a.gross_profit,
  b.tahun
  from `sql007.vw_fact_penjualan` a
  join `sql007.vw_dim_waktu` b on a.waktu_id = b.waktu_id
)
select
penjualan_id, 
waktu_id,
total_neto,
gross_profit,
tahun
from penjualan
where tahun = 2024


#------------------------------------------------------
SOAL 4

select
*
from `sql007.vw_dim_produk`
where harga_normal > 5000000


#------------------------------------------------------
SOAL 5

select
produk_id,
sum(total_neto) as revenue_per_produk_id
from `sql007.vw_fact_penjualan`
group by 1
order by 2 desc



#------------------------------------------------------
SOAL 6

with penjualan as(
  select
  produk_id,
  sum(kuantitas) as total_kuantitas,
  row_number() over (order by sum(kuantitas) desc) as rank
  from `sql007.vw_fact_penjualan`
  group by 1
)
select
produk_id,
total_kuantitas
from tabel
where penjualan between 1 and 10


#------------------------------------------------------
SOAL 7

select
toko_id,
sum(gross_profit) as total_gross_profit
from `sql007.vw_fact_penjualan`
group by 1
order by 2 desc

#------------------------------------------------------
SOAL 8

select
b.tahun,
b.bulan,
b.nomor_bulan,
sum(a.total_neto) as revenue
from `sql007.vw_fact_penjualan` a
join `sql007.vw_dim_waktu` b on a.waktu_id = b.waktu_id
group by 1, 2, 3

#------------------------------------------------------
SOAL 9

select
b.kategori, 
b.subkategori,
sum(a.total_neto) as revenue
from `sql007.vw_fact_penjualan` a
join `sql007.vw_dim_produk` b on a.produk_id = b.produk_id
group by 1, 2
order by 3 desc

#------------------------------------------------------
SOAL 10

with penjualan as (
  select
  b.nama_toko, 
  b.kota, 
  b.region,
  sum(a.total_neto) as revenue,
  sum(a.gross_profit) as gross_profit,
  row_number() over(order by sum(a.total_neto) desc) as rank1,
  row_number() over(order by sum(a.gross_profit) desc) as rank2
  from `sql007.vw_fact_penjualan` a
  join `sql007.vw_dim_toko` b on a.toko_id = b.toko_id
  group by 1, 2, 3
)
select
nama_toko,
kota,
region,
total_neto,
gross_profit
from penjualan
where rank1 = 1 and rank2 = 1


#------------------------------------------------------
SOAL 11

select
b.segmen,
sum(a.total_neto) as revenue
from `sql007.vw_fact_penjualan` a
join `sql007.vw_dim_pelanggan` b on a.pelanggan_id = b.pelanggan_id
group by 1
order by 2 desc
limit 1

#------------------------------------------------------
SOAL 12

select
segmen,
count(*) as total_customer
from `sql007.vw_dim_pelanggan`
group by 1

#------------------------------------------------------
SOAL 13

select
count(*)
from `sql007.vw_fact_penjualan`
where diskon_persen > 0

#------------------------------------------------------
SOAL 14

with penjualan as (
  select
  a.produk_id,
  b.nama_produk,
  b.kategori,
  b.merek,
  sum(a.total_neto) as revenue,
  row_number() over(order by sum(a.total_neto) desc) as rank
  from `sql007.vw_fact_penjualan` a
  join `sql007.vw_dim_produk` b on a.produk_id = b.produk_id
  group by 1, 2, 3, 4
  qualify rank <= 10
)
select
nama_produk,
kategori,
merek,
revenue
from penjualan


#------------------------------------------------------
SOAL 15

with penjualan_toko as (
  select
    a.toko_id,
    a.waktu_id,
    c.tahun,
    c.bulan,
    a.total_neto,
    b.nama_toko,
    b.target_bulanan
  from `sql007.vw_fact_penjualan` a
  join `sql007.vw_dim_toko` b on a.toko_id = b.toko_id
  join `sql007.vw_dim_waktu` c on a.waktu_id = c.waktu_id
)

select
  tahun,
  bulan,
  nama_toko,
  round(sum(total_neto) / max(target_bulanan) * 100, 2) as achievement_pct
from penjualan_toko
group by 1, 2, 3
having achievement_pct > 100.00
order by tahun, bulan, achievement_pct desc

#------------------------------------------------------
SOAL 16

select 
produk_id,
revenue_per_produk_id
from (
  select
  produk_id,
  sum(total_neto) as revenue_per_produk_id
  from `sql007.vw_fact_penjualan`
  group by 1
)
where revenue_per_produk_id > (select avg(avg_per_produk_id)
                  from(
                  select
                  produk_id,
                  sum(total_neto) as avg_per_produk_id
                  from `sql007.vw_fact_penjualan`
                  group by 1
)
)

#------------------------------------------------------
SOAL 17

with penjualan_toko as (
  select
  toko_id,
  sum(gross_profit) as gross_profit
  from `sql007.vw_fact_penjualan`
  group by 1
)
select
toko_id,
gross_profit
from penjualan_toko
where gross_profit > (select avg(gross_profit) from penjualan_toko)

#------------------------------------------------------
SOAL 18

select
b.subkategori,
b.nama_produk,
sum(a.total_neto) as revenue,
row_number() over(partition by b.subkategori order by sum(a.total_neto) desc) as rank
from `sql007.vw_fact_penjualan` a
join `sql007.vw_dim_produk` b on a.produk_id = b.produk_id
group by 1,2
qualify rank = 1

#------------------------------------------------------
SOAL 19

with revenue_bulanan as(
  select
  b.tahun,
  b.bulan,
  sum(total_neto) as revenue
  from `sql007.vw_fact_penjualan` a
  join `sql007.vw_dim_waktu` b on a.waktu_id = b.waktu_id
  group by 1,2
)
select
tahun,
bulan,
lag(revenue) over(order by tahun,bulan) as revenue_bulan_lalu,
round((revenue - lag(revenue) over(order by tahun,bulan)) / lag(revenue) over(order by tahun,bulan) * 100, 2) as growth_pct
from revenue_bulanan

#------------------------------------------------------
SOAL 20


#------------------------------------------------------
SOAL 21


