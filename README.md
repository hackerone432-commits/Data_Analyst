# Analisis Penjualan ElectroMax

## Tentang Project

Project ini bertujuan untuk menganalisis performa penjualan ElectroMax selama periode 2023–2025, mengidentifikasi faktor yang berkaitan dengan perubahan revenue, serta menghasilkan insight dan rekomendasi yang dapat mendukung pengambilan keputusan bisnis.

Project ini dibuat sebagai portfolio untuk menunjukkan kemampuan dalam melakukan proses analisis data mulai dari data preparation, data modeling, perhitungan KPI, analisis statistik, hingga penyusunan rekomendasi bisnis.

---

## Pertanyaan Bisnis

Analisis ini dilakukan untuk menjawab beberapa pertanyaan bisnis:

1. Bagaimana perkembangan revenue perusahaan selama periode 2023–2025?
2. Faktor apa yang paling berkaitan dengan peningkatan atau penurunan revenue?
3. Subkategori produk mana yang memberikan kontribusi revenue terbesar?
4. Apakah perubahan revenue lebih kuat berkaitan dengan perubahan jumlah transaksi atau AOV?
5. Strategi apa yang dapat direkomendasikan berdasarkan hasil analisis?

---

## Tools yang Digunakan

- Microsoft Excel
- Power Query
- Power Pivot
- DAX
- Power BI

### Skill yang Digunakan

- Data Cleaning
- Data Transformation
- Data Modeling
- KPI Calculation
- Year-over-Year Analysis
- Correlation Analysis
- Revenue Analysis
- Business Analysis
- Data Visualization

---

## Data Preparation

Tahapan persiapan data yang dilakukan:

- Membersihkan data transaksi
- Memeriksa dan memperbaiki tipe data
- Membuat Date Dimension
- Membuat hubungan antara tabel fakta dan tabel dimensi
- Membuat calculated measures menggunakan DAX
- Menghitung Net Revenue
- Menghitung Gross Profit
- Menghitung AOV
- Menghitung pertumbuhan YoY
- Melakukan agregasi data secara bulanan

---

## KPI yang Digunakan

Analisis menggunakan beberapa KPI utama:

| KPI | Tujuan |
|---|---|
| Net Revenue | Mengukur pendapatan bersih |
| Revenue YoY % | Mengukur perubahan revenue dibandingkan tahun sebelumnya |
| Transaction Count | Mengukur volume transaksi |
| Transaction YoY % | Mengukur perubahan jumlah transaksi |
| AOV | Mengukur nilai rata-rata transaksi |
| AOV YoY % | Mengukur perubahan nilai rata-rata transaksi |
| Gross Profit | Mengukur keuntungan kotor |
| GPM % | Mengukur margin keuntungan kotor |

---

# Analisis Revenue Driver

Untuk mengetahui faktor yang paling berkaitan dengan perubahan revenue, dilakukan analisis korelasi terhadap perubahan YoY bulanan pada periode 2024–2025.

### Hasil Korelasi

| Hubungan | Korelasi |
|---|---:|
| Revenue YoY vs Transaction YoY | **0,746** |
| Revenue YoY vs AOV YoY | **0,482** |

### Insight

Hasil analisis menunjukkan bahwa **Revenue YoY memiliki hubungan yang lebih kuat dengan Transaction YoY dibandingkan dengan AOV YoY**.

Nilai korelasi:

- Revenue YoY ↔ Transaction YoY = **0,746**
- Revenue YoY ↔ AOV YoY = **0,482**

Hal ini menunjukkan bahwa perubahan jumlah transaksi memiliki hubungan yang lebih kuat dengan perubahan revenue dibandingkan perubahan nilai rata-rata transaksi selama periode analisis.

> **Catatan:** Korelasi menunjukkan hubungan, bukan hubungan sebab-akibat.

---

# Rekomendasi Bisnis

Berdasarkan hasil analisis, beberapa rekomendasi yang dapat diberikan adalah:

### 1. Memprioritaskan peningkatan jumlah transaksi

Karena Transaction YoY memiliki korelasi yang lebih kuat dengan Revenue YoY, perusahaan dapat memprioritaskan strategi yang bertujuan meningkatkan volume transaksi.

### 2. Mengevaluasi periode dengan penurunan transaksi

Perusahaan perlu melakukan analisis lebih lanjut terhadap bulan-bulan ketika transaksi mengalami penurunan untuk mengetahui penyebabnya.

Analisis dapat dilanjutkan berdasarkan:

- Produk
- Subkategori
- Toko
- Channel
- Pelanggan
- Promosi

### 3. Meningkatkan AOV sebagai strategi pendukung

Walaupun hubungan AOV dengan revenue lebih rendah dibandingkan transaksi, peningkatan AOV tetap dapat digunakan sebagai strategi pendukung melalui:

- Bundling
- Upselling
- Cross-selling

### 4. Mengevaluasi efektivitas promosi

Promosi perlu dievaluasi berdasarkan kontribusinya terhadap peningkatan jumlah transaksi dan revenue, bukan hanya berdasarkan jumlah diskon yang diberikan.

---

# Alur Analisis

```text
Data Transaksi
      ↓
Data Cleaning
      ↓
Data Modeling
      ↓
DAX Measures
      ↓
KPI Analysis
      ↓
YoY Analysis
      ↓
Correlation Analysis
      ↓
Business Insight
      ↓
Business Recommendation
