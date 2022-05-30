
---
title: "Security"
linkTitle: "Security"
weight: 8
description: >
  Best practices for securing your software supply chain.
---

Any software assets that your product depends upon can potentially be used to introduce vulnerabilities into your product, or to spread those vulnerabilities to your customers. It is critical therefore, to take appropriate action to mitigate this risk, otherwise you may potentially be held liable for damages caused to your customers as a result of a subsequent breach, or incur irreparable reputational damage to your product or business.

- You must be able to identify all software assets that your product depends upon, and be able to establish the ongoing provenance of each of these assets.

- You must have systems in place to allow you to identify and immediately act upon tampering attempts within your software supply chain.

- You must be able to secure the infrastructure that you use to create your product, detect and act upon attempts to subvert your build process by attackers.

- You should be able to provide strong assurances of the integrity of your build process as provenance to your customers.

The following are examples of potential attack vectors which must be secured against:

Individuals may attempt to deliberately introduce vulnerabilities directly into your source code. In the Open Source space, this may be in the form of adversarial pull requests containing malicious code hidden within feature submissions or bug fixes. In commercial software, this may take the form of insider attacks or revenge from disgruntled employees. Multiple peer reviews of code submissions should be used to mitigate this risk, with careful consideration for social engineering that undermines this people-process, such as sock-puppet review accounts.

Attackers may seek to inject code into your source by compromising your source code repository. This may be in the form of attacks upon outsourced service providers, permitting access to your codebase, or supply chain attacks upon the integrity of the software assets used to implement self-hosted source code repositories. You should be auditing all changes to the codebase and correlating these against known work-stream activities in order to identify and act upon unexpected changes.

By subverting your build infrastructure, it is possible for attackers to substitute alternate source code during your build process. Mitigating against this requires a chain of provenance that can be established independent from an individual build step to enable tampering to be detected. The security of your build process should receive similar investment to the security of your end product as one depends entirely upon the other.

A bait-and-switch attack can involve the introduction of an initially innocuous dependency which is then later replaced with a malicious payload, upstream of your build process. Under these circumstances, a one-off code review and dependency evaluation is insufficient to detect the attack. Instead, it is necessary to validate the provenance of the dependency during each build so that the substitution may be found as soon as it occurs.

Similarly, it can be possible to substitute assets that live in image repositories, post-build, but which are subsequently utilized for deployments. Thus, the item deployed is not the one built and tested. Mitigation requires the extension of your provenance system into your production deployment process, or to your customer's build and deployment process. The same attack can apply to third party mirror sites for common dependencies used dynamically during deployment.

Denial of service attacks can be employed by attackers by removing key dependencies from your upstream supply chain, or overloading network resources that provide access to these components. This risk can be mitigated by caching copies of these assets locally, but be aware that this brings with it all of the challenges associated with maintaining the validity of cached data, which can include other security vulnerabilities such as failure to detect and react in a timely manner to new vulnerabilities reported against existing, cached dependencies (zero-day CVEs etc.), or the use of cache-poisoning to inject vulnerabilities.

Static and dynamic security analysis tools can be used as part of the build process but it is important to recognize that these also form part of your software supply chain dependencies and are themselves also potentially vulnerable to attack. Meta-analysis currently shows that no single security analysis tool on the market provides comprehensive identification of all currently known vulnerabilities, so it is essential to adopt a defense-in-depth strategy, leveraging multiple, parallel solutions to maximize your chances of early identification of problems.

Be aware that corporate and state-level firewall solutions may deliberately substitute or inject changes into assets which are downloaded through these routes and subsequently consumed by build processes. The same may apply to the software assets that you supply to your customers.

It is particularly important to consider the security of infrastructure used to train ML models, since it is now practical to inject vulnerabilities into models which are mathematically hard to detect with analytical testing but which can be remotely enabled through the use of specific data injected as input to production systems through the front door.

Appropriate implementation of security best practice usually requires some degree of separation of concerns. If we consider the three aspects of 'maintaining the product codebase', 'maintaining the build and release governance process' and 'maintaining the audit trail', it is clear that anyone who has access to all three is empowered to subvert the process without detection. As such, it is advisable to limit the number of people who are required to have full visibility and access to all of these aspects of your continuous delivery process, and to ensure that additional audit processes exist to monitor changes that span all areas.

Consideration should be given to the SLSA specification for supply chain security which may be found at slsa.dev.