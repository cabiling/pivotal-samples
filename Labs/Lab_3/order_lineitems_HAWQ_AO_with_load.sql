DROP TABLE IF EXISTS retail_demo.order_lineitems_ao;
CREATE TABLE retail_demo.order_lineitems_ao
(
    order_id character varying(21),
    order_item_id bigint,
    product_id integer,
    product_name character varying(2000),
    customer_id integer,
    store_id integer,
    item_shipment_status_code character varying(30),
    order_datetime timestamp without time zone,
    ship_datetime timestamp without time zone,
    item_return_datetime timestamp without time zone,
    item_refund_datetime timestamp without time zone,
    product_category_id integer,
    product_category_name character varying(200),
    payment_method_code character varying(20),
    tax_amount numeric(15,5),
    item_quantity integer,
    item_price numeric(10,2),
    discount_amount numeric(15,5),
    coupon_code character varying(20),
    coupon_amount numeric(15,5),
    ship_address_line1 character varying(200),
    ship_address_line2 character varying(200),
    ship_address_line3 character varying(200),
    ship_address_city character varying(200),
    ship_address_state character varying(200),
    ship_address_postal_code character varying(20),
    ship_address_country character varying(200),
    ship_phone_number character varying(20),
    ship_customer_name character varying(200),
    ship_customer_email_address character varying(200),
    ordering_session_id character varying(30),
    website_url character varying(500)
)
WITH (appendonly=true, compresstype=quicklz) DISTRIBUTED RANDOMLY;

INSERT INTO retail_demo.order_lineitems_ao
SELECT
    order_id::character varying(21),
    order_item_id::bigint,
    product_id::integer,
    product_name::character varying(2000),
    customer_id::integer,
    store_id::integer,
    item_shipment_status_code::character varying(30),
    (CASE WHEN order_datetime = '' THEN NULL ELSE order_datetime END)::timestamp without time zone,
    (CASE WHEN ship_datetime = '' THEN NULL ELSE ship_datetime END)::timestamp without time zone,
    (CASE WHEN item_return_datetime = '' THEN NULL ELSE item_return_datetime END)::timestamp without time zone,
    (CASE WHEN item_refund_datetime = '' THEN NULL ELSE item_refund_datetime END)::timestamp without time zone,
    product_category_id::integer,
    product_category_name::character varying(200),
    payment_method_code::character varying(20),
    tax_amount::numeric(15,5),
    item_quantity::integer,
    item_price::numeric(10,2),
    discount_amount::numeric(15,5),
    coupon_code::character varying(20),
    coupon_amount::numeric(15,5),
    ship_address_line1::character varying(200),
    ship_address_line2::character varying(200),
    ship_address_line3::character varying(200),
    ship_address_city::character varying(200),
    ship_address_state::character varying(200),
    ship_address_postal_code::character varying(20),
    ship_address_country::character varying(200),
    ship_phone_number::character varying(20),
    ship_customer_name::character varying(200),
    ship_customer_email_address::character varying(200),
    ordering_session_id::character varying(30),
    website_url::character varying(500)
FROM retail_demo.order_lineitems;
