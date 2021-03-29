% nome, linguagem, nivel, salario, regime, idade, cidade
candidato(gabriel, java, junior, 2000, clt, 19, sp).
candidato(guilherme, python, junior, 2000, clt, 55, rj).
candidato(eduardo, python, junior, 3000, pj, 19, ctb).
candidato(davi, cplus, pleno, 4000, clt, 25, sp).
candidato(brenno, java, senior, 4000, clt, 22, sp).
candidato(caio, cplus, pleno, 3500, clt, 30, sp).
candidato(piva, java, senior, 7000, clt, 47, sp).

linguagem(java).
linguagem(python).
linguagem(cplus).

%1. Quantos e quais candidatos estão aptos a participar do processo seletivo?
%2. Quais as principais regiões de moradia dos candidatos?
%3. Quantos e quais candidatos estão na mesma região da empresa recrutadora?
%4. A faixa de salário oferecida é compatível com as pretendidas?
%5. Qual a faixa etária dos candidatos? Estão próximos da aposentadoria?
%6. O regime de contratação é compatível com o regime de contratação pretendido pelos candidatos?
%7. Quais os melhores candidatos para determinada vaga? Justifique.

help() :- writeln("Menu de Ajuda"),
    	  writeln("utilize candidato(NOME, _, _, _) "),
    	  writeln("Para saber a capacitação, utilize"),
    	  writeln("Regra 2"),
    	  writeln("y").


sistema() :- writeln("Bem vindo ao sistema de recrutamento"),
    		 writeln("Vaga: Programador"),
    		 writeln("Candidatos:"),
    		 writeln("NOME:Guilherme, L: python, exp: junior, 2000, clt"),
			 writeln("NOME: Eduardo, L: python, exp: junior, $: 3000, CT: pj"),
			 writeln("NOME:Davi, L: cplus, exp: pleno, $: 4000,CT: clt"),
			 writeln("NOME:Brenno, L: java, exp: senior, $: 4000,CT: clt"),
			 writeln("NOME:Caio, L: cplus, exp: pleno, $: 3500,CT: clt"),
			 writeln("NOME:Piva, L: java, exp: senior, $: 7000,CT: clt").

ajuda() :-  writeln("1-Para saber quais estão capacitados para vaga, utilize capacitado(X,'linguagem',Z,K,L)"),
			writeln("ou capacitado(X,Y,Z,'exp',L)"),
			writeln(""),
			writeln("2- Para saber onde ele reside, utilize listacidades(C)"),
			writeln(""),
    		writeln("3- Para saber quais residem perto da empresa, utilize proximidade('cidade', Y)"),
			writeln(""),
    		writeln("4- Para consultar se o salário é equivalente, utilize faixasalario(B)"),
			writeln(""),			
   		 	writeln("5- Para consultar a idade do candidato e se ele já está perto da aposentadoria, utilize idade(A)"),
			writeln(""),		
    		writeln("6- Para consultar qual o tipo de regime, utilize ct(X, Y, Z, K,'tipo de regime')").

idades(A) :- candidato(NOME , _, _, _, _, IDADE, _), format("Nome do candidato: ~s \tIdade: ~d\n", [NOME, IDADE]), fail;true.
faixasalario(B) :- findall(X, candidato(_, _, _, X, _, _, _), R), min_member(MIN, R), max_member(MAX, R),
                   format("A faixa salarial dos candidatos é ~d - ~d", [MIN, MAX]).
cidades(Result) :- findall(X, candidato(_, _, _, _, _, _, X), R), sort(R, Result).
listacidades(C) :- cidades(Result), writeln(Result).

candidatolinguagem(X) :- linguagem(X), candidato(NOME, X, NIVEL, _, _, _, CIDADE), format("Nome do candidato: ~s\nNivel: ~s\nCidade: ~s\n\n", [NOME, NIVEL, CIDADE]), fail;true.