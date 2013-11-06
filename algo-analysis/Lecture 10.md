Лекция 10
=========



На прошлой паре у нас была функция C(x), которую надо бы уметь раскладывать в
ряд. Ну давайте это и сделаем!



$$
C(x) = \frac{1 - \sqrt{1 - 4x}}{2x}
$$

$$
\frac{d^n(1 - 4x)^{\frac{1}{2}}}{d x} = \frac{1}{2} \cdot (\frac{1}{2} - 1) (\frac{1}{2} - 2) \dots  (\frac{1}{2} - n+1) (1-4x)^{\frac{1}{2} - n} (-4)^n = -2^n \cdot 1 \cdot 3 \dots (2n-3) \cdot (1-4x)^{\frac{1}{2}-n}
$$

$$
\sqrt{1-4x} = 1 - \sum_{n=1}^\infty \frac{2^n (2n-3)!!}{n!} x^n = 1 - \sum_{n=1}^\infty \frac{2^n (2n-2)!}{n! (2n-2)!!} x^n = 1 - 2 \sum_{n=1}^\infty \frac{(2n-2)!}{n! (n-1)!} x^n = 1 - \sum_{n=1}^\infty \frac{1}{n} C_{2n-2}^{n-1} x^n
$$

$$
C(x) = \frac{1- \sqrt{1-4x}}{2x} = \sum_{n=1}^\infty \frac{1}{n} C_{2n-2}^{n-1} x^{n-1} = \sum_{n=1}^\infty \frac{1}{n+1} C_{2n}^{n} x^{n}
$$

Т.е. $C_n = \frac{1}{n+1} C_{2n}^{n}$



Известна такая **теорема** (Кэли, 1896): Число помеченных деревьев $T_n =
n^{n-2}$

Но мы рассмотрим доказательство Прюфера, для чего нам понадобится **код
Прюфера**:

-   Ищем висячую вершину, удаляем её

-   Записываем номер её родителя.

-   Продолжаем, пока дерево не закончится.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
program pruf;
const n = ...;
type v = ^t;
     t = record
           i : 1..n;
           r : v
         end;
     Pru = array[0..n-2];

var k, j, i, a: integer;
    sp: array[1..n] of v;
    x, y : v;

Procedure inpruf(var Pr: Pru);
begin
    for j := 1 to n-2 do begin
        k := 1;
        while (sp[k] = nil) or (sp[k]^.r = nil) do k := k+1;
        a := sp[k]^.i;
        pr[j] := a;
        sp[k] := nil;
        x := sp[a];
        while x^.i <> k do begin
            y := x;
            x := x^.r;
        end;
        if sp[a] = x then sp[a] := x^.r;
                     else y^.r := x^.r;
    end
end.

Procedure outpruf;
    Procedure bk(var a, b: integer);
    begin
        new(x);
        new(y);
        x^.i := a; x^.r := sp[b]; sp[b] := x;
        y^.i := b; y^.r := sp[a]; sp[a] := y;
    end { bk };
    begin { outpruf }
        for i := 1 to n do sp[i] := nil;
        pr[0] := n;
        a := pr[n-2];
        if a = n then i := n-1; else i := n;
        bk(a, i);

        for j := n-2 downto 1 do
            if sp[p2[j-1]] = nil then
                bk(pr[j-1], pr[j])
            else begin
                while sp[i] <> nil do i := i-1;
                bk(i, pr[j]);
            end
    end
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
