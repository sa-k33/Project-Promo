-- Search for details of a promotion campign with its corresponding id
SELECT * FROM "promotions"
WHERE "id" = 0331;

-- Search for all the items and their prices in an order with the specified customer ID
SELECT "product_id", "products.name", "products.price", "quantity", "item_promo", "total_promo", "created"
FROM "order"
JOIN "products" ON products.id = order.product_id
WHERE "customer_id" = 1166
AND "id" = 0012;

-- Search for the top 5 best-selling products
SELECT "product_id", "products.name", SUM("quantity")
FROM "order"
JOIN "products" ON products.id = order.id
GROUP BY "product_id"
ORDER BY "quantity" DESC
LIMIT 5;

-- Add new promotion campign
INSERT INTO "promotions"("name", "type", "discount", "valid_start", "valid_end", "quota")
VALUES("Apr_Sale", "SEASON", "20", "1720513045", "1721951999", 99999999);

-- Alter promotion campign
UPDATE "promotions"
SET "quota" = 5555
WHERE "id" = 11;

DELETE FROM "promotions"
WHERE "id" = 1;
