
---
title: "Continuous deployment"
linkTitle: "Continuous deployment"
weight: 6
description: >
  Best practices for continuous deployment
---


- [Continuous Delivery and Deployement](#heading-cdd)
- [Definition](#heading-def)
- [Description and Scope](#heading-das)
- [Best practices](#heading-bp)


# Continuous Delivery and Deployment {#heading-cdd}
Continuous Integration ensures that the commits to a code base are validated in an automated way.  This led to the concept of Continuous Delivery, where the build output is published as an artifact (or set of artifacts) that are able to be deployed via a manual process. Continuous deployment takes that even further to say those artifacts can be *automatically* deployed because of the attestation the software pipeline ensures about correctness. Put another way, once developers have automated the creation and validation of build artifacts any time code is updated, the logical extension is to automate the deployment of those updates as well.

As developers and testing teams became more efficient at providing release candidates, production teams were being asked to move the new updates forward to the end users. However, the production teams had different deployment requirements and often used ‘operation’ tooling to perform releases. The scripts that drove deployments for development and testing were not accepted by the teams managing the production environments. This began a culture shift. We began to see the rise in “Site Reliability” engineering, individuals who work at an operational level but assigned to development teams. This began a conversation about automating the continuous deployment step of the DevOps pipeline and shifted the conversation from continuous integration to solving a repeatable continuous deployment step integrated into the continuous delivery orchestration. To support what the operational side of the house needed it became apparent that automated tooling, specific to deployments, was required. In particular, solutions to serve the auditability and change management of production endpoints was required to build a DevOps pipeline that truly served the needs of both sides of the equation. The deployment automation category was born. 


# Definition {#heading-def}
Continuous deployment is an approach where working software is released to users automatically on every commit. The process is repeatable and auditable.

# Description and Scope {#heading-das}
The need to automate deployments grew out of the continuous integration movement. Developers automated deployments from their CI workflows using a simple deployment script to update their development environments for unit testing. Initially the scripts were just a copy command. As the industry evolved, the need to recycle web servers and tweak environment configurations were added to the scripts. The deployment step began to become more and more complicated and critical. Testing teams became more dependent on developers to perform testing releases. In many ways, this need evolved a simple CI workflow into a Continuous Delivery workflow, automating the update to testing upon a successful unit test in development. Now one workflow called another workflow and we began the journey into continuous delivery. 

Once the unit testing was complete, the need to push the update to testing and production drove the evolution of automating deployments to include broader management of the deployment process with the goal of deployment repeatability across all stages. While continuous deployments had been embraced by developers and testers, production teams were not willing to accept updates on a high frequency basis. Operation teams, with the goal of maintaining a stable production environment, have a culture of being risk averse. In addition, the deployment needs of production are consistently different from the needs of development and testing. Creating a single platform for managing deployments across the lifecycle pipeline became the goal of the continuous deployment movement. 

Continuous deployments can be viewed in two ways, a push process or a pull process. A push solution updates environments upon a call from the continuous delivery orchestration engine. A pull solution, such as GitOps, manages deployments based on a ‘state’ defined by configuration data in a deployment file stored in an ‘environment’ repository. An operator running in an environment monitors the state by referencing the deployment file and coordinates the updates. In either case,  a new update ‘event’ triggers the Continuous Delivery process to perform an action. That action can push a deployment, or create a pull request to update a deployment file to a repository. The outcome is the same, a consistent repeatable deployment process is achieved. 



# Best Practices {#heading-bp}

## Repeatability {#heading-repeat}
The deployment process must be repeatable across all stages of the pipeline. To achieve repeatability, values that are specific to an environment should be separated from the deployment tasks. This allows the logic of the deployment to remain consistent, while the values change according to the endpoint. 

## Automation to Reduce One-Off Scripting {#heading-auto}
Continuous deployment requires the ability to scale quickly. This means that the reliance on deployment scripts can impede scaling of your release process. To avoid the reliance on scripts, the process should include a set of reusable tasks, components and functions that can define a templated approach to deployments. 

## Environment Modeling {#heading-env}
A logical view of your endpoints, their use, ownership and capabilities is essential for defining your release landscape and creating a reference for automated deployments. Reporting on the Environment configurations is required for abstracting the differences between any two environments - a process required for debugging when a deployment does not perform as expected based on metrics defined in a previous environment. 

## Approval and Approval Gates {#heading-approval}
Depending on the specific vertical, approvals of releases to testing and production environments may be required. Highly regulated markets require a separation of duties which speaks directly to restricting access to certain stages in the application lifecycle such as testing and production. Including a method of notification and approval that a new release is moving to a particular location should be included in your release strategy if you are highly regulated.  

## Release Coordination and Auditing {#heading-release}
Tracking and coordinating activities across both automated and manual steps in the deployment process is needed for a clear understanding of what occurred.  In addition, all activities manual or automated, should include an audit log showing who, when and where an update occurred. This level of information can be used for resolving an incident, and serves the purpose of Audit teams in certain highly regulated industry segments. 

## Inventory Tracking {#heading-inv}
The location of any artifact deployed to any location in an environment should be recorded. Understanding what is running in any environment is essential for maintaining a high level of service and quality. The inventory tracking should allow for viewing and comparing from the point of view of an artifact to all locations where the artifact is installed. From the environment view, the tracking should show all artifacts across all applications that are deployed to the environment. 

## Calendar and Scheduling {#heading-cal}
For larger enterprises where approvals and policies are needed for a release to occur, a calendar and scheduling process should be used. The calendar should be defined based on the environment and allow for collaboration between development teams, testing teams and production teams showing when a release is scheduled or requested. 

## Immutable Deployments {#heading-imm}
The continuous deployment process should be free from manual changes. This requires all release metadata to and logic to be maintained in an immutable state in which the deployment can be re-executed with the assurance that no manual touches occurred. 

## Deployment Models {#heading-deploy}
Canary deployments, blue/green deployments and rolling blue/green deployments are common methods of ‘testing’ a release to mainly production environments. The continuous deployment process should support the various deployment models required by production teams. 

## Push Vs. Pull {#heading-pvp}
In reality, all deployments are ‘push’ deployments. Even in a GitOps methodology, a push drives a pull request. In GitOps a deployment is initiated by committing a deployment definition (.yaml file) to an environment repository. All other best practices should be applied even to a Pull GitOps process. 

## Policies {#heading-pol}
Automation of the deployment may require specific guardrails depending on the environment. Policies should be defined to allow the automation process to incorporate standard ‘rules’ around any specific deployment that align with the organizational culture. 