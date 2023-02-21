-- Пожалуйста,
-- создайте представление базы данных (с именем v_generated_dates),
-- которое должно «хранить» сгенерированные даты с 1 по 31 января 2022 года в формате DATE.
-- Не забывайте о порядке для столбца generate_date.


-- generated_date
-- 2022-01-01
-- 2022-01-02

CREATE VIEW v_generated_dates AS
SELECT date(d) AS generated_date
FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') AS d
ORDER BY 1
