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

### Pais
Eixo      |Aliado
:---:     |:---:
alemanha  |eua
italia    |uniao_sovietica
japao     |reino_unido
   \-      |china

### Conflitos

Pais            |Conflito
:---:           |:---:
aliado          |primeira_guerra
alemanha        |invasao_da_polonia
japao           |pearl_harbor
uniao_sovietica |stalingrado
aliado          |normandia
eua             |iwo_jima
eua             |okinawa
aliado          |segunda_guerra

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

![exemplo1](https://github.com/Arthurcn96/Prolog-GrandeGuerra/blob/master/img/eixo_aliado.gif)
![exemplo2](https://github.com/Arthurcn96/Prolog-GrandeGuerra/blob/master/img/eixo_Aliado.gif)

### Regras:

Regra                                                                                              |Descrição
:----:                                                                                             |:----
pais(Pais):- eixo(Pais);aliado(Pais)                                                               |Para todo 'Pais', ele é um pais se faz parte da aliança ou eixo
inimigo(Pais1 , Pais2):- (eixo(Pais1),aliado(Pais2);(eixo(Pais1),(eixo(Pais2)))                    |Para todo 'Pais1' ele é inimigo de 'Pais2' se 'Pais1' e alianca e 'Pais2' eixo, ou vice-versa
envolvido(Pais,Conflito) :-conflito(Conflito),(vencedor(Conflito,Pais);perdedor(Conflito,Pais))    |Para todo 'Pais' ele está envolvido em 'Conflito' se 'Conflito' for um conflito e se'Pais' for um vencedor ou perdedor do conflito.
consequencia(Pais,Mortos,Fato) :- mortes(Mortos,Batalha)                                           |Para todo 'Pais', e ele tem numero de 'Mortos' e as consequencia ‘Fatos', se os ‘Mortos’ fore, de uma ‘Batalha’.

### Regras do CLI

Regra                      |Descrição
:---:                      |:---:
qual_envolvido :-          |Dado um conflito passado no Input, mostra o pais envolvido.
qual_data :-               |Dado um conflito passado no Input, mostra a data que ocorre o conflito.
qual_vencedor :-           |Dado um conflito passado no Input, mosta o vencedor do conflito.
qual_perdedor :-           |Dado um conflito passado no Input, mostra o perdedor do conflito.
qual_alianca :-            |Dado um pais passado pelo Input, mostra qual alianca ele pertence.

### Regras para o CLI

Regra                      |Descrição
:---:                      |:---:
inicia_pais(Pais,Texto).   |Predicado que decide qual o país o usuário encorpora.
passado_"NomeDoPais"       |Imprime em tela o cenario_historico dos paises em questao.

## Utilização
O código foi criado para ser usado como um contador de história, da segunda guerra, aonde você encorpora um país do eixo ou da aliança.Para carregar o jogo no prolog, deve-se digitar no terminal

``prolog meuPrograma.pl``

A partir daqui, qualquer regra pode ser usada, lembrando que qualquer comando deve terminada com um "." e o comando para sair do prolog é `halt.`

### Inicio
 O início do jogo é ativado a partir da regra:


``inicio.``

![exemplo inicio](https://github.com/Arthurcn96/Prolog-GrandeGuerra/blob/master/img/inicio.gif)

### Regras para utilização
      
Regra                               |Descrição
:---:                               |:---:
escolha_N                           |É a interface numero (N), referente as escolhas que você faz no momento.
escolha_passado:-                   |Dado o Input, retorna o cenario historico antes da Segunda Grande Guerra.
consequencia_’Pais’                 |Uma regra de um consequencia de um determinado conflito, apenas chama e imprime a consequencia do ‘Pais’ referente (ex: consequencia_polonia, consequencia_pearl_harbor)
atacar_’Pais’ ou invadir_polonia    |Apesar de fazerem basicamente a mesma coisa, que é imprimir os predicados de ‘ocorreu’ ,’duracao’, ’vencedor’ ,’perdedor’ referente ao ‘Pais’, recebem nomes diferentes simplismente para melhor entendimento.
atualizacao_’Pais’                  |Usa dos mesmo predicados que “atacar_’Pais’” com exceção de ‘vencedor’ e ‘perdedor’.
