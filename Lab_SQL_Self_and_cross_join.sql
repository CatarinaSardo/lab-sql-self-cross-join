-- Get all pairs of actors that worked together.

select distinct a1.actor_id, a1.first_name, a1.last_name, a2.actor_id, a2.first_name, a2.last_name
from actor a1
join film_actor fa1 on a1.actor_id = fa1.actor_id
join film_actor fa2 on fa1.film_id = fa2.film_id and fa1.actor_id <> fa2.actor_id
join actor a2 on a2.actor_id = fa2.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.

select distinct r1.customer_id, r2.customer_id, i.film_id
from rental r1
join rental r2 on r1.inventory_id = r2.inventory_id and r1.customer_id <> r2.customer_id
join inventory i on r1.inventory_id = i.inventory_id
group by r1.customer_id, r2.customer_id, i.film_id
having count(*) > 3;

-- Get all possible pairs of actors and films.

select a.actor_id, a.first_name, a.last_name, f.film_id, f.title
from actor a
cross join film f;