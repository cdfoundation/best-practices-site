---
title: "Compreendendo o Problema"
linkTitle: "Compreendendo o Problema"
weight: 1
author: Terry Cox
description: >
  Conheça os desafios fundamentais que a Entrega Contínua aborda
---

{{% youtube RC5Ai0buX3Y %}}

<br>
O desenvolvimento de software em escala é uma atividade dentro do contexto mais amplo da Comercialização de Produtos.

> Nosso objetivo não é construir software, mas sim construir um produto que aproveite o software ou aprendizado de máquina para resolver o problema que o produto aborda.

Os problemas da comercialização de produtos direcionam a abordagem que usamos para otimizar a entrega de software. Vamos começar entendendo esses problemas.

É frequentemente assumido que o desenvolvimento de produtos parece assim:

1. Ter uma ideia brilhante para um produto
2. Construir o produto acabado
3. Vender o produto
4. Lucrar!

Na prática, a realidade é que sua ideia na verdade é uma suposição sobre o que poderia representar um produto, mas nessa fase, você não tem evidências para mostrar que alguém deseja comprá-lo.

Você poderia seguir o fluxo acima, mas se você for investir, digamos, $10M no processo de desenvolvimento do seu produto, você está efetivamente apostando esses $10M na chance de que haverá clientes suficientes para recuperar seu investimento e obter lucro.

A melhor prática na comercialização de produtos se parece mais com isso:

1. Ter 1.000 ideias
2. Avaliar e classificar cada ideia quanto ao mérito potencial para encontrar a melhor
3. Pegar essa ideia e encontrar um punhado de clientes que tenham o problema que ela resolve
4. Trabalhar iterativamente com seus clientes para construir uma série de experimentos que testem a utilidade de sua ideia na escala mínima viável
5. Se seus clientes se empolgarem e começarem a oferecer dinheiro pelo produto, investir na escalabilidade para uma implementação completa; caso contrário
6. Parar. Escolher a próxima ideia da sua lista e voltar ao passo 3

Isso garante que você só está investindo pesadamente em atividades que têm evidências sólidas de ajuste de mercado do produto.

O problema é que, mesmo com esse processo, menos de uma em dez ideias de produto terá sucesso no mercado, então é muito importante otimizar esse processo para funcionar o mais enxuto possível, de modo que o custo de executar seus experimentos de aprendizado seja gerenciável dentro das reservas de investimento disponíveis para você.

O que isso significa do ponto de vista do desenvolvimento de software?

Bem, no primeiro modelo, você espera receber um conjunto completo de requisitos de antemão e poderia otimizar cuidadosamente um design levando em consideração tudo o que o produto precisa ser capaz de fazer. Então isso poderia ser decomposto em recursos e dados às equipes para implementar de acordo com as especificações.

No modelo enxuto, tudo o que você tem para começar são suposições sobre qual pode ser o problema do cliente. Nesse caso, o papel da equipe de desenvolvimento na verdade é ajudar a projetar e construir experimentos que validem (ou invalidem) cada suposição, em conjunto com clientes reais.

No primeiro modelo, você espera passar cerca de um ano cometendo erros e aprendendo sobre o domínio do problema em privado, antes de um grande lançamento público de um aplicativo polido.

No modelo enxuto, você precisa aprender na frente do cliente, entregando regularmente novos recursos experimentais em ambientes de produção ao vivo.

Esse aprendizado assume a forma de um ciclo iterativo:

1. Propor uma hipótese sobre qual recurso pode ser de valor para o cliente
2. Projetar e desenvolver um experimento para testar esse recurso no ambiente do cliente
3. Executar o experimento com o cliente e avaliar
4. Ajustar o experimento e reexecutar; ou
5. Passar para o próximo experimento; ou
6. Encerrar o produto

É claro que você pode esperar ter um orçamento finito para investir em experimentos de aprendizado, e seus clientes terão uma atenção finita, então há um limite rígido de quantas vezes você pode iterar por esse ciclo antes de falhar. Como resultado, é crucial otimizar esse ciclo para poder arcar com o máximo de iterações possível para maximizar sua chance de descobrir um conjunto de recursos que demonstre ajuste de mercado do produto.

Isso significa que podemos derivar duas métricas críticas que nos ajudarão a manter o foco na otimização do nosso processo de comercialização de produtos o tempo todo:

## Frequência de Implementação
Sua capacidade de executar o ciclo acima é limitada pela frequência com que você pode implantar seu produto em produção. Se levar seis meses para mover um recurso para produção, você ficará sem dinheiro e clientes muito antes de poder executar mais do que aquele único experimento. Se levar uma semana para implantar, você provavelmente não poderá executar experimentos suficientes para descobrir o produto certo.

Isso implica a necessidade de otimizar todo o processo de entrega para ser capaz de mover recursos para produção em um ritmo de dias a horas.


## Lead Time
Compreender o tempo decorrido desde o momento de identificar uma nova hipótese que se deseja testar até o momento em que um experimento para testá-la é implantado em produção ajuda a definir a granularidade dos experimentos que você pode realizar. Se uma equipe levará três meses para implementar um experimento, deve-se considerar a redução do escopo do experimento ou dividir o problema em componentes menores que possam ser desenvolvidos em paralelo por várias equipes de recursos.

A otimização do processo de entrega para consistentemente reduzir os tempos de liderança aumenta a capacidade de realizar mais iterações experimentais dentro do seu espaço de manobra disponível.

Trabalhar dessa forma iterativa requer uma mudança conceitual fundamental em todas as equipes de entrega. Em vez da suposição de que "o produto deve ser perfeito, eventualmente", é necessário assumir que a falha é esperada regularmente e, como resultado, ser principalmente muito bom em corrigir as coisas rapidamente.

Isso não deve ser interpretado como 'a qualidade é menor'. Realisticamente, a ideia de construir produtos que não quebrem é uma simplificação ingênua. Em vez disso, devemos considerar que as coisas podem quebrar; devemos antecipar as maneiras pelas quais elas podem ser esperadas para quebrar e mitigar o risco associado a falhas.

Uma quebra não antecipada que derruba um produto por uma semana pode acabar com um negócio. Uma interrupção temporária de um recurso de um produto é apenas uma pequena irritação e uma implantação de recurso falhada que é revertida com segurança após a falha nos testes preliminares provavelmente passará despercebida.

Isso nos permite derivar mais duas métricas-chave:

## Tempo para Restaurar
Otimizar o tempo entre identificar um incidente e se recuperar dele mitiga a exposição ao risco durante a falha. Tipicamente, isso nos incentiva a decompor nossos designs em componentes de pequena escala que são facilmente testáveis e têm impacto limitado no caso de falha. Onde são cometidos erros, limitar o alcance do impacto desses erros reduz o risco e o tempo necessário para se recuperar.

## Taxa de Falha de Mudança
Rastrear a porcentagem de mudanças que levam a um incidente em produção nos dá uma métrica proxy para qualidade. Isso deve, por sua vez, levar a uma análise apropriada da causa raiz. Se muitas das mudanças que fazemos em nosso produto estão causando problemas, nós realmente entendemos o problema para o qual nosso produto foi projetado? A equipe de desenvolvimento de produtos entende o produto que está construindo? Nosso processo de entrega é propenso a erros?

Por que esse foco em métricas, no entanto?

Bem, este é outro grande desafio para o desenvolvimento de produtos de tecnologia.
Em disciplinas de engenharia tradicionais, como engenharia civil ou aeroespacial, você está construindo algo físico. Se, todos os dias, seu produto em desenvolvimento se parece mais com uma ponte ou um avião, todos na equipe podem entender que você está indo na direção certa e ter uma ideia do progresso. Se seu avião começa a se parecer mais com um elefante, você pode parar e reavaliar suas atividades para garantir que esteja no caminho certo.

Agora, imagine que você está construindo uma aeronave invisível composta por milhares de componentes invisíveis.

Você não pode ver os componentes sendo construídos, nem o produto sendo montado a partir deles. Você tem uma equipe de centenas de pessoas trabalhando no produto e está confiando inteiramente na fé cega de que todos sabem o que estão fazendo e estão construindo partes compatíveis, porque a primeira vez que você poderá evidenciar isso será no voo inaugural com o cliente...

Certamente, ninguém em sã consciência compraria uma aeronave de uma empresa que tivesse um processo de engenharia assim, certo?

Claro, a realidade é que é exatamente assim que muitas organizações abordam o desenvolvimento de produtos de software e isso explica em grande parte por que 70% dos projetos de software falham e 20% desses falham tão mal a ponto de ameaçar a viabilidade da empresa-mãe.

Um componente fundamental da entrega bem-sucedida de software reside em tornar o progresso visível dentro de um domínio intrinsecamente invisível.

Pequenas equipes tendem a fazer isso naturalmente usando comunicação. Muitas adotam rituais básicos ágeis que envolvem stand-ups diários para comunicar problemas, progressos e obstáculos. Em pequena escala, isso é viável. No entanto, o número de possíveis caminhos de comunicação escala com n<sup>2</sup>-n (onde n é o número de pessoas na equipe). Como resultado, uma vez que você ultrapassa cerca de seis pessoas em uma equipe, elas passam a maior parte do tempo em atividades de comunicação em vez de desenvolver software.

A implicação disso é que, para produtos maiores, é insuficiente seguir nossos instintos naturais ou aplicar técnicas básicas de gerenciamento de projetos de engenharia de outras disciplinas. Precisamos aplicar uma metodologia especificamente projetada para mitigar os riscos associados ao trabalho com ativos intangíveis.

Antes de analisarmos os detalhes de tal metodologia, devemos primeiro considerar o valor de um ativo de software de uma perspectiva comercial, em vez de puramente técnica. O software que criamos pode ser considerado uma ferramenta projetada para resolver um problema específico do mundo real e o valor dessa ferramenta está relacionado ao benefício gerado para o cliente pela resolução de seu problema.

Isso é importante porque é raro que o software tenha valor intrínseco e de longo prazo. O software existe como uma solução transitória para problemas contemporâneos no mundo exterior. Onde uma commodity como o ouro tem um valor flutuante, mas efetivamente perpétuo no mercado, o valor do software depende inteiramente de fatores externos, como a continuidade da existência do problema que um determinado programa foi projetado para resolver e o fato de que esse software ainda representa a melhor solução disponível para esse problema.

Como o software é implicitamente impactado por fatores externos, ele deve ser considerado como um ativo perecível. O problema para o qual seu software é projetado enfrenta mudanças lentas ao longo do tempo. O mercado em que seu software compete muda bastante rapidamente. O hardware físico e o sistema operacional em que seu software opera evoluem continuamente. O ambiente legislativo e de conformidade impacta as mudanças em seu software, assim como os desafios de segurança e proteção de dados associados.

Portanto, é crítico entender que o software se degrada se ficar intocado por qualquer período de tempo.

Se pensarmos no software em uma base centrada em projetos, cometemos o erro de considerá-lo como um processo linear, desde o design até o lançamento, e então tentamos otimizar nosso processo para chegar à 'linha de chegada' mais rapidamente.

Para gerenciar adequadamente os ativos de software, eles devem ser considerados no contexto de um ciclo de gerenciamento de ativos contínuo e iterativo, onde 'lançamento' é meramente uma etapa regular e repetitiva no ciclo de vida do ativo.

Vale a pena reiterar aqui que o valor do software é baseado no que ele realmente pode fazer pelos clientes, não no que acreditamos que pode fazer. Se esse valor pode mudar ao longo do tempo devido a fatores externos e o próprio ativo é efetivamente invisível e, portanto, não pode ser observado diretamente, precisamos de algum mecanismo pelo qual possamos avaliar confiavelmente o valor contínuo do ativo que possuímos.

Este problema é fractal por natureza, já que se repete em vários níveis dentro de nossa aplicação. Um produto de software é tipicamente composto por vários componentes ou recursos, os quais, ao operar em escala, quase sempre são desenvolvidos e mantidos por equipes diferentes. Esses componentes são construídos sobre outros componentes, frequentemente de equipes fora da sua organização, e assim por diante, até o microcódigo nos processadores em que você está executando.

Cada um desses componentes deve ser considerado parcialmente completo. Eles alcançam alguns de seus objetivos de design, mas têm algum nível de dívida técnica associada que não foi quitada porque não é economicamente viável fazê-lo completamente, ou porque você está fazendo algo com ele que os proprietários ainda não tiveram tempo para testar.

Portanto, tudo em seu ativo é construído com base em coisas que estão potencialmente um pouco quebradas ou prestes a quebrar devido a fatores fora de sua consciência.

Não há uma "solução permanente" para este problema que possa ser aplicada uma vez e esquecida. A única abordagem viável é reconstruir repetidamente sua aplicação a partir de todos os seus componentes para garantir que ainda possa ser construída e testar repetidamente o ativo para medir se ainda está atendendo aos fatores que lhe conferem valor no mercado. Na próxima seção, vamos examinar com mais detalhes os métodos de melhores práticas para alcançar isso de forma eficaz e confiável.