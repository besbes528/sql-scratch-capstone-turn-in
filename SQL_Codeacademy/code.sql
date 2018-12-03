

1.1

SELECT COUNT(DISTINCT utm_campaign)
FROM page_visits;
SELECT COUNT(DISTINCT utm_source)
FROM page_visits;
SELECT DISTINCT utm_campaign, utm_source
FROM page_visits;

1.2

SELECT DISTINCT page_name
FROM page_visits;

2.1

SELECT *
FROM page_visits
ORDER BY user_id ASC
LIMIT 10;

2.2

WITH first_touch AS (
    SELECT user_id,
        MIN(timestamp) as first_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT ft.user_id,
    ft.first_touch_at,
    pv.utm_source,
		pv.utm_campaign,
    COUNT(utm_campaign)
FROM first_touch ft
JOIN page_visits pv
    ON ft.user_id = pv.user_id
    AND ft.first_touch_at = pv.timestamp
    GROUP BY utm_campaign
    ORDER BY 5 DESC;

2.3

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
    GROUP BY user_id)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
		pv.utm_campaign,
    COUNT(utm_campaign)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    GROUP BY utm_campaign
    ORDER BY 5 DESC;

2.4

SELECT COUNT(DISTINCT user_id)
FROM page_visits;
SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';

2.5

WITH last_touch AS (
    SELECT user_id,
        MAX(timestamp) as last_touch_at
    FROM page_visits
  WHERE page_name = '4 - purchase'
    GROUP BY user_id)
SELECT lt.user_id,
    lt.last_touch_at,
    pv.utm_source,
		pv.utm_campaign,
    COUNT(utm_campaign)
FROM last_touch lt
JOIN page_visits pv
    ON lt.user_id = pv.user_id
    AND lt.last_touch_at = pv.timestamp
    GROUP BY utm_campaign
    ORDER BY 5 DESC;

2.6

SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '1 - landing_page';

SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '2 - shopping_cart';

SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '3 - checkout';

SELECT COUNT(DISTINCT user_id)
FROM page_visits
WHERE page_name = '4 - purchase';