# ElectroMax Sales, Revenue & Customer Behavioral Analysis

## Project Files

- Excel Analysis [HERE](https://github.com/hackerone432-commits/Data_Analyst/blob/master/Retail%20-%20ElectroMax.xlsx)
- Dashboard Power BI [HERE](https://github.com/hackerone432-commits/Data_Analyst/blob/master/Retail%20-%20ElectroMax.pbix)

## Tentang Project

Project ini bertujuan untuk menganalisis performa penjualan ElectroMax selama periode 2023–2025 serta memahami faktor yang berkaitan dengan perubahan revenue dan perilaku pelanggan.

Analisis dilakukan melalui dua fokus utama:

### 1. **Sales & Revenue Analysis**
   - Menganalisis perkembangan revenue
   - Menganalisis korelasi YoY
   - Menganalisis AOV
   - Mengidentifikasi faktor yang berkaitan dengan perubahan revenue

#### pertanyaan

**Faktor apa yang paling berkaitan dengan penurunan atau peningkatan revenue perusahaan?**

#### insight

Perubahan revenue paling sering berkaitan dengan perubahan transaksi. Namun, AOV menjadi faktor penting pada periode tertentu,
terutama ketika transaksi meningkat tetapi revenue tetap menurun seperti Mei dan Juni 2025.

#### rekomendasi

Prioritaskan pertumbuhan transaksi sebagai pendorong utama pertumbuhan revenue, karena Transaction YoY memiliki korelasi terkuat dengan Net Revenue YoY (r = 0,747).
Meski demikian, pertumbuhan transaksi perlu dibarengi dengan strategi untuk menjaga AOV, terutama melalui bundling, upselling, dan penetapan ambang batas promosi yang tepat sasaran.
Penurunan revenue yang signifikan pada Oktober 2025 perlu diselidiki lebih lanjut berdasarkan channel, produk, dan toko untuk mengidentifikasi sumber utama hilangnya transaksi.

---

### 2. **Customer Behavioral & Retention Analysis**
   - RFM Analysis
   - Mengidentifikasi perubahan perilaku pelanggan
   - Membuat rule-based customer risk scoring
   - Membandingkan Risk Score 2024 dengan actual customer behavior 2025
   - Mengevaluasi kemampuan awal risk scoring dalam mengidentifikasi customer yang mengalami penurunan aktivitas

#### pertanyaan

**Bagaimana perubahan perilaku pembelian pelanggan dari 2024 ke 2025 dapat digunakan untuk mengidentifikasi pelanggan yang berisiko churn,
mengukur potensi dampak terhadap revenue, dan menentukan prioritas strategi retention?**

#### insight & rekomedasi

Analisis menunjukkan bahwa kelompok **Declining** merupakan prioritas utama retention karena mencakup 38,58% pelanggan dan berkontribusi 41,75% terhadap revenue 2024
Sementara itu, kelompok **At Risk** memiliki penurunan frequency paling tajam sebesar 39,30%,
sehingga memerlukan intervensi re-engagement untuk mencegah penurunan lebih lanjut.
Di sisi lain, kelompok **Increasing** yang mencakup 37,24% pelanggan dengan pertumbuhan frequency 29,46% merupakan peluang untuk strategi upselling dan cross-selling.

- Eksperimen risk scoring berbasis RFM 2024 belum menunjukkan kemampuan yang konsisten dalam memprediksi pelanggan At Risk pada 2025.
Oleh karena itu, risk score tersebut lebih tepat digunakan sebagai indikator eksploratif, bukan sebagai model prediksi churn final.


## Tools Used in Project

- Microsoft Excel
- Power Query
- Power Pivot
- DAX
- Power BI

## Skills Used in Project

- Data Profiling
- Data Cleaning
- Data Transformation
- Data Modeling
- KPI Analysis
- RFM Analysis
- Correlation Analysis
- Customer Segmentation
- Rule-Based Risk Scoring
- Model Evaluation
- Business Analysis
- Data Visualization
- Business Recommendation

## Additional Skills

- SQL
- Google BigQuery

Project ini dibuat sebagai portfolio untuk menunjukkan kemampuan melakukan analisis data end-to-end, mulai dari data preparation, data modeling, KPI calculation, statistical analysis, customer segmentation, rule-based modeling, model validation, hingga business recommendation.
