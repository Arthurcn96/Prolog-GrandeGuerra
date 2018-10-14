# Prolog-GrandeGuerra
Código em prolog para contendo parte dos eventos ocorridos na segunda guerra mundial.

## O que é [Prolog](http://www.swi-prolog.org/)?
Prolog (Programação Lógica) é uma linguagem de programação que se enquadra no paradigma de Programação em Lógica Matemática. É uma linguagem de uso geral que é especialmente associada com a inteligência artificial e linguística computacional. Consiste numa linguagem puramente lógica, que pode ser chamada de Prolog puro, e numa linguagem concreta, a qual acrescenta o Prolog puro com componentes extra-lógicos. [Wikipedia](https://pt.wikipedia.org/wiki/Prolog)

## Instalando

### Linux
O prolog pode ser instalado utilizando a partir do repositório do sistema

`sudo apt-get install swi-prolog`

ou então utilizando o [source pelo Github](https://github.com/SWI-Prolog/swipl-devel)

`git clone https://github.com/SWI-Prolog/swipl-devel.git`

`cd swipl-devel`

`./prepare`

### Windows
No Windows deve ser baixado e executado o arquivo no [site](http://www.swi-prolog.org/download/daily/bin/)

## Diagrama 
![Diagrama do mundo](https://github.com/Arthurcn96/Prolog-GrandeGuerra/blob/master/ImagemComp.png)

## Dicionário de Dados

### Predicados:

Predicado                                                         |Função
:---:                                                             |:---:
Indica que 'Pais' faz parte do eixo                               |`eixo(Pais).`
Indica que 'Pais' faz parte alianca                               | `aliado(Pais).`
Indica que 'Alianca' é uma aliança ou nao (eixo\|aliado)          |`alianca(Alianca).`
Indica que 'Historia' é o cenário historio do 'Pais' Pré-Guerra   |`cenario_historico(Historia, Pais).`
Indica o 'Motivo' que causou o ataque do 'Pais'                   |`causou_ataque(Motivo,Pais).`
Indica que a 'Quantidade' de mortes no 'Conflito'                 |`mortes(Quantidade,Conflito).`
Indica que 'Conflito' é um conflito                               |`conflito(Conflito).`
Indica que 'Pais' é o vencedor do 'Conflito'                      |`vencedor(Pais,Conflito).`
Indica que 'Pais' é o perdedor do 'Conflito'                      |`perdedor(Pais,Conflito).`
Indica que 'Conflito' ocorreu na 'Data'                           |`ocorreu(Conflito, Data).`
Indica que 'Conflito' teve a duracao de tanto 'Tempo'             |`duracao(Conflito,Tempo).`
