%Declaracao de paises ----------------------------------------------------------
% COMO FAZER APARECER SO UM VALOR ,!.
eixo(alemanha).
eixo(italia).
eixo(japao).
aliado(eua).
aliado(uniao_sovietica).
aliado(reino_unido).
aliado(china).
alianca(eixo).
alianca(aliados).

pais(X) :- eixo(X) ; aliado(X).

inimigo(X,Y) :- ( eixo(X) , aliado(Y) ) ; ( eixo(Y) , aliado(X) ).

qual_alianca :- nl, write('Digite o nome do pais:'),nl,read(Pais),
write(' O(A) '),write(Pais), write(' faz parte do '),
((eixo(Pais),write('eixo.');aliado(Pais),write('aliado.'))),nl,escolha_1.

%Conflitos ---------------------------------------------------------------------

conflito(primeira_guerra).
conflito(segunda_guerra).
conflito(invasao_da_polonia).
conflito(pearl_harbor).
conflito(stalingrado).
conflito(normandia).
conflito(iwo_jima).
conflito(okinawa).

vencedor(Y,primeira_guerra) :- aliado(Y).
vencedor(Y,segunda_guerra) :- aliado(Y).
vencedor(alemanha,invasao_da_polonia).
vencedor(japao,pearl_harbor).
vencedor(uniao_sovietica,stalingrado).
vencedor(Y,normandia) :- aliado(Y).
vencedor(eua,iwo_jima).
vencedor(eua,okinawa).

perdedor(Y,primeira_guerra) :- eixo(Y).
perdedor(Y,segunda_guerra) :- eixo(Y).
perdedor(polonia,invasao_da_polonia).
perdedor(eua,pearl_harbor).
perdedor(Y,stalingrado) :- eixo(Y).
perdedor(alemanha,normandia).
perdedor(japao,iwo_jima).
perdedor(japao,okinawa).

ocorreu(primeira_guerra,'1914').
ocorreu(segunda_guerra,'1939').
ocorreu(invasao_da_polonia,'1939, Set').
ocorreu(pearl_harbor,'1941, 7,Dezembro').
ocorreu(stalingrado,'1942').
ocorreu(normandia,'1944, Jul').
ocorreu(iwo_jima,'1945, Fev').
ocorreu(okinawa,'1945, Abril').

duracao(primeira_guerra,'4 anos').
duracao(segunda_guerra,'6 anos').
duracao(invasao_da_polonia,'1 mes').
duracao(pearl_harbor,'1 dia').
duracao(stalingrado,'7 meses').
duracao(normandia,'2 meses').
duracao(iwo_jima,'1 mes').
duracao(okinawa,'1945, 2 meses').

envolvidos(Pais,Lugar) :- conflito(Lugar) ,
	(vencedor(Pais,Lugar) ; perdedor(Pais,Lugar) ).

qual_envolvido:- nl,write('Qual o conflito?'),nl,
read(Conflito),nl,conflito(Conflito),
envolvidos(Conflito,Pais),write(Pais),write(','), fail.
qual_envolvido:-write('.').

qual_data:-
	nl,write('Qual conflito? '),nl,
	read(Conflito),ocorreu(Conflito,Data),
	write(Data),nl.

qual_vencedor :-
    nl,
    write('Qual o conflito?'),nl,
    read(Batalha), vencedor(Pais,Batalha),
    %write('O pais vencedor da(o)  '), write(Batalha),
    write(Pais), nl,fail.
qual_vencedor :-write('Foi o(s) vencedor(es) do conflito.'),nl.

qual_perdedor :-
    nl,
    write('Qual o conflito?'),nl,
    read(Batalha),(Pais,Batalha),
    %write('O pais perdedor da(o)  '), write(Batalha),
    write(Pais),nl,fail.
qual_perdedor :-write('Foi o(s) perdedor(es) do conflito.'),nl.

%Antecedentes da Guerra--------------------------------------------------------

cenario_historico('Derrota da Alemanha da Primeira Guerra entao ocorre o Tratado de Versales, se tem Quebra da alemanha leva a um Descontentamento da populacao com o governo, a Grande Depressao agrava a situacao e acaba gerando a Ascensao do partido Nazista Ascensao do partido Nazista leva cumina em Hitler tomando o poder e comecando a remilitarizacao da Alemanha para uma guerra.', alemanha).
cenario_historico('Apos a Primeira Guerra, houve uma grande crise no pais. O governo Socialista nao respondia aos anseios da populacao, assim, Mussolini adere o fascismo, e procura apoio na igreja catolica, entao ocorre a Grande Depressao iniciou-se um projeto imperialista pra restaurar o antigo Imperio Romano. Com essas primeiras investidas, o governo de Mussolini deu início às tensões diplomaticas que conduziriam a Europa ao inicio da Segunda Guerra Mundial.', italia).
cenario_historico('O Tratado de Versalhes deu territorios ao Japao, mesmo assim o japao teve uma ampla expansao no continente asiatico. O governo sofria retalhacoes de grupos extremistas, com ataques a representantes e ministros do governo, tanto descontentamento foi gracas aos as guerras para expansao do territorio japones, que eram travados contra a China, e com a declaracao da Segunda Guerra Mundial, onde a China era Aliado, Japao entao se junta ao Eixo.',japao).
cenario_historico('Ouve a Grande Depressao que acabou com a economia nao so dos Estados Unidos mas de todo mundo, porem, anos depois, junto com a declaracao da Segunda Guerra Mundial, o Estados Unidos viu a sua chance de fortalecer a sua economia com trabalhos de assistencia.',eua).
cenario_historico('Em meados de 1920 Stalin entrou ao poder e associou a ideologia estatal ao marxismo, aonde o pais passou por um periodo de rapida industrializacao e coletivizacao, que lancou as bases de apoio para o esforco de guerra. Quando a Segunda Grande Guerra foi declarada, a uniao sovietica assinou um pacto de nao-agressao com a Alemanha',uniao_sovietica).
cenario_historico('O Reino unido fez uma conferencia em resposta a manifesta disposicao de Hitler de promover o rearmamento da Alemanha, ignorando o tratado, pouco depois da conferencia os paises assinaram um pacto.',reino_unido).
cenario_historico('A china estava na Segunda Guerra Sino-Japonesa contra o Japao, que lutava para roubar terrirorio chines. Logo em seguida os aliados declaram guerra ao Japao, e a China se alia aos Aliados.',china).

consequencia(invasao_da_polonia,X,'Com a invasao da polonia Reino Unido declarou Guerra, e a entao formada alianca inicia uma luta contra as forcas do eixo.') :- mortes(X,invasao_da_polonia ).
consequencia(pearl_harbor,X,'Com esse ataque a Pearl Harbor os Estados Unidos finalmente entrou na Guerra, e envia tropas e mais tropas para a europa.'):- mortes(X,pearl_harbor).
consequencia(stalingrado,X,'O ataque foi um fracasso, calculamos mal a forca da Uniao Sovietica, elas sabiam dos nossos planos desde o inico, ja estavam preparados!! Existe espioes em todos os lugares!!'):- mortes(X,stalingrado).

causou_ataque('Com a remilitarizacao, a alemanha esta mais que pronta para iniciar seu plano de limpeza etinica e de dominacao.',invasao_da_polonia).
causou_ataque('Mesmo com os avisos os Estados Unidos continuam fornecendo armas e suprimentos ao aliados, eles precisam ser detidos...', pearl_harbor).
causou_ataque('Nos nossos planos expansionistas, faz falta os campos produtores de cereais e de petróleo, a Russia os tem em abundancia!!',stalingrado).

%Baixas----------------------------------------------------------------

mortes('19 Milhoes de mortos' , primeira_guerra).
mortes('73 Milhoes de mortos' , segunda_guerra).
mortes('71 mil de mortos' , invasao_da_polonia).
mortes('2.5 mil de mortos', pearl_harbor).
mortes('1,9 milhoes de mortos.', stalingrado).
mortes('300 mil de mortos' , normandia).
mortes('36 mil de mortos' ,  iwo_jima).
mortes('110 mil de mortos' , okinawa).

%Declaracao inicio do "programa"-------------------
inicia_pais(alemanha,'Voce entao encorpora o Lider do partido Nazista, o Hitler.').

passado_alemanha:-nl,
	%write('A alemanha passou por mals Bucados, comecando com:'),nl,
	cenario_historico(X,alemanha),write(X),nl, escolha_1.

% #############################################INICIO DO PROGRAMA E TODAS AS ESCOLHAS POSSIVEIS DE SEREM FEITAS#######################################

inicio:-
	nl,	pais(alemanha),inicia_pais(alemanha,Inicio),write(Inicio),nl,
	write('Um clima de tensao paira sobre a Europa, apos  a remilitarizacao da Alemanha os paises aguarda sua proxima jogada.'),
	write('Toda Europa esta a beira de um conflito, qual seu primeiro movimento?.'),nl,	escolha_0.

escolha_0:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Ver os planos. '), nl,
	tab(4),write('b) Ver passado de algum Pais '), nl,
	tab(4),write('c) Ver aliancas dos Paises.'), nl,
	read(Resposta), resp_0(Resposta).
	resp_0(a):- nl,causou_ataque(X,invasao_da_polonia),write(X),nl,escolha_1.
	resp_0(b):- nl,escolha_passado.
	resp_0(c):- nl,qual_alianca.

escolha_1:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Invadir a polonia.'), nl,
	tab(4),write('b) Ver aliancas dos Paises.'), nl,
	tab(4),write('c) Ver passado de algum Pais '), nl,
	read(Resposta), resp_1(Resposta).
	resp_1(a):- nl,invadir_polonia.
	resp_1(b):- nl,qual_alianca.
	resp_1(c):- nl,escolha_passado.

		escolha_passado:-
			nl,write('Qual Pais?'),nl,
			read(Pais), pais_escolhindo(Pais),nl.
			pais_escolhindo(Pais):- cenario_historico(Passado,Pais),write(Passado),nl,escolha_1.

		invadir_polonia:-
			nl, write('Voce entao comeca a invasao da Polonia.'),nl,
			write('A invasao ocoreu '),ocorreu(invasao_da_polonia,Data),write(Data),nl,
			write('durou um total de '),duracao(invasao_da_polonia,Tempo),write(Tempo),nl,
			write('O vencedor foi a '),vencedor(Pais1,invasao_da_polonia),write(Pais1),
			write(' o perdedor foi a '),perdedor(Pais2,invasao_da_polonia),write(Pais2),nl,escolha_2.

escolha_2:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Ver consequencia do ataque da invasao a polonia.'), nl,
	tab(4),write('b) Ver problemas do exercito.'), nl,
	read(Resposta), resp_2(Resposta).

	resp_2(a):- nl,consequencia_polonia.
	resp_2(b):- nl,causou_ataque(X,pearl_harbor),write(X),nl,escolha_3.

	escolha_3:-
		nl,write('Qual sera a sua jogada?'),nl,
		tab(4),write('a) Ordenar que o Japao ataque Pearl Hearbor.'), nl,
		tab(4),write('b) Ver consequencia do ataque da invasao a polonia.'), nl,
		tab(4),write('c) Ver problemas.'), nl,
		read(Resposta), resp_3(Resposta).

		resp_3(a):- nl,atacar_pearl_harbor.
		resp_3(b):- nl,consequencia_polonia.
		resp_3(c):- nl,causou_ataque(X,pearl_harbor),write(X),nl,escolha_3.


		consequencia_polonia:-
			nl, consequencia(invasao_da_polonia,X,Y),nl,
			write(X),write('. '),write(Y),nl,
			write('Os alemaes continuam a marchar impiedosamente em direcao aos paises vizinhos...'),nl,escolha_2.

		atacar_pearl_harbor:-
			nl, write('O Japao inicia o ataque as 7h da manha em Pearl Harbor.'),nl,
			write('A invasao ocoreu '),ocorreu(pearl_harbor,Data),write(Data),nl,
			write('Durou apenas '),duracao(pearl_harbor,Tempo),write(Tempo),nl,
			write('O vencedor foi a '),vencedor(Pais1,pearl_harbor),write(Pais1),
			write(' o perdedor foi a '),perdedor(Pais2,pearl_harbor),write(Pais2),nl,escolha_4.

escolha_4:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Ver consequencia do ataque de Pearl Harbor.'), nl,
	tab(4),write('b) Ver problemas.'), nl,
	read(Resposta), resp_4(Resposta).

	resp_4(a):- nl,consequencia_pearl_harbor.
	resp_4(b):- nl,causou_ataque(X,stalingrado),write(X),nl,escolha_5.

escolha_5:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Quebrar o pacto com a Uniao Sovietica e ataca-la.'), nl,
	tab(4),write('b) Ver consequencia do ataque de Pearl Harbor.'), nl,
	tab(4),write('c) Ver problemas.'), nl,
	read(Resposta), resp_5(Resposta).

	resp_5(a):- nl,atacar_uniao_sovietica.
	resp_5(b):- nl,consequencia_pearl_harbor.
	resp_5(c):- nl,causou_ataque(X,stalingrado),write(X),nl,escolha_5.

		consequencia_pearl_harbor:-
			nl,consequencia(pearl_harbor,X,Y),nl,
			write(X),write(', '),write(Y),nl,
			write('Nao sei se podemos chamar isso de vitoria para os Japoneses, mas com certeza foi uma derrota pros Estados Unidos.'),nl,escolha_4.

		atacar_uniao_sovietica:-
			nl, write('Seu exercito marcha em direcao a Uniao Sovietica.'),nl,
			write('A invasao ocoreu '),ocorreu(stalingrado,Data),write(Data),nl,
			write('Durou '),duracao(stalingrado,Tempo),write(Tempo),nl,
			write('O vencedor foi a '),vencedor(Pais1,stalingrado),write(Pais1),
			write(' o perdedor foi a '),perdedor(Pais2,stalingrado),write(Pais2),nl,escolha_6.

escolha_6:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Ver consequencia do ataque em Stalingrado.'), nl,
	tab(4),write('b) Ver problemas.'), nl,
	read(Resposta), resp_6(Resposta).

	resp_6(a):- nl,consequencia_stalingrado.
	resp_6(b):- nl,causou_ataque(X,stalingrado),write(X),nl,escolha_7.

escolha_7:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) ATUALIZACAO DAS INFORMACOES!!'),nl,
	read(Resposta),resp_7(Resposta).

	resp_7(a):- nl,atualizacao_normandia.
		atualizacao_normandia:-
			nl,write('NORMANDIA FOI ATACADA!!! Parece que chamam a operacao de OverLord, alguns a chamam de "Dia D", encaminhando as informacoes:'),nl,
			write('A invasao ocoreu '),ocorreu(normandia,Data),write(Data),nl,
			write('Durou '),duracao(normandia,Tempo),write(Tempo),nl,
			write('O vencedor foram os aliados!! Com um ataque surpresa!!'),escolha_8.

escolha_8:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Rever Mensagem'), nl,
	tab(4),write('b) Ver problemas.'), nl,
	read(Resposta), resp_8(Resposta).

	resp_8(a):- nl,atualizacao_normandia.
	resp_8(b):- nl,escolha_9.

escolha_9:-
	nl,write('OUTRO ATAQUE!!!'),nl,
	tab(4),write('a) ATUALIZACAO DAS INFORMACOES!!'),nl,
	read(Resposta),resp_9(Resposta).

	resp_9(a):- nl,atualizacao_iwojima.
		atualizacao_iwojima:-
			nl,write('IWOJIMA FOI ATACADA!!! Parece que nao havia civis na area, espioes dizem queb. EUA pretende usar como base aerea, encaminhando as informacoes:'),nl,
			write('A invasao ocoreu '),ocorreu(iwo_jima,Data),write(Data),nl,
			write('Durou '),duracao(iwo_jima,Tempo),write(Tempo),nl,
			write('O vencedor foram os aliados!! Com um ataque surpresa!!'),escolha_10.

escolha_10:-
	nl,write('Qual sera a sua jogada?'),nl,
	tab(4),write('a) Rever Mensagem'), nl,
	tab(4),write('b) Ver problemas.'), nl,
	read(Resposta), resp_10(Resposta).

	resp_10(a):- nl,atualizacao_iwojima.
	resp_10(b):- nl,escolha_11.

escolha_11:-
	nl,write('OUTRO ATAQUE!!!'),nl,
	tab(4),write('a) ATUALIZACAO DAS INFORMACOES!!'),nl,
	read(Resposta),resp_11(Resposta).

	resp_11(a):- nl,atualizacao_okinawa.
		atualizacao_okinawa:-
			nl,write('OKINAWA FOI ATACADA!! E ESTAMOS SOBRE ATAQUE!!!. Com os aliados a nossa porta posso apenas mandar essas ultimas informacoes e queimar o resto.'),nl,
			write('Os japoneses lutaram ferozmente, nao somos mais capazes de deter os aliados.'),nl,
			write('Agora sem suprimentos e perdendo territorios nesse ritmo... Perdemos a guerra, mas foi uma honra capitao. Encaminhando as informacoes...'),nl,
			write('A invasao ocoreu '),ocorreu(okinawa,Data),write(Data),nl,
			write('Durou '),duracao(okinawa,Tempo),write(Tempo),nl,
			write('O vencedor foram os aliados!!'),nl,
			write('PS: Informacoes sugerem que os EUA temem os japoneses, e pretendem bombardealos.REPASSAR ESSA INFORMACAO URGENTEMENTE!!!'),nl,
			write('Sinal Perdido...').
