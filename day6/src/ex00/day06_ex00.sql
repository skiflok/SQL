-- Необходимо создать новую реляционную таблицу
-- (укажите имя person_discounts) со следующими правилами.
--
-- установите атрибут id как первичный ключ (пожалуйста,
-- посмотрите на столбец id в существующих таблицах и выберите тот же тип данных)
--
-- установить внешние ключи атрибутов person_id и pizzeria_id для соответствующих таблиц
-- (типы данных должны быть такими же, как и для столбцов id в соответствующих родительских таблицах)
--
-- пожалуйста, установите явные имена для ограничений внешних ключей по шаблону
-- fk_{table_name}_{column_name}, например fk_person_discounts_person_id
--
-- добавьте атрибут скидки для хранения значения скидки в процентах.
-- Помните, что значение скидки может быть числом с плавающей
-- запятой (просто используйте numeric тип данных).
-- Поэтому, пожалуйста, выберите соответствующий тип данных,
-- чтобы покрыть эту возможность.

CREATE TABLE person_discounts
(
    id          BIGINT PRIMARY KEY,
    person_id   BIGINT,
    pizzeria_id BIGINT,
    discount    NUMERIC,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person (id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria (id)
)
