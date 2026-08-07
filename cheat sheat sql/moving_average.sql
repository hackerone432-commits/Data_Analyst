
-- ini jika tanggal nya tidak duplicate maka kita bisa langsung menghitung moving average nya
SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (
            PARTITION BY user_id
            ORDER BY tweet_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_avg_7d
FROM tweets
ORDER BY user_id, tweet_date;


-- jika tanggal nya duplikat tapi jumlah order nya berbeda maka kita perlu menjumlahkan order nya
-- dan mengelompokan nya berdasarkan tanggal
WITH daily_tweets AS (
    SELECT
        user_id,
        tweet_date,
        SUM(tweet_count) AS daily_tweet_count
    FROM tweets
    GROUP BY user_id, tweet_date
)

SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(daily_tweet_count) OVER (
            PARTITION BY user_id
            ORDER BY tweet_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS rolling_avg_7d
FROM daily_tweets;

-- ini rumus nya

-- | Rolling Average | Window Frame                                |
-- | --------------- | ------------------------------------------- |
-- | 3 hari          | `ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`  |
-- | 5 hari          | `ROWS BETWEEN 4 PRECEDING AND CURRENT ROW`  |
-- | 7 hari          | `ROWS BETWEEN 6 PRECEDING AND CURRENT ROW`  |
-- | 30 hari         | `ROWS BETWEEN 29 PRECEDING AND CURRENT ROW` |
