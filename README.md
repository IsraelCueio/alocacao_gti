# README
Este é um sistema para organizar e gerenciar a alocação de membros em projetos dentro da empresa GTi Engenharia Jr. A GTi Engenharia Jr. é uma empresa júnior ligada aos cursos de Engenharia de Computação e Engenharia de Telecomunicações na Universidade Federal do Ceará (UFC).

## Lógica de Alocação
O sistema realiza um cálculo de disponibilidade, levando em conta os cargos e projetos em que a pessoa já se encontra. Dessa forma, pela pontuação obtida (via o **cálculo de disponibilidade** que será explicado neste tópico) para cada membro, obtemos um ranking de disponibilidade. Deste modo, é perceptível as pessoas que estão mais ociosas em relação a execução de projetos, nesse caso, os membros que estão com menor pontuação. Assim é evitado problemas de sobrecarga em determinados membros e garante uma melhor distribuição da execução dos projetos (ajudando na meta de membros que executam).

O cálculo de disponibilidade utiliza o peso do cargo e o peso do projeto.

### Peso do Cargo
Cada cargo na empresa possui um peso. O **peso do cargo** está diretamente ligado com a carga de trabalho na área de gestão na empresa. Por exemplo, um gerente comercial possui uma rotina mais "puxada" na área de gestão, sendo um pouco complicado de lidar isso com um projeto de forma simultânea, comparado ao do cargo de desenvolvedor, que é uma pessoa dedicada a execução de projetos. Vale lembrar que um alto valor de peso de cargo não implica que aquele cargo nunca irá lidar com um projeto. Na verdade, o ideal é que a pessoa desse tipo de cargo lide, no minimo, com 1 projeto no ano. Ela pode até pegar 2 projetos no ano inteiro, por exemplo, mas estes projetos não podem ocorrer de forma simultanea (ao mesmo tempo). O peso do cargo auxilia a controlar isso e evitar que a pessoa com esse cargo lide com mais de um projeto simultâneamente as atividades de gestão da empresa. Ao mesmo tempo que auxilia no aumento de probabilidade de mais projetos serem alocados aos desenvolvedores ou outros cargos com baixa pontuação de gestão, que possuem maior disponibilidade para isso.  

O **peso de cargo total** do membro é a soma de todos os pesos dos cargos em que a pessoa se encontra presente.

### Peso do Projeto
Quando um projeto é adicionado e alocado para algum membro, existe uma pontuação relacionada ao projeto que denominamos de **peso do projeto**. Este peso está relacionado com o tipo de projeto, complexidade do mesmo e a fase que este se encontra. Esse peso do projeto é adicionado no cálculo de alocação para justamente levar em conta os projetos em que o membro já se encontra alocado. Por exemplo, um desenvolvedor que já possui um projeto de sistema com uma alta complexidade dificilmente deve pegar um novo sistema com uma alta complexidade. Seria uma situação muito complicada, podendo agravar a qualidade de ambos os projetos, bem como a saúde do desenvolvedor envolvido. Dessa forma, o peso de projeto incrementa uma pontuação, indicando a pouca disponibilidade do membro relacionada pela carga já reservada para a execução dos projetos já presentes. 

O peso de um projeto, individualmente falando, é calculado da seguinte forma:
fator do tipo do projeto * fator de complexidade * fator do estado do projeto

**Fator do Tipo do Projeto**
* Site: 1
* Woocommerce: 2
* Assessoria: 2
* Sistema:4

**Fator de Complexidade**
* Simples: 1
* Intermediário: 2
* Complexo: 3

**Fator de estado do projeto**
Esse fator varia entre 0 e 1.
* Parado: 0.2
* Inicio: 1
* Middle: 1
* Finalizando: 1
* Suporte: 0.5

O **peso total de projetos** é a soma do peso de todos os projetos em que a pessoa está alocada.

### Cálculo de Disponibilidade
A pontuação do membro é calculada por meio da soma do peso total de projetos com o peso total de cargos do membro específico.

O valor das disponibilidades dos membros pode ser visualizado na aba de membros. Os membros com menor pontos possuem maior probabilidade de serem alocados nos próximos projetos. 