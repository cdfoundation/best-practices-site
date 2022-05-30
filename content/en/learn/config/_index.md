---
title: "Configuration management"
linkTitle: "Configuration management"
weight: 9
description: >
  Automating configuration changes for consistency, auditability, and
  reliability
---


- [Why Configuration Management](#heading-wcm)
  - Associated DORA capabilities
- [Definition](#heading-def)
- [Best practices](#heading-bp)

# Why Configuration Management {#heading-wcm}
Configuration Management maintains a record of the state of software and runtime environments with changes overtime. Configuration management tracks the many attributes and conditions of how software is assembled, how environments are defined, and records updates allowing systems to be consistently maintained by presenting a history of state changes.  

# Definition {#heading-def}
Configuration management is the task of tracking, reporting and controlling changes in software and IT infrastructures.   

# Description and Scope {#heading-das}
Configuration management has a wide scope tying together changes in software and infrastructure updates, managing external packages, and tracking microservices across clusters. 

Configuration management addresses changes to both software and infrastructure. In both traditional and cloud native environments, the understanding of how artifacts are assembled and infrastructures are defined provide critical information to site reliability engineers and operation teams for maintaining required service levels. 

Concepts in configuration management began as Software Configuration Management (SCM) or ‘Change Management.’ In traditional development, SCM is performed at build time during the CI build step. Version control tools are used to manage SCM, tracking source code changes with revision history and driving what is included in the software build step. It is at this point where decisions are made as to what versions of source code, transitive dependencies, packages and libraries are used to create an artifact. Changes are tracked via Bill of Material reports, Difference Reports and Version Control revision history. 

The use of library management solutions for scanning code and managing transitive dependencies became an essential configuration management step as developers began incorporating more external open source libraries into their software. Library management is used to track the configuration of these external libraries (packages), perform security management and license compliance of open source libraries, and pull any dependencies needed to compile code. Even in a cloud native architecture, library management is critical for building compliant container images. 

Similarly, Infrastructure configuration management tracks changes applied to servers, VMs and clusters. The movement of the IT Infrastructure Library (ITIL) drove the adoption of centralizing IT data in a Configuration Management Database (CMDB), a central store of information about the overall IT environment such as components that are used to deliver and run IT services with asset relationships. The adoption of CMDBs were impeded by the need to statically define configuration updates and changes making the CMDB quickly out of date. This led to the creation of a ‘service catalog’ which performs service discovery and ‘collects’ information versus a manual collection process after a change had been made. However, service catalogs generally track production environments, and not development and test. 

Configuration management became a reactive step to updates instead of proactive. A better method was required. This led to the ‘configuration as code’ and ‘state’ management movement. Tools like Chef and Puppet were created to define a particular environment ‘state’ driven by a ‘manifest.’ The ‘manifest’ defined the ‘state’ and all corresponding environments were automatically updated to that state. Changes in the configuration could be tracked by the differences in the manifest. In essence, this is the core of the GitOps practice where a deployment .yaml serves as the manifest and the GitOps operator manages the ‘state.’ The manifest is configuration as code. 

Microservices adds a new layer of configuration challenges. Because each are small functions and independently deployed, the traditional CI practices of compiling and linking code into a static binary is lost. For this reason, new methods of tracking microservices, their usage, ownership, relationships, inventory, key values and versions across clusters are required. 

Lessons from the past instruct us to begin automating the configuration management and change tracking of the full IT stack. Adding automated configuration management into the CD pipeline will become increasingly important as companies decompose applications into hundreds of independent functions running across dozens of clusters. 

# Best Practices {#heading-bp}
## Dependency Management
Core to configuration management is understanding the relationships between objects. The ability to easily see relationships between artifacts, objects and environments is essential. Dependency management enables the view of the relationships from an artifact to a version of an application, from application version to the artifacts that compose it and from an environment to the application versions that run in the environment. 
## Library Management
Included in your software build process or container image build is the need for defining transitive dependencies. This step is needed to identify vulnerabilities, licenses usage and policy conformance in open source libraries on which your software depends.  
## Impact Analysis
Understanding the impact a single source code change has on the consuming applications is critical in understanding the risk level of an update. In a cloud native environment, the impact of a microservice update is only exposed at run-time. The ability to view the impact or blast radius prior to a release will minimize the runtime incidents in both monolithic and microservice architectures. In addition, when changing the infrastructure, a clear understanding of the potential risk of an update is needed. 
## Variables Management
Variables relate to how the binaries, containers and runtime environments are configured. Whether you are running in a traditional server based environment or cloud native environment, environment variables need to be managed. The same artifact or application can execute differently depending on these variables. Key value pairs and configuration maps should be versioned based on the environment. This data should be stored in a central location such as a catalog or configuration server. Comparison of key values between environments is needed for debugging purposes. 
## Centralized Configuration Data
Configuration data should be stored and managed in a central location. Querying the centralized configuration metadata provides critical insights into what has occurred, or what may occur supporting the analysis of impacts and exposing potential problems before an update. As we develop machine learning, a centralized data store has the potential to predict the risk of a change.
## Configuration Reports
Configuration reporting should include comparison reports, relationship reports and configuration changes with an audit log. The audit log should show details such as when, why, what and who drove the changes over time. Difference or ‘comparison’ reports are needed to expose precisely what was updated and how two environments differ or two application versions differ. The difference detail is essential in maintaining site reliability and minimizing incidents. 
## Domain Driven Design (DDD) and Service-oriented Architecture (SOA)
While not apparent, there are particular configuration requirements for a Service Oriented Architecture (SOA) that can significantly simplify the change management process. Minimizing the sprawl of services across environments can reduce complexities in tracking changes and improve overall reuse of services. Domain Drive Design (DDD) has been a method for defining an SOA and is critical for organizing reusable services. DDD should be incorporated into the configuration management strategy to reduce redundancy and improve quality. 