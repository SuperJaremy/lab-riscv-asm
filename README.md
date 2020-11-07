# Лабораторная работа №1 по курсу "Архитектура компьютера"
# Вариант 9
## Выполнил: Сабуров В.А.
## Группа: P3210


### Текст задания
Задание | Передача параметров
--------|--------------------
Определить количество элементов массива, значения которых превышают заданное. (N = 6, M = 5) | По ссылке
### Текст программы
[Код на языке RISC-V Assembly](https://github.com/SuperJaremy/lab-riscv-asm/blob/main/Lab1.S)  
[Код на языке C](https://github.com/SuperJaremy/lab-riscv-asm/blob/main/Lab1.c)  
[Дамп-файл](https://github.com/SuperJaremy/lab-riscv-asm/blob/main/Lab1.dump)  
### Анализ дампа
#### Общее
Компилятор не пользуется временными регистрами. Все переменные хранятся в стеке. Счётчик в циклах for организуется разными способами для func и main. В func через blt, в main - bge. При этом значения констант M и N в коде уменьшены на 1. s0 сохраняется в стек перед изменением.
#### func
Переменных на входе столько же, сколько в C, приходят в том же порядке (a0=n, a1=m, a2=arr\[M]\[N], a3=num, a4=cnt). Сначала занчения сохраняются в стек. Так же регистры a4, a5 используются как счётчики циклов for. Регистры a4 и a5 выполняют несколько функций - используюся как временные (t0-t7). В стеке резервируется больше места, чем используется. 
### main
Значения из scanf попадают в стек. Переменная в printf передаётся через адрес в стеке. Обе функци используют a0=0x30+960 (возможно, это %d). Константы #define вставлены напрямую в код.
### Вывод
Код на языке ассемблера писать сложнее, так как операции очень низкоуровневые - многие привычные операции по типу ветвлений и циклов приходится организовывать самостоятельно, а так же задумываться о количестве и содержании регистров. Мой код проще кода, написанного компилятором (хотя в нём, в отличие от моего кода, есть удобные комментарии). Скорее всего связано это с тем, что он работает на реальной машине, а значит, должен учитывать, что помимо самой программы так же параллельно может выполняться множество других процессов - нельзя изменять некотрые регистры, предварительно не сохранив. 
