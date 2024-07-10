-- Represent the customer
CREATE TABLE "customers" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the promotion campigns in the company
CREATE TABLE "promotions" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "discount" NUMERIC NOT NULL,
    "valid_start" TEXT NOT NULL,
    "valid_end" TEXT NOT NULL,
    "quota" INTEGER NOT NULL,
    "used" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY("id")
);

-- Represnet the categroies of product
CREATE TABLE "categories" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    PRIMARY KEY("id")
);

-- Represent the products information and price details
CREATE TABLE "products" (
    "id" INTEGER,
    "category_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "cost" NUMERIC NOT NULL,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("category_id") REFERENCES "categories"("id")
);

-- Represent the item in a order and its corresponding value, promotion applied
CREATE TABLE "order" (
    "id" INTEGER,
    "customer_id" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "item_promo" INTEGER,
    "total_promo" INTEGER,
    "created" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
    FOREIGN KEY("product_id") REFERENCES "products"("id"),
    FOREIGN KEY("item_promo") REFERENCES "promotions"("id"),
    FOREIGN KEY("total_promo") REFERENCES "promotions"("id")
);

-- Create indexes to speed up common searches
CREATE INDEX "by_customer" ON "customers"("id"); -- Speed up search by customer
CREATE INDEX "by_product" ON "products"("id", "name"); --Speed up sales search
CREATE INDEX "by_promo" ON "promotions"("id", "name", "valid_start", "valid_end", "quota", "used") -- Speed up promotion search
