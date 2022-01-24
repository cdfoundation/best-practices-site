---
title: "Common mistakes"
linkTitle: "Common mistakes"
weight: 10
description: >-
     "How to be really good at Continuous Delivery AND completely destroy your company"
---
Before we go deeper, it is very important that we flag a common anti-pattern that can take your Continuous Delivery experience off into a catastrophic direction.

We have introduced the idea of DevOps as a process that helps you optimize delivery based upon metrics. Pick the wrong metrics, however, and you will get very efficient at being busy doing all the wrong things until you run out of resources and are shut down.

It is very tempting to align all your metrics against the delivery of features. Everyone in the organization will happily join in this activity because features are arbitrary lists of work that are easy to come up with, easy to measure progress against and usually represent things that are directly tied to milestones and bonuses. Worse, it is really, really easy to build processes that automate the end to end pipeline of delivering features and measuring their delivery. You will feel good doing it. Everyone will be busy. Stuff will happen and features will get delivered. Things will be happening faster and more efficiently than they were before. Bonuses and incentives will abound.

Then, there will be a reality adjustment. Your customers still aren’t happy. Nobody is buying. In fact, the instrumentation shows that nobody is really even using the features you shipped. Growth tanks and everyone starts saying that "Continuous Delivery doesn’t work”.

Here’s the error: Features are outputs. **For Continuous Delivery to work as intended, your metrics must be based upon Outcomes, not Outputs.**

> The benefits of Continuous Delivery are not derived from the optimization of the engineering process within your organization. The purpose of Continuous Delivery is to optimize the delivery of those outcomes that are most important to your customers.

The bulk of the technical details of Continuous Delivery implementation can appear to sit within the engineering function and DevOps transformations are often driven from that team, but Continuous Delivery will only work for your organization if it is adopted as a core component of a product commercialization strategy that aligns all activities across shareholders, management, marketing, sales, engineering and operations.

The activities flowing through your Continuous Delivery pipeline should either be experiments to validate a hypothesis about customer needs, or the delivery of features that represent a previously validated customer need. All of this must be driven by direct customer interaction.

In order to successfully implement Continuous Delivery, your organization must have a structure that sets out strategic outcomes and empowers teams to discover customer needs and take solutions to them to market. This implies a level of comfort with uncertainty and a trust in delivery teams to do what is best for the customer in the context of the strategy.

In a classical business, ‘strategy’ is little more than a plan of work which is formed annually and which spells out the set of features to be delivered in the following year. All spending and bonuses are structured against this plan, leaving little room to change anything without ‘failing’ on the plan.

If an engineering team attempts to implement Continuous Delivery unilaterally within this structure, they will find themselves railroaded into using it to implement planned features by the rest of the organization. Furthermore, they will have no power to release into production because go-live processes will remain defined by other areas of the business that are still operating against classical incentives and timescales.

Broad support for organisational change at board level is necessary for a successful Continuous Delivery implementation.
