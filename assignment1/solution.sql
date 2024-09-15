-- Ashera Dyussenova
-- BS20 05

CREATE UNIQUE INDEX index1
    ON public.rental USING btree
    (last_update ASC NULLS LAST, rental_id ASC NULLS LAST, customer_id ASC NULLS LAST, staff_id ASC NULLS LAST)
;

ALTER TABLE IF EXISTS public.rental
    CLUSTER ON index1;

CREATE INDEX q
    ON public.customer USING hash
    (customer_id)
;

CREATE INDEX w
    ON public.customer USING hash
    (first_name)
;

CREATE INDEX e
    ON public.rental USING hash
    (customer_id)
;

CREATE INDEX r
    ON public.rental USING hash
    (inventory_id)
;

CREATE INDEX t
    ON public.inventory USING hash
    (inventory_id)
;

CREATE INDEX y
    ON public.inventory USING hash
    (film_id)
;

CREATE INDEX u
    ON public.film USING hash
    (film_id)
;

CREATE INDEX i
    ON public.film USING btree
    (rating ASC NULLS LAST)
;

CREATE INDEX o
    ON public.film_actor USING hash
    (film_id)
;

CREATE INDEX p
    ON public.film_actor USING hash
    (actor_id)
;

CREATE INDEX a
    ON public.actor USING hash
    (actor_id)
;

CREATE INDEX s
    ON public.actor USING hash
    (first_name)
;

CREATE UNIQUE INDEX f
    ON public.rental USING btree
    (customer_id ASC NULLS LAST, inventory_id ASC NULLS LAST)
;

ALTER TABLE IF EXISTS public.rental
    CLUSTER ON f;















