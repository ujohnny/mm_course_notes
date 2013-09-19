Лекция 3
========

Подходы к определению спецификаций

-   Операционный

-   Денотационный

-   Аксиоматический

-- soft_dev_avk.jpg



У нас есть система (с прошлой лекции), которой мы придаём смысл: интерпретируем
символы $\phi_{ij}$, придаём смысл "подковке" $\cup$

Считаем все операторы левоассоциативными, оператор точка (конкатенация) имеет
наивысший приоритет.



**Определение**: *денотационная семантика* - наименьшее решение (из всех
возможных) системы (1)

**Определение**: $L_1, \dots, L_n$ - *наименьшее решение* тогда и только тогда,
когда $\forall (L_1', \dots, L_n') \in (1) \; (L_1 \subseteq L_1', \dots, L_n
\subseteq L_n')$

Три основных свойства частичного порядка:

1.  Рефлексивность

2.  Антисимметричность

3.  Транзитивность



**Упражнение**:

>   Показать, что введённый нами порядок определяет частичный порядок



Легко видеть, что из трёх предложенных в прошлой лекции решений наименьшим
является

$L = \{\phi c | \phi \in {a,b}^*\}$ -- Как-то так



Суть денотационного подхода в данном примере состоит в том, что решения,
удовлетворяющие системе (1), являются наименьшими в теоретико-множественном
смысле кортежами языков.



Правые части системы (1) выглядят как $(A \cup X)^*$. Пусть $i$-ое уравнение
выглядит как $<X_1, \dots, X_n>$.

$$
\tau_i : \text{язык}^n \rightarrow \text{язык} \Leftrightarrow \tau_i : (2^{A^*})^n \rightarrow 2^{A^*}
$$

Введём обозначения, чтобы записи не были излишне громоздки

$$
\overline{X} \stackrel{\text{def}}{=} <X_1, \dots, X_n>
$$

$$
\overline{\tau} \stackrel{\text{def}}{=} <\tau_1, \dots, \tau_n>
$$

$$
\overline{X} = \overline{\tau} \overline{X}
$$



$$
\tau(X) = aX \ cup bX \cup c
$$



Рассмотрим работу $\tau$ на пустом множестве

$$
\tau(\emptyset) = \{c\}
$$

$$
\tau(\{c\}) = \{ac, bc, c\}
$$



**Определение**: *неподвижной точкой* одноместного оператора называется такой
аргумент $d$ из области определения $\tau$, что $\tau(d) = d$



**Определение**: *денотационная семантика* - это наименьшая неподвижная точка
системы операторов $\overline{\tau}$, определённых системой (1)



То есть, Наименьшая неподвижная точка оператора и наименьшее решение - одно и то
же.



Ок, а что насчёт конструктивности (операционности)? Надо бы предложить некий
алгоритм, строящий искомый объект.

Определим

$$
(L_1^{(0)}, \dots, L_n^{(0)}) \stackrel{\text{def}}{=} (\emptyset, \dots, \emptyset)
$$

... тут что-то ещё ...



**Определение**: $f$ - функция, отображающая некоторое частично упорядоченное
множество в другое частично упорядоченное. Она будет монотонной, если $\forall
x, x' (x < x' \Rightarrow f(x) < f(x'))$



**Утверждение**: объединение и конкатенация являются монотонными операциями.

**Следствие**: все $\tau_i$ - монотонны



1.  $L_1^{(0)} \subseteq L_1^{(0)} \; \dots \; L_n^{(0)} \subseteq L_1^{(1)}$

2.  $L_1^{(k-1)} \subseteq L_1^{(k)} \; \dots \; L_1^{(k-1)} \subseteq L_n^{(k)}
    \forall k > 0$



Получаем более операционную семантику

$$
L_i' := L_i^{(0)} \cup \dots \cup L_k^{(n)} \cup \dots
$$



**Утверждение**: $(L_1', \dots, L_n') = (L_1, \dots, L_n)$

**Замечание**: метод последовательных приближений $(L_1^{(j)}, \dots, L_n^{(j)})
$есть $(L_1', \dots, L_n')$