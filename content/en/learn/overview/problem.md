---
title: "Understanding the Problem"
linkTitle: "Understanding the Problem"
weight: 1
author: Terry Cox
description: >
  Learn about the fundamental challenges that Continuous Delivery addresses
---

{{% youtube RC5Ai0buX3Y %}}

<br>
Software development at scale is an activity within the broader context of Product Commercialization. 
*Our goal is not to build software, but to build a product that leverages software or machine learning to solve the problem that the product addresses.*

The problems of product commercialization drive the approach that we use to optimize software delivery. Let’s start by understanding these problems.

It is often assumed that product development looks like this:

1. Have a brilliant idea for a product
2. Build the finished product
3. Sell the product
4. Profit!

In practice, the reality is that your idea is actually an assumption about what might represent a product, but at that stage, you have no evidence to show that anyone wants to buy it.

You could follow the flow above, but if you are going to invest say $10M in the process of developing your product, you are effectively gambling that $10M on the chance that there will be enough customers to return your investment and make a profit.

Best practice in product commercialization looks more like this:

1. Have 1,000 ideas
2. Evaluate and rank each idea for potential merit to find the best
3. Take this idea and find a handful of customers who have the problem it solves
4. Work iteratively with your customers to build a series of experiments that test the usefulness of your idea at the minimum viable scale
5. If your customers get excited and start offering to pay for the product, invest in scaling to a full implementation; otherwise
6. Stop. Pick the next idea from your list and go back to step 3

This ensures that you are only investing heavily in activities that have strong evidence of product-market fit.

The trouble is, even with this process, less than one in ten product ideas will succeed in the marketplace, so it is very important to optimize this process to run as lean as possible so that the cost of running your learning experiments is manageable within the reserves of investment available to you.

What does this mean from a software development perspective?

Well, in the first model, you would expect to receive a full set of requirements up front and could carefully optimize a design to take account of everything that the product needs to be able to do. Then this could be decomposed into features and given to teams to implement against specifications.

In the lean model, all you have to start is a set of assumptions about what a customer’s problem might be. In this case, the role of the development team is actually to help design and build experiments that validate (or invalidate) each assumption, in conjunction with real customers.

In the first model, you expect to spend a year or so making mistakes and learning about the problem domain in private, before a big public launch of a polished application.

In the lean model, you have to do your learning in front of the customer, regularly delivering new experimental features into live production environments.

This learning takes the form of an iterative loop:

1. Propose a hypothesis about what feature might be of value to the customer
2. Design and develop an experiment to test this feature in the customer’s environment
3. Run the experiment with the customer and evaluate
4. Adjust the experiment and re-run; or
5. Move to the next experiment; or
6. Shut down the product

Of course, you can expect to have a finite budget to invest in learning experiments, and your customers will have a finite attention span, so there is a hard limit on how many times you can iterate through this loop before failing out. As a result, it is crucial to optimize this loop so that you can afford as many iterations as possible to maximize your chance of discovering a feature set that demonstrates product-market fit.

This means that we can derive two critical metrics that will assist us in staying focused upon optimizing our product commercialization process at all times:

## Deployment Frequency
Your ability to execute the above loop is constrained by the frequency at which you can deploy your product into production. If it takes six months to move a feature into production, you will run out of money and customers long before you get to run more than that one experiment. If it takes you a week to deploy, you probably won’t be able to run enough experiments to discover the right product.

This implies the need to optimize the entire delivery process to be able to move features into production on a cadence of days to hours.


## Lead Time
Understanding the time it takes from the point of identifying a new hypothesis you wish to test, to the point at which an experiment to test it has been deployed in production, helps to define the granularity of the experiments which you are able to run. If it is going to take a team three months to implement an experiment, then consideration should be given to reducing the scope of the experiment, or splitting the problem into smaller components that can be developed in parallel by multiple feature teams.

Optimizing the delivery process to consistently reduce lead times increases the capacity to run more experimental iterations within your available runway.

Working in this iterative fashion requires a fundamental conceptual shift across delivery teams. Instead of the assumption that “the product must be perfect, eventually”, it is necessary to assume that failure is to be expected regularly and as a result, be primarily very good at fixing things fast.

This should not be interpreted to mean ‘quality is lower’. Realistically, the idea of building products that don’t break is a naive oversimplification. Instead, we must consider that things can break; we should anticipate the ways in which they might be expected to break and mitigate the risk associated with breakages.

An unanticipated breakage that takes a product down for a week can kill a business. A temporary outage of one feature of a product is merely a minor annoyance and a failed feature deployment that is safely rolled back after failing smoke testing probably will go unnoticed.

This allows us to derive two more key metrics:

## Time to Restore
Optimizing the time between identifying an incident and recovering from the incident mitigates the risk exposure during the failure. Typically, this encourages us to decompose our designs into small footprint components that are easily testable and have limited impact in the case of failure. Where mistakes are made, limiting the scope of the impact of those mistakes reduces risk and the time needed to recover.

## Change Failure Rate
Tracking the percentage of changes that lead to an incident in production gives us a proxy metric for quality. This should in turn lead to appropriate root cause analysis. If many of the changes we make to our product are causing issues, do we properly understand the problem our product is designed to address? Does the product development team understand the product they are building? Is our delivery process prone to errors?

Why this focus on metrics, though?

Well, this is another major challenge for technology product development. 
In traditional engineering disciplines, such as civil engineering or aerospace, you are building something physical. If, every day, your product under development looks more like a bridge or an airplane, everyone on the team can understand that you are heading in the right direction and get a feel for progress. If your airplane starts to look more like an elephant, you can stop and reassess your activities to ensure you are on track.

Now imagine that you are building an invisible aircraft out of thousands of invisible components.

You can’t see the components being built, or the product being assembled from them. You have a team of hundreds of people working on the product and are relying entirely upon blind faith that they all know what they are doing and are all building compatible parts because the first time you will be able to evidence that will be on the maiden flight with the customer…

Surely, nobody in their right minds would buy an aircraft from a company that had an engineering process that looked like that?

Of course, the reality is that this is exactly how a lot of organizations approach the development of software products and goes a long way to explaining why 70% of software projects fail and 20% of those fail badly enough to threaten the viability of the parent company.

A core component of successful software delivery lies in making progress visible within an intrinsically invisible domain.

Small teams tend to do this naturally using communication. Many adopt basic Agile rituals that involve daily stand-ups to communicate issues, progress and blockers. At a small scale, this is viable. However, the number of possible communication paths scales with n<sup>2</sup>-n (where n is the number of people on the team). As a result, once you get beyond about six people on a team, they are spending the majority of their time on communication activities rather than developing software.

The implication of this is that for larger products, it is insufficient to follow our natural instincts or to apply basic engineering project management techniques from other disciplines. We need to apply a methodology specifically designed to mitigate the risks associated with working with intangible assets.

Before we look at the details of such a methodology, we should first consider the value of a software asset from a commercial, rather than a purely technical perspective. The software that we create can be considered to be a tool designed to solve a specific real world problem and the value of that tool relates to the benefit generated for the customer by the resolution of their problem.

This is important because it is rare that software has intrinsic, long term value. Software exists as a transient solution to contemporary issues in the outside world. Where a commodity like gold has a fluctuating but effectively perpetual value in the marketplace, the value of software is entirely dependent upon external factors, such as the continued existence of the problem that a given program is designed to solve, and the fact that this particular software still represents the best available solution to this problem.

Because software is implicitly impacted by external factors, it should be considered as a perishable asset. The problem your software is designed to face changes slowly over time. The market your software competes in changes quite rapidly. The physical hardware and the operating system that your software operates upon evolves continuously. The legislative and compliance environment impact your software changes, as do the security and data protection challenges associated.

It is critical therefore to understand that software rots, if left untouched for any period of time.

If we think about software on a project-centric basis, we make the error of considering it as a linear process from design to release and then try to optimize our process to get over the ‘finishing line’ faster.

To properly manage software assets, they must be considered in the context of an ongoing and iterative asset management loop, where ‘release’ is merely a regular, repeating stage in the lifecycle of the asset.

It is worth reiterating here, the value of software is based upon what it can actually do for customers, not what we believe it can do. If that value can shift over time due to external factors, and the asset itself is effectively invisible and therefore cannot be observed directly, we need some mechanism by which we can reliably assess the ongoing value of the asset that we own.

This problem is fractal in nature, since it recurs at multiple levels within our application. A software product is typically made up from multiple components or features, which when operating at scale, are nearly always developed and maintained by different teams. Those components are themselves built upon other components, often from teams outside your organization, and so on, down to the microcode in the processors you are running on.

Each of those components should be assumed to be partially complete. They achieve some of their design goals, but have some level of associated technical debt that has not been paid off because it is not economically viable to do so completely, or because you are doing something with it that the owners haven’t got around to testing themselves yet.

So, everything in your asset is built on stuff that is potentially a bit broken or about to break due to factors outside your awareness.

There is no ‘permanent solution’ to this problem that can be applied once and forgotten about. The only viable approach is to repeatedly rebuild your application from all of its components to ensure that it can still be built, and to repeatedly test the asset to measure that it is still meeting the factors that give it value in the marketplace. In the next section, we will look in more detail at best practice methods for achieving this effectively and reliably.