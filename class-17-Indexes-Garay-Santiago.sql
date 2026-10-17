select postal_code
from address

##1
select *
from address
where postal_code in ("10428", '1027', '10417');
#Tiempos 0.052 0.055
##con indice 0.011 0.012

select *
from address
where postal_code not in ("10428", '1027', '10417');
##timpos 0.156 0.063
##con indice 0.036 0.076
select *
from address a 
join city c on a.city_id = c.city_id 
join country c2  on c.country_id = c2.country_id
where postal_code in ("10428", '1027', '10417')
##tiempos 0.0011 0.0017 
##con indice 0.007 0.008

CREATE INDEX idx_postal_code
ON address (postal_code);

##al crear el indice las consultas son mas rapidas

##2

select * from actor a 
where a.first_name = "PENELOPE"

select * from actor a 
where a.last_name = "GUINESS"

##la busqueda por el apellido fue mucho mas rapida seguramente deve tener un indice creado q la busqueda por nombre no tiene y tiene q revisar cada una de las filas buscando el numbre por eso tarda mas 

##3

select f.title, f.description from film f 
where f.description like "%Epic Drama%"


alter table film 
add fulltext (description)

select f.title, f.description
from film f 
where match(description) against ('Epic Drama')
 
##la diferencia entre usar el like podemos buscar algo espesifico o q contenga el palabra
## con march against primero q es mas rapido y segundo q esta diseñado para las busquedas por texto por eso nos de vuelve todas las peliculas q contengan ambas palabras o una de ellas ordenado de a quien le dio mayor o menor relevancia
    





