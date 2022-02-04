---
title: "Going slower to go faster"
linkTitle: "Going slower to go faster"
weight: 20
author: Terry Cox
description: >-
     Understanding what makes the most difference when optimizing for success
---
For a single person, working in isolation on a single problem, the fastest route is a straight line from point A to point B.

The classic approach to trying to speed up a team is to make linear improvements to each team member’s activities, cutting corners until they are doing the minimum possible activity to get to the desired outcome. Taken to extremes, this often results in neglecting essential non-functional requirements such as security, privacy or resilience. This is, however, an anti-pattern for more subtle and pernicious reasons - inner loops and exponential scalars…

When trying to complete a task in a hurry, we tend to use a brute-force, manual approach to achieving tasks. Need to set up an environment? “Oh, I’ll just google it and cut and paste some commands.” Need to test something? “I can check that by exercising the UI.”

All these tasks take time to do accurately, but in our heads we budget for them as one-off blockers to progress that we have to push through. Unfortunately, in our heads, we are also assuming a straight line, ‘happy path’ to a working solution. In practice, we actually are always iterating towards an outcome and end up having to repeat those tasks more times than we budgeted for.

Under these circumstances, we notice that we are slipping and start to get sloppy at repeating the boring, manual tasks that we hadn’t mentally budgeted for. This has the effect of introducing a new class of errors, that we also hadn’t factored into our expectations, throwing us further off track.

If these manual tasks fall inside an inner loop of our iterative build and release process, they are capable of adding considerable overhead and risk to the process. Identifying these up front and budgeting for automating them on day one pays back the investment as soon as things stray into unanticipated territory.

The benefits of this are easy enough for individuals to visualize. The next problem, however, is more subtle and more impactful.

As we have discussed previously, working with ‘invisible’ artifacts like software systems means that teams have to manage the problem of communicating what is needed, what is being done and what technical debt remains. On a team of ‘n’ people, the number of possible communication paths goes up with n2-n and this exponential scaling factor can rapidly wipe out all productivity.

Similarly, if everyone on the team takes a unique approach to solving any given problem, the amount of effort required for the team to understand how something works and how to modify it also goes up with n2.

As your product grows, numbers of customers and volumes of transactions also scale exponentially.

As a result, behaviors that worked just fine on small teams with small problems suddenly and unexpectedly become completely unmanageable with quite small increases to scale.

To operate successfully at scale, it is critical to mitigate the impact of complexity wherever possible. Implementing consistent, repeatable processes that apply everywhere is a path to having one constrained set of complex activities that must be learned by everyone, but which apply to all future activities. This adds an incremental linear overhead to every activity, but reduces the risk of exponentially scaling complexity.

The implication of this is that there is a need to adopt a unified release cycle for all assets. It helps to think about your release process as a machine that bakes versions of your product. Every asset that makes up your product is either a raw material that is an input to the machine, or it is something that is cooked up by the machine as an intermediate product. The baking process has a series of steps that are applied to the ingredients in order to create a perfect final product, along with quality control stages that reject spoiled batches.

If you have ingredients that don’t fit into the machine, or required process steps that the machine doesn’t know about, you cannot expect to create a consistent and high-quality final product.

It is worth stressing this point. If your intention is to build a product which is a software system that produces some value for customers, you should have the expectation that you will also need to own a second system, which is the machine that assembles your product. These systems are related, but orthogonal. They both have a cost of ownership and will require ongoing maintenance, support and improvement. The profitability of your product is related to the effectiveness of the machine that assembles it, as is your ability to evolve future products to identify product-market fit.

So, what are the key features of a machine that manufactures your product?

Let’s start by looking at the ingredients that you are putting into the machine. These will typically comprise the source code that your development teams have created, third party dependencies that they have selected and data sets that the business has aggregated. These are people-centric operations that carry with them an increased risk of human error and a set of associated assumptions that may or may not align to the outcomes required for your final product.

Any component at this level will have been created by an individual or small team and it should be assumed that this work was undertaken with minimal understanding of how the component will interact with the rest of your product.

This introduces some key questions that your build system must be able to validate:

* Can the component be built in your official environment?

* Does it behave the way the developer expected?

* Does it behave the way that other developers, who are customers of its service, expected?

* Does it align to functional and non-functional requirements for the product?

Let’s touch briefly on the importance of consistent environments. The most commonly heard justification within development teams is probably “Well, it works on my machine!”

The environment in which you build and test your code represents another set of dependencies that must be managed if you are to maintain consistency across your final product. It is hard to do this effectively if your environments are physical computers, since every developer’s laptop may be configured differently and these may vary significantly from the hardware used in the build environment, the staging environment and production.

Virtualization and containerization make it much easier to have a standard definition for a build environment and a runtime environment that can be used consistently across the lifecycle of the component being maintained. We will discuss this in further detail later, but your build system will require a mechanism by which to configure an appropriately defined environment in which to create and validate your source components.

To build a component from source, we need to collate all of the dependencies that this component relies upon, perform any configuration necessary for the target environment, and, in the case of compiled languages, perform the compilation itself.

This brings us to one of the harder problems in computing, dependency management. A given version of your code expects a particular version of every library, shared component, external service or operating system feature upon which it relies. All of these components have their own lifecycles, most of which will be outside your direct control.

If you do not explicitly state which version of a dependency is required in order to build your code, then your system will cease to be buildable over time as external changes to the latest version of a library introduce unanticipated incompatibilities.

If you explicitly state which version of a dependency is required in order to build your code, then your system will be pinned in time, meaning that it will drift further and further behind the functionality provided by maintained dependencies. This will include security patches and support for new operating system versions, for example.

Furthermore, depending upon the way in which your application is deployed, many of these dependencies may be shared across multiple components in your system, or between your system and other associated applications in the same environment. This can lead to runtime compatibility nightmares for customers. You should also consider that you may need to be able to run multiple versions of your own components in parallel in production, which again introduces the risk of incompatibility between shared libraries or services. For good reason, this is generally known as ‘dependency hell’ and can easily destroy a product through unanticipated delays, errors and poor customer experience.

The implication of this is that you must employ a mechanism to allow controlled dependency management across all the components of your product and a process to mandate continuous, incremental updates to track the lifecycles of your dependencies, or your product will succumb to ‘bit rot’ as it drifts further and further behind your customer’s environments.

Decomposing your product into loosely-coupled services that can be deployed in independent containers communicating through published APIs provides maximal control over runtime dependency issues.

The remainder of our questions bring us to the topic of testing.

To verify that a component behaves the way its developer expected, our build system should be able to run a set of tests provided by the developer. This should be considered as a ‘fail fast’ way to discover if the code is not behaving the way that it was when it was developed and represents a form of regression testing against the impact of future modifications to the codebase in question. Note however that both the code and the tests incorporate the same set of assumptions made by the original developer, so are insufficient to prove the correctness of the component in the context of the product.

At this stage, it is recommended to perform an analysis of the code to establish various metrics of quality and conformance to internal standards. This can be in the form of automated code quality analysis, security analysis, privacy analysis, dependency scanning, license scanning etc, and in the form of automated enforcement of manual peer review processes.

To verify that a component behaves the way that other developers, who are consuming services provided by the component, expect, we must integrate these components together and test the behavior of the system against their combined assumptions. The purpose of this testing is to ensure that components meet their declared contract of behavior, and to highlight areas where this contract is insufficiently precise to enable effective decoupling between teams.

The final set of testing validates whether the assembled product does what is expected of it. This typically involves creating an environment that is a reasonable facsimile of your production environment and testing the end-to-end capabilities against the requirements.

Collectively, these activities are known as Continuous Integration when performed automatically as a process that is triggered by code being committed to product source control repositories. This is a topic that we shall return to in more detail in later chapters.

These activities provide a unified picture of asset status, technical debt and degradation over time of intellectual property. For the majority of a product team, they will be the only mechanism by which the team has visibility of progress and as such, it should be possible for any member of the team to initiate tests and observe the results, regardless of their technical abilities.

Ultimately, however, your teams must take direct responsibility for quality, security and privacy. Adopting a standard, traceable peer review process for all code changes provides multiple benefits. Many eyes on a problem helps to catch errors, but also becomes an integral part of the communication loop within the team that helps others to understand what everyone is working on and how the solution fits together to meet requirements. Done correctly and with sensitivity, it also becomes an effective mechanism for mentoring and lifting up the less experienced members of a team to effective levels of productivity and quality.

Your build system should provide full traceability so that you can be confident that the source that was subjected to static analysis and peer review is the same code that is passing through the build process, and is free from tampering.

The desired output from this stage in manufacturing your product is to have built assets that can be deployed. Previously, this would have been executables, packages or distribution archives ready for people to deploy, but under DevOps we are typically looking at creating containerized environments containing the product, pre-configured.

This should be an automated process that leverages environment specific configuration information held in the source repository with the code that describes the desired target environment for deployment. This information is used to create a container image which holds your product executables, default configuration, data and all dependencies.

At this stage in the process, it is appropriate to apply automated infrastructure hardening and penetration testing against your container image to ensure a known security profile.

The image may then be published to an image repository, where it represents a versioned asset that is ready for deployment. This repository facilitates efficient re-use of assets and provides a number of benefits, including:

Being able to deploy known identical container images to test and production environments alike
Simplifying the re-use of containerized service instance across multiple products
Making it easy to spin up independent instances for new customers in isolated production environments
Enabling management of multiple versions of a product across multiple environments, including being able to rapidly roll back to a known good version after a failed deployment.

As an aside to the process, it is advisable to set up scheduled builds of your product, purely to act as automated status validation of your asset health. This gives confidence against ‘bit rot’ due to unanticipated external factors such as changes in your dependency tree or build environment that introduce build failures. In parallel with this, you must plan regular maintenance activities to update your codebase to reflect changes in external dependencies over time, so that your asset does not become stale and leave you unable to react rapidly to emergency events such as zero day exploits that must be patched immediately.

Having a machine that can build your product is only half the answer, however. Much of the risk sits within the process of deploying the product into production and this must also be automated in order to successfully mitigate the main problems in this space.

The first issue is ‘what to deploy?’. You have an asset repository filling up with things that are theoretically deployable, but there is a subtle problem. Depending upon the way you measure and reward your development teams, the builds coming into your repository may be viable units of code that pass tests, but which don’t represent customer-ready features that are safe to turn on. In the majority of new teams, it is fair to expect that this will be the default state of affairs, but this is a classic anti-pattern.

To realize many of the benefits of DevOps, it is essential that the images that are getting into your asset repository are production-ready, not just ‘done my bit’ ready from a developer’s perspective. You need to create a culture in which the definition of done switches from ‘I finished hacking on the code’ to ‘All code, configuration and infrastructure is tested and the feature is running in prod’.

It’s not always easy to get to this point, especially with complex features and large teams but there is a work-around that allows you to kick the problem down the road somewhat and this is the adoption of feature switching, or ‘feature flags’. Using this approach, you wrap all code associated with your new feature in conditional statements that can be enabled or disabled at runtime using configuration. You test your code with the statements on and off to ensure that both scenarios are safe and create an asset that can be deployed in either state. Under these circumstances, you are protected from situations where the code is dependent upon another service that has slipped on its delivery date, so your asset is still production-ready with the new feature turned off. You are also protected from unanticipated failures in the new feature since you can turn it off in production, or can perform comparative testing in production by only turning the feature on for some customers.

Given this, the next issue is ‘when to deploy?’. At some point, you need to make a go / no go decision against the deployment of a new asset. This should be based upon a consistent, audited, deployment process that is automated as much as possible. 

In safety critical environments, such as aircraft or in operating theaters, checklists are used to ensure that the right actions are taken in any given scenario, especially when there is pressure to respond urgently to immediate problems. Flight crews and theatre staff are drilled in the use of checklists to minimize the chances of them skipping essential activities when distracted by circumstances. Your product build system must automate as many of these checklist activities as possible to ensure that key actions happen each and every time you make a release.

This is also a good place to automate your regulatory compliance tasks so that you can always associate mandated compliance activities with an audited release.

The deployment decision should be managed under role-based access control, with only nominated individuals being authorized to initiate a deployment. Remember that if someone manages to breach the system that builds your product, they may be able to inject malicious code into your asset repository by manipulating your tests, so you must take precautions to ensure that there are clear reasons for new code passing into production.

This brings us to the ‘what, specifically?’ of deployment. The assets in your repository are typically re-usable services that are bundled with default configurations that have been used for testing but now you need a concrete instance of this service, in a given environment, against a specific set of other service instances, for a specific customer or application. Your deployment process must therefore include an appropriate set of configuration overrides that will define the specific instance that is created. This is where you must deal with the feature switching can that you kicked down the road earlier.

Finally, we get to the ‘how?’ of deployment. Ideally, you want a deployment process that is untouched by human hands, so that you can guarantee a predictable and repeatable process with known outcomes. You can use procedural scripts to deploy your asset, but generally it is better to use a declarative approach, such as GitOps, where you maintain a versioned description of how you would like your production environment to look and changes committed to this description trigger the system to do whatever is necessary to bring the production environment into line with the desired state.
Remember the ‘pets vs cattle’ model of environments. If you have a problem with infrastructure, it is far far better to kill the instance and create a fresh one automatically than to try and tinker with it manually to make it healthy again.


As part of this process, you will want to have automated validation of successful deployment, and automated recovery to the last known good state in the event of a failure.


You are trying to create a culture and a mechanism within which small units of functionality are incrementally deployed to production as frequently as possible, with the minimum of human input. This is Continuous Deployment.

Tying all this together, your goal is to build a product delivery engine that enables Continuous Delivery of features supporting your product discovery goals, at a cadence aligned to the metrics discussed earlier, thus maximizing your chances of commercial success within the constraints of your available runway and capacity.

In subsequent sections, we will dive more deeply into the specifics of each of these challenges.
