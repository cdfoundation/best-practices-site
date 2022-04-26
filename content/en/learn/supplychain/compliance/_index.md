
---
title: "Regulatory Compliance"
linkTitle: "Regulatory Compliance"
weight: 7
description: >
  Best practices for ensuring compliance in your software supply chain.
---

In many cases, you may be operating in an environment that requires that you conform to predefined standards of compliance to corporate and/or government regulation.

In a pattern similar to that discussed in licensing, you will therefore have to inspect all inherited dependencies in your SBOM to confirm that you are compliant. An example of this would be the International Traffic in Arms regulations (ITAR) which restrict and control the export of defense and military related technologies and covers certain classes of software asset that may not be exported to some countries. In a similar manner, it is therefore necessary to include a step in the build pipeline that scans for non-compliant articles. This usually requires a combination of text searches and centrally managed, policy-driven lookup tables.

Compliance always implies external audit, so your pipeline steps must produce audited output that can be preserved for the lifetime of the product and presented to internal and external audiences for validation. It should be assumed that this data may at any point become required as part of a legal defense, so forensic cleanliness should be observed at all times, generating immutable records with appropriate levels of tamper-proofing and non-repudiation built in.