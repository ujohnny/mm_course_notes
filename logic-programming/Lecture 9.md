Лекция 9
========

Напишем ещё программ. Больше программ Б-гу программ!



### Палиндром

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pal([]) :- !.
pal([H]) :- !.
pal([H|T]) :- concat(M, [H], T), pal(M).
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



Если goal записан в программе, то ищется первое попавшееся решение. А ещё можно
записать т.н. "goal по приглашению", в таком случае будут выводиться все
возможные решения.



А ещё в прологе существуют т.н. **факт**ы. Например: `concat([], T, T).`

С помощью фактов можно ввести глобальные переменные. Для этого существует раздел
`database` с одними лишь фактами. Для её заполнения существуют следующие
предикаты:

-   `asserta` - добавляет правило в начало

-   `assertz` - добавляет правило в конец

-   `retract` - вычеркивание правила

Теперь можно организовать глобальные переменные. Вот так вот.
