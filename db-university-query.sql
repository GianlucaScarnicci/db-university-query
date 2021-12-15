-- 1 Selezionare tutti gli studenti nati nel 1990
select * 
from students s 
where year(date_of_birth)=1990;
-- 2 Selezionare tutti i corsi che valgono più di 10 crediti
select * 
from courses c 
where cfu >10;
-- 3 Selezionare tutti gli studenti che hanno più di 30 anni
select *
from students s 
where timestampdiff(year,date_of_birth,curdate()) >30;
-- 4 Selezionare tutti i corsi di laurea magistrale
select *
from `degrees` d 
where `level`='magistrale';
-- 5 Da quanti dipartimenti è composta l università?
select  count(id) as totale_dipartimenti
from departments d;
-- 6 Quanti sono gli insegnanti che non hanno un numero di telefono?
select count(id) as insegnanti_senza_telefono
from teachers t 
where phone is null;
-- 7 Contare quanti iscritti ci sono stati in ogni anno
select year(enrolment_date) ,count(id) as iscritti_per_anno
from students s 
group by year(enrolment_date) 
order by year(enrolment_date);
-- 8 Calcolare la media dei voti di ogni appello d esame
select exam_id ,avg(vote) as media_voti
from exam_student es 
group by exam_id ;
-- 9 Contare quanti corsi di laurea ci sono per ogni dipartimento
select department_id ,count(id) as corsi_per_dipartimento
from `degrees` d 
group by department_id ;
-- 10 Selezionare tutti gli studenti iscritti al corso di laurea in economia
select *,`d`.id 
from students s 
inner join `degrees` d 
on s.degree_id =`d`.id 
having d.name='Corso di Laurea in Economia';
-- 11 Selezionare tutti i corsi di laurea magistrale del dipartimento di neuroscienze
select *
from `degrees` d 
inner join departments d2 
on d.department_id =d2.id 
having d.`level` ='magistrale' and d2.name ='Dipartimento di Neuroscienze';
-- 12 Selezionare tutti i corsi in cui insegna Fulvio Amato
select *
from courses c 
inner join course_teacher ct 
on c.id =ct.course_id 
inner join teachers t 
on ct.teacher_id =t.id 
having t.name ='Fulvio' and t.surname ='Amato';
-- 13 Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti
--    e il relativo dipartimento, in ordine alfabetico per cognome e nome
select *
from students s 
inner join `degrees` d
on s.degree_id =d.id 
inner join departments d2 
on d.department_id =d2.id 
order by s.surname ,s.name ;
