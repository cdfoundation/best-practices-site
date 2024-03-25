---
title: "Ir mais devagar para ir mais rápido."
linkTitle: "Ir mais devagar para ir mais rápido."
weight: 20
author: Terry Cox
description: >-
     Compreendendo o que faz a maior diferença ao otimizar para o sucesso
---

Para uma única pessoa, trabalhando isoladamente em um único problema, o caminho mais rápido é uma linha reta de A a B.

A abordagem clássica para tentar acelerar uma equipe é fazer melhorias lineares nas atividades de cada membro da equipe, cortando caminhos até que eles estejam fazendo a atividade mínima possível para chegar ao resultado desejado. Levado ao extremo, isso frequentemente resulta na negligência de requisitos não funcionais essenciais, como segurança, privacidade ou resiliência. Isso é, no entanto, um anti-padrão por razões mais sutis e perniciosas - laços internos e escalares exponenciais...

Ao tentar completar uma tarefa com pressa, tendemos a usar uma abordagem manual e de força bruta para realizar as tarefas. Precisa configurar um ambiente? "Oh, eu vou apenas pesquisar e copiar e colar alguns comandos." Precisa testar algo? "Posso verificar isso exercitando a UI."

Todas essas tarefas levam tempo para serem realizadas com precisão, mas em nossas mentes, orçamos elas como bloqueadores únicos para o progresso que precisamos superar. Infelizmente, em nossas mentes, também estamos assumindo uma linha reta, um caminho feliz para uma solução funcional. Na prática, estamos sempre iterando em direção a um resultado e acabamos tendo que repetir essas tarefas mais vezes do que orçamos.

Nessas circunstâncias, percebemos que estamos atrasando e começamos a ficar descuidados ao repetir as tarefas chatas e manuais que não tínhamos orçado mentalmente. Isso tem o efeito de introduzir uma nova classe de erros, que também não tínhamos considerado em nossas expectativas, nos desviando ainda mais do caminho.

Se essas tarefas manuais caem dentro de um laço interno de nosso processo de construção e lançamento iterativo, elas são capazes de adicionar sobrecarga e risco consideráveis ao processo. Identificar essas tarefas desde o início e orçar para automatá-las no primeiro dia compensa o investimento assim que as coisas saem do território não antecipado.

Os benefícios disso são fáceis o suficiente para os indivíduos visualizarem. O próximo problema, no entanto, é mais sutil e mais impactante.

Como discutimos anteriormente, trabalhar com artefatos 'invisíveis' como sistemas de software significa que as equipes têm que gerenciar o problema de comunicar o que é necessário, o que está sendo feito e que dívida técnica permanece. Em uma equipe de 'n' pessoas, o número de caminhos de comunicação possíveis aumenta com n<sup>2</sup>-n e esse fator de escala exponencial pode rapidamente anular toda a produtividade.

Da mesma forma, se cada pessoa da equipe adotar uma abordagem única para resolver um determinado problema, a quantidade de esforço necessária para a equipe entender como algo funciona e como modificá-lo também aumentará com n<sup>2</sup>.

À medida que seu produto cresce, o número de clientes e o volume de transações também aumentam exponencialmente.

Como resultado, comportamentos que funcionaram bem em equipes pequenas com problemas pequenos de repente e inesperadamente se tornam completamente ingovernáveis com aumentos bastante pequenos na escala.

Para operar com sucesso em escala, é fundamental mitigar o impacto da complexidade sempre que possível. Implementar processos consistentes e repetíveis que se apliquem em todos os lugares é um caminho para ter um conjunto restrito de atividades complexas que devem ser aprendidas por todos, mas que se aplicam a todas as atividades futuras. Isso adiciona uma sobrecarga linear incremental a cada atividade, mas reduz o risco de complexidade de escala exponencial.

A implicação disso é que há a necessidade de adotar um ciclo de lançamento unificado para todos os ativos. Ajuda a pensar no seu processo de lançamento como uma máquina que assa versões do seu produto. Todo ativo que compõe seu produto é ou um material bruto que é uma entrada para a máquina, ou é algo que é cozido pela máquina como um produto intermediário. O processo de assar tem uma série de etapas que são aplicadas aos ingredientes para criar um produto final perfeito, juntamente com estágios de controle de qualidade que rejeitam lotes estragados.

Se você tiver ingredientes que não se encaixam na máquina, ou etapas de processo necessárias que a máquina não conhece, não poderá esperar criar um produto final consistente e de alta qualidade.

Vale ressaltar este ponto. Se sua intenção é construir um produto que seja um sistema de software que produza algum valor para os clientes, você deve ter a expectativa de que também precisará possuir um segundo sistema, que é a máquina que monta seu produto. Esses sistemas estão relacionados, mas são ortogonais. Ambos têm um custo de propriedade e exigirão manutenção contínua, suporte e melhoria. A lucratividade do seu produto está relacionada à eficácia da máquina que o monta, assim como sua capacidade de evoluir futuros produtos para identificar o ajuste do mercado de produtos.

Então, quais são os principais recursos de uma máquina que fabrica seu produto?

Vamos começar olhando para os ingredientes que você está colocando na máquina. Estes geralmente serão compostos pelo código fonte que suas equipes de desenvolvimento criaram, dependências de terceiros que elas selecionaram e conjuntos de dados que o negócio agregou. Estas são operações centradas em pessoas que carregam consigo um risco aumentado de erro humano e um conjunto de suposições associadas que podem ou não se alinhar aos resultados necessários para o seu produto final.

Qualquer componente neste nível terá sido criado por um indivíduo ou pequena equipe e deve-se assumir que este trabalho foi realizado com um entendimento mínimo de como o componente interagirá com o restante do seu produto.

Isso apresenta algumas questões-chave que seu sistema de construção deve ser capaz de validar:

* O componente pode ser compilado em seu ambiente oficial?

* Ele se comporta como o desenvolvedor esperava?

* Ele se comporta como outros desenvolvedores, que são clientes de seu serviço, esperavam?

* Ele está alinhado aos requisitos funcionais e não funcionais do produto?

Vamos abordar brevemente a importância de ambientes consistentes. A justificativa mais comum ouvida dentro das equipes de desenvolvimento provavelmente é "Bom, funciona na minha máquina!"

O ambiente no qual você constrói e testa seu código representa outro conjunto de dependências que devem ser gerenciadas para manter a consistência em todo o produto final. É difícil fazer isso de forma eficaz se seus ambientes são computadores físicos, já que o laptop de cada desenvolvedor pode estar configurado de forma diferente e isso pode variar significativamente do hardware usado no ambiente de construção, no ambiente de preparação e na produção.

A virtualização e a contêinerização tornam muito mais fácil ter uma definição padrão para um ambiente de construção e um ambiente de execução que possa ser usado consistentemente ao longo do ciclo de vida do componente sendo mantido. Discutiremos isso com mais detalhes posteriormente, mas seu sistema de construção exigirá um mecanismo para configurar um ambiente adequadamente definido no qual criar e validar seus componentes de origem.

Para construir um componente a partir do código-fonte, precisamos reunir todas as dependências nas quais esse componente depende, realizar qualquer configuração necessária para o ambiente de destino e, no caso de linguagens compiladas, realizar a compilação propriamente dita.

Isso nos leva a um dos problemas mais difíceis na computação, a gerência de dependências. Uma determinada versão do seu código espera uma versão específica de cada biblioteca, componente compartilhado, serviço externo ou recurso do sistema operacional no qual ele depende. Todos esses componentes têm seus próprios ciclos de vida, a maioria dos quais estará fora do seu controle direto.

Se você não especificar explicitamente qual versão de uma dependência é necessária para construir seu código, então seu sistema deixará de ser construível ao longo do tempo, pois alterações externas na versão mais recente de uma biblioteca introduzem incompatibilidades não antecipadas.

Se você especificar explicitamente qual versão de uma dependência é necessária para construir seu código, então seu sistema ficará preso no tempo, significando que ele se afastará cada vez mais da funcionalidade fornecida pelas dependências mantidas. Isso incluirá patches de segurança e suporte para novas versões do sistema operacional, por exemplo.

Além disso, dependendo da forma como sua aplicação é implantada, muitas dessas dependências podem ser compartilhadas entre vários componentes em seu sistema, ou entre seu sistema e outras aplicações associadas no mesmo ambiente. Isso pode levar a pesadelos de compatibilidade em tempo de execução para os clientes. Você também deve considerar que pode precisar ser capaz de executar várias versões de seus próprios componentes em paralelo na produção, o que novamente introduz o risco de incompatibilidade entre bibliotecas ou serviços compartilhados. Por um bom motivo, isso geralmente é conhecido como 'inferno das dependências' e pode facilmente destruir um produto através de atrasos não antecipados, erros e má experiência do cliente.

A implicação disso é que você deve empregar um mecanismo para permitir o gerenciamento controlado de dependências em todos os componentes do seu produto e um processo para exigir atualizações contínuas e incrementais para rastrear os ciclos de vida de suas dependências, caso contrário, seu produto sucumbirá à 'degradação' à medida que se afasta cada vez mais dos ambientes de seus clientes.

Decompor seu produto em serviços fracamente acoplados que podem ser implantados em contêineres independentes se comunicando por meio de APIs publicadas fornece controle máximo sobre problemas de dependência em tempo de execução.

O restante de nossas perguntas nos leva ao tema dos testes.

Para verificar se um componente se comporta como seu desenvolvedor esperava, nosso sistema de construção deve ser capaz de executar um conjunto de testes fornecido pelo desenvolvedor. Isso deve ser considerado como uma forma de 'falhar rapidamente' para descobrir se o código não está se comportando da mesma maneira que quando foi desenvolvido e representa uma forma de teste de regressão contra o impacto de modificações futuras na base de código em questão. No entanto, observe que tanto o código quanto os testes incorporam o mesmo conjunto de pressupostos feitos pelo desenvolvedor original, portanto, são insuficientes para provar a correção do componente no contexto do produto.

Nesta fase, é recomendável realizar uma análise do código para estabelecer vários indicadores de qualidade e conformidade com padrões internos. Isso pode ser na forma de análise automatizada de qualidade de código, análise de segurança, análise de privacidade, verificação de dependências, verificação de licenças, etc., e na forma de aplicação automatizada de processos de revisão por pares manuais.

Para verificar se um componente se comporta como outros desenvolvedores, que estão consumindo serviços fornecidos pelo componente, esperam, devemos integrar esses componentes e testar o comportamento do sistema contra seus pressupostos combinados. O objetivo deste teste é garantir que os componentes atendam ao contrato declarado de comportamento e destacar áreas onde este contrato é insuficientemente preciso para permitir o desacoplamento eficaz entre as equipes.

O conjunto final de testes valida se o produto montado faz o que é esperado. Isso geralmente envolve a criação de um ambiente que seja um fac-símile razoável do seu ambiente de produção e testar as capacidades de ponta a ponta em relação aos requisitos.

Coletivamente, essas atividades são conhecidas como Integração Contínua quando realizadas automaticamente como um processo acionado pela inclusão de código nos repositórios de controle de código-fonte do produto. Este é um tópico ao qual retornaremos com mais detalhes nos capítulos posteriores.

Essas atividades fornecem uma visão unificada do status dos ativos, da dívida técnica e da degradação ao longo do tempo da propriedade intelectual. Para a maioria de uma equipe de produto, elas serão o único mecanismo pelo qual a equipe tem visibilidade do progresso e, como tal, deve ser possível para qualquer membro da equipe iniciar testes e observar os resultados, independentemente de suas habilidades técnicas.

No entanto, em última análise, suas equipes devem assumir a responsabilidade direta pela qualidade, segurança e privacidade. Adotar um processo padrão e rastreável de revisão por pares para todas as alterações de código proporciona múltiplos benefícios. Muitos olhos sobre um problema ajudam a detectar erros, mas também se tornam parte integrante do ciclo de comunicação dentro da equipe que ajuda os outros a entender no que cada um está trabalhando e como a solução se encaixa para atender aos requisitos. Feito corretamente e com sensibilidade, também se torna um mecanismo eficaz para orientar e elevar os membros menos experientes de uma equipe a níveis eficazes de produtividade e qualidade.

Seu sistema de construção deve fornecer total rastreabilidade para que você possa ter confiança de que o código que foi submetido a análise estática e revisão por pares é o mesmo código que está passando pelo processo de construção e está livre de adulterações.

A saída desejada desta etapa na fabricação do seu produto é ter ativos construídos que possam ser implantados. Anteriormente, isso teria sido executáveis, pacotes ou arquivos de distribuição prontos para serem implantados, mas sob DevOps, estamos tipicamente buscando criar ambientes contêinerizados contendo o produto, pré-configurados.

Isso deve ser um processo automatizado que aproveita as informações de configuração específicas do ambiente mantidas no repositório de código-fonte com o código que descreve o ambiente de destino desejado para implantação. Essas informações são usadas para criar uma imagem de contêiner que contém os executáveis do seu produto, configuração padrão, dados e todas as dependências.

Nesta etapa do processo, é apropriado aplicar aprimoramento automatizado de infraestrutura e testes de penetração contra sua imagem de contêiner para garantir um perfil de segurança conhecido.

A imagem pode então ser publicada em um repositório de imagens, onde representa um ativo versionado pronto para implantação. Este repositório facilita a reutilização eficiente de ativos e fornece uma série de benefícios, incluindo:

* Capacidade de implantar imagens de contêiner idênticas conhecidas em ambientes de teste e produção
* Simplificar a reutilização de instâncias de serviços contêinerizados em vários produtos
* Facilitar a criação de instâncias independentes para novos clientes em ambientes de produção isolados
* Possibilitar o gerenciamento de várias versões de um produto em múltiplos ambientes, incluindo a capacidade de retroceder rapidamente para uma versão conhecida como boa após uma implantação mal sucedida.

Como uma observação adicional ao processo, é aconselhável configurar compilações programadas do seu produto, puramente para agir como validação automatizada do status de saúde do seu ativo. Isso proporciona confiança contra 'degradação' devido a fatores externos não antecipados, como mudanças na árvore de dependências ou no ambiente de construção que introduzem falhas de compilação. Paralelamente a isso, você deve planejar atividades regulares de manutenção para atualizar sua base de código para refletir as mudanças nas dependências externas ao longo do tempo, para que seu ativo não se torne obsoleto e o deixe incapaz de reagir rapidamente a eventos de emergência, como explorações de dia zero que devem ser corrigidas imediatamente.

Ter uma máquina que pode construir seu produto é apenas metade da resposta, no entanto. Muito do risco está dentro do processo de implantar o produto em produção e isso também deve ser automatizado para mitigar com sucesso os principais problemas nesse espaço.

O primeiro problema é 'o que implantar?'. Você tem um repositório de ativos se enchendo com coisas teoricamente implantáveis, mas há um problema sutil. Dependendo da maneira como você mede e recompensa suas equipes de desenvolvimento, as compilações que entram em seu repositório podem ser unidades viáveis de código que passam nos testes, mas que não representam recursos prontos para o cliente que são seguros para serem ativados. Na maioria das equipes novas, é justo esperar que este seja o estado padrão das coisas, mas este é um padrão anti-clássico.

Para perceber muitos dos benefícios do DevOps, é essencial que as imagens que entram no seu repositório de ativos estejam prontas para produção, não apenas 'eu terminei minha parte' prontas do ponto de vista do desenvolvedor. Você precisa criar uma cultura na qual a definição de concluído mude de 'Eu terminei de hackear o código' para 'Todo o código, configuração e infraestrutura é testado e o recurso está em execução na produção'.

Não é sempre fácil chegar a esse ponto, especialmente com recursos complexos e equipes grandes, mas há uma solução alternativa que permite que você adie o problema um pouco e isso é a adoção de comutação de recursos, ou 'flags de recursos'. Usando este método, você envolve todo o código associado ao seu novo recurso em declarações condicionais que podem ser ativadas ou desativadas em tempo de execução usando configuração. Você testa seu código com as declarações ligadas e desligadas para garantir que ambos os cenários sejam seguros e cria um ativo que pode ser implantado em qualquer estado. Nessas circunstâncias, você está protegido de situações em que o código depende de outro serviço que atrasou na sua data de entrega, então seu ativo ainda está pronto para produção com o novo recurso desligado. Você também está protegido de falhas não antecipadas no novo recurso, pois pode desativá-lo na produção ou realizar testes comparativos na produção ativando o recurso apenas para alguns clientes.

Dado isso, o próximo problema é 'quando implantar?'. Em algum momento, você precisa tomar uma decisão de prosseguir / não prosseguir contra a implantação de um novo ativo. Isso deve ser baseado em um processo de implantação consistente, auditado e automatizado o máximo possível.

Em ambientes críticos de segurança, como aeronaves ou salas de operação, listas de verificação são usadas para garantir que as ações corretas sejam tomadas em qualquer cenário, especialmente quando há pressão para responder urgentemente a problemas imediatos. Tripulações de voo e equipes de teatro são treinadas no uso de listas de verificação para minimizar as chances de pular atividades essenciais quando distraídas por circunstâncias. Seu sistema de construção de produto deve automatizar o máximo possível dessas atividades de lista de verificação para garantir que as principais ações aconteçam toda vez que você fizer um lançamento.

Este também é um bom lugar para automatizar suas tarefas de conformidade regulatória para que você possa sempre associar atividades de conformidade mandatórias a um lançamento auditado.

A decisão de implantação deve ser gerenciada sob controle de acesso baseado em funções, com apenas indivíduos nomeados autorizados a iniciar uma implantação. Lembre-se de que se alguém conseguir violar o sistema que constrói seu produto, eles podem injetar código malicioso em seu repositório de ativos manipulando seus testes, então você deve tomar precauções para garantir que existam motivos claros para o novo código ser aprovado para produção.

Isso nos leva ao 'o quê, especificamente?' da implantação. Os ativos em seu repositório são tipicamente serviços reutilizáveis que são agrupados com configurações padrão que foram usadas para teste, mas agora você precisa de uma instância concreta deste serviço, em um ambiente específico, contra um conjunto específico de outras instâncias de serviço, para um cliente ou aplicação específicos. Portanto, seu processo de implantação deve incluir um conjunto apropriado de substituições de configuração que definirão a instância específica que está sendo criada. Aqui é onde você deve lidar com o recurso de comutação que você adiou anteriormente.

Finalmente, chegamos ao 'como?' da implantação. Idealmente, você deseja um processo de implantação intocado por mãos humanas, para garantir um processo previsível e repetível com resultados conhecidos. Você pode usar scripts procedimentais para implantar seu ativo, mas geralmente é melhor usar uma abordagem declarativa, como o GitOps, onde você mantém uma descrição versionada de como deseja que seu ambiente de produção seja e as mudanças comprometidas com essa descrição acionam o sistema para fazer o que for necessário para alinhar o ambiente de produção com o estado desejado.
Lembre-se do modelo de 'animais de estimação versus gado' de ambientes. Se você tiver um problema com a infraestrutura, é muito melhor matar a instância e criar uma nova automaticamente do que tentar ajustá-la manualmente para torná-la saudável novamente.

Como parte deste processo, você desejará ter validação automatizada de implantação bem-sucedida e recuperação automatizada para o último estado conhecido bom no caso de uma falha.

Você está tentando criar uma cultura e um mecanismo no qual pequenas unidades de funcionalidade são implantadas incrementalmente na produção com a menor quantidade possível de entrada humana. Isso é Implantação Contínua.

Ao unir tudo isso, seu objetivo é construir um mecanismo de entrega de produto que permita a Entrega Contínua de recursos que apoiem os objetivos de descoberta de produto, em uma cadência alinhada às métricas discutidas anteriormente, maximizando assim suas chances de sucesso comercial dentro das restrições de sua capacidade e espaço disponíveis.

Nas seções subsequentes, exploraremos mais detalhadamente os aspectos específicos de cada um desses desafios.