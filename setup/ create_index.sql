CREATE INDEX idx_orders_user_id     ON orders(user_id);
CREATE INDEX idx_products_aisle     ON products(aisle_id);
CREATE INDEX idx_products_department ON products(dept_id);
CREATE INDEX idx_opp_product_id     ON orders_prior(product_id);
