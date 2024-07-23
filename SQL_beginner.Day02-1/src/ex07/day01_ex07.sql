select pizzeria.name
    from pizzeria
join (select person_visits.pizzeria_id, person_visits.person_id
          from person_visits
          where visit_date = '2022-01-08') as pv on pizzeria.id = pv.pizzeria_id
join (select person.id
          from person
          where name = 'Dmitriy') as n on n.id = pv.person_id
