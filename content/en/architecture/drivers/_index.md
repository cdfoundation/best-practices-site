---
title: "Drivers and Constraints"
linkTitle: "Drivers and Constraints"
weight: 20
author: Terry Cox
description: >
  Understanding what we must and must not do
---

> "To truly motivate others 
> 1) discover what their motives, desires & drivers are 
> 2) genuinely connect with and support them from the heart."
>
>    — Rasheed Ogunlaru

In this section, we get to grips with one of the most common misconceptions about Continuous Delivery, which is to think of it as an engineering approach to optimize software development.

In reality, software rarely, if ever, exists for its own sake. We build software to solve a problem in the physical world, generally in the form of a product that is being created by an organization.

As we have already seen from the previous section, there are always many stakeholders involved in the development of a product, each with their own views associated. Any of these stakeholders may be able to legitimately block the release of a product, based upon concerns raised from their viewpoint.

By treating Continuous Delivery as an engineering discipline, we make the mistake of optimizing for the views of the CTO, or the Software Engineers. For many, this appears to be the path of least resistance because they are attempting to implement Continuous Delivery from within an engineering department. In practice, this is nearly always a dead end. The engineering team exists to serve the needs of the organization, so optimizing for those viewpoints alone can quickly take you outside the context of the real problem at hand and results in an inevitable battle with all the other stakeholders. 'Winning' that battle can destroy the organization, and losing it destroys confidence in Continuous Delivery as a methodology for success. It is advisable never to get into this dilemma. 

Continuous Delivery, therefore, is best understood as a methodology for accelerating the delivery of product, in the face of all of these conflicting concerns.

To understand how to do this, we must first be able to reconcile all the views and viewpoints from the previous section. We do this by setting out the overarching set of drivers and constraints for the product line which we will use subsequently to resolve any conflicts.

In the start-up world, where Continuous Delivery was born, this process is trivial to the point of rarely being worth a mention. The north star is solving the customer's problem in such a way as to demonstrate strong product-market fit. This driver is paramount, since if there is no product-market fit, there is no scaling and if there is no scaling then there is no exit, no payoff to everyone involved, and shortly thereafter, no company. The primary constraint is having very limited time and money with which to do this. 

The reason why this is rarely explicitly discussed as the core of the methodology, is that in a startup environment, either everyone's incentives are already aligned enough to naturally optimize for product delivery, or the business doesn't last long enough for anyone to have conversations about it. Those who survive and thrive are the ones that allowed the customer's behaviors to drive their product development process.

For all other classes of organization, however, there is a much bigger challenge that must be resolved.

In a start-up, all of your team are primarily motivated by the value of their equity stake in the product. The product has to succeed or they won't be rewarded, so there is very strong alignment between the outcomes of the business, the customer and the team.

Contrast this with the situation where your team are recompensed based upon salary and bonus. In the short to medium term, their salary will continue to be paid regardless of the outcome of the product and their bonus is most likely linked to an annual, strategic plan for their department. Both of these incentives are entirely disconnected from the behavior of the customer. In these scenarios, team alignment rapidly diverges from the goals of the business and becomes either centered upon individual progression in competition with other team members, or departmental competition over conflicting role-based viewpoints.

To realize the benefits of Continuous Delivery within any organization that is not an early-stage start-up, your primary challenge will be in creating an incentive structure that is artificially re-aligned to the needs of the customer and the product, despite constant, natural pressure to diverge from this. It is not advisable to pursue a Continuous Delivery approach if you are unable to change the incentive structure of the organization. The outcome of attempting this path is that many additional barriers will be encountered, many of which can be traced back to "my bonus depends upon us NOT being able to achieve this".

To build an effective Continuous Delivery process, you need to find outcomes that are aligned to customer needs, and then align incentives to these outcomes. By working through the positive views from each viewpoint, you can find a set of outcomes to work towards, which reflect the individual goals of each stakeholder and which can be expressed as overarching drivers for the team. Similarly, you can take the negative views from each viewpoint and translate these into constraints that must be worked away from.

Be aware that in a large organization, there will be conflicting drivers and constraints that must be explicitly reconciled and prioritized so that the team is able to progress autonomously without falling back into internecine fighting. For example, the legal and compliance teams might prefer that you didn't do anything new, as this might introduce new and hard to quantify risk to the organization, but the process of discovering product-market fit requires than you not just do new things, but do them wrong until such time as you have acquired enough information to know how to do them right. Resolving this in a mature organization requires calm leadership and lots of negotiation. Seek boundary conditions and work inward from extremes. There will be examples of legislative compliance that are compulsory at scale, but which can be be mitigated whilst experimenting with individual customers, for instance. It is vital that you make it clear that you understand the concerns of each viewpoint, but then set these concerns in the context of the organizational and customer goals.

In the previous section, we introduced the idea of value add from Continuous Delivery, from the perspective of each viewpoint. This is fundamental to successfully implementing Continuous Delivery across the organization. To get the end-to-end Continuous Delivery process running as a finely tuned machine, it will be necessary to change the processes that exist within various departments and functions currently. This is typically a negotiation where the overarching drivers of the organization are insufficient to catalyze change. Instead, it becomes important to sell the individual benefits of the methodology in addressing the needs and concerns of that team or function. This must be done sensitively. Many of the benefits of Continuous Delivery are realized through increased automation, increasing quality, consistency and repeatability, but teams that have previously done the majority of their work manually will tend to see the prospect of automation as a threat to their jobs, or to their status as people managers. It is necessary, therefore, to show how increasing growth will inevitably lead to inability to stay on top of manual workloads, and hence carefully evangelize the idea of automation as freeing people up to do more important work with higher value add.

A pattern will emerge as you progress on this journey. Teams typically evolve a risk management approach that involves adding increasing levels of manual compliance activities in a vain attempt to prevent further risk. Eventually this hits a point of diminishing returns and ability to grow further, stalls. Success in Continuous Delivery requires that you invert the mental model to one where risk is inevitable and unavoidable, but risk mitigation derives from being able to react so rapidly to the unexpected that impact of that risk is minimized to the point of negligibility. This means working to a process where instead of having many teams manually inspecting deliverables after the fact, to try to judge if they are safe to release, you instead have those teams working up front to provide sufficient automated testing and validation that you are able to reverse out any failures so fast that the impact is insignificant.

The engine that takes your products successfully to market are thus just a series of pipelines that provide sufficient automated validation to create confidence in the quality of the product release. What is in each of those pipelines? Well, you already know that, it's the sum of all the concerns raised within the views and viewpoints section, reconciled against the driving needs of the customer.