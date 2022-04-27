
---
title: "Lifecycle"
linkTitle: "Lifecycle"
weight: 5
description: >
  Best practices for managing the lifecycle of your software supply chain.
---

We often make the mistake of thinking about software development as a linear process with a start and an end: gather some requirements, write some code, ship it, move onto something else. In reality, we are building an asset and the value of that asset is intrinsically linked to its ongoing viability across the lifecycle of the product. We must always think in terms of a circular process of iterative improvement and maintenance as part of our Continuous Delivery process. Software left untouched, starts to rot. The business environment changes, the global marketplace changes, regulations change, new market segments open, so requirements change and our software must be updated in response.

Now consider this in the context of the software supply chain. The same is true of all of your dependencies, and of your customer's products in turn. Every entry in your SBOM is a product with a lifecycle and your product is an entry in someone else's SBOM. As a result, as soon as you release a version of your product, it is becoming stale because the dependencies it relies upon are changing. Many of these changes will just represent minor bug fixes or new features that don't impact you directly, but many will be security fixes for active vulnerabilities, or breaking changes to APIs you rely upon, caused by changing demands upon these products.

First and foremost, you must always ensure that you use explicitly declared versions of every dependency, so that your SBOM remains consistent for a given release. You must also version each component and API in your product so that you are able to introduce change over time without impacting your customers negatively. If you reference a dependency by 'latest' rather than an explicit version, you may experience random breaking changes in production if those dependencies are dynamically loaded.

Now consider the forces at work across the supply chain. All of your dependencies are either slowly evolving in response to external stimuli, or they have been abandoned and are becoming stale. You must have a strategy and roadmap for updating your system to align to the changes coming from upstream, which involves maintaining your SBOM, enhancing your code to adapt to breaking changes and running your build pipelines regularly to check for unanticipated external factors that break the system.

Beyond this, you must also maintain your own code in response to changing requirements and urgent events such as security issues.

All this has an impact upon your customers. You are free to publish a new release at any time, but your customers may not be able to change their environments at the same pace that you can. In the ideal world, it would be Continuous Delivery all the way down, with everyone updating every few hours in response to changing pressures. In practice, however, there is significant latency across the supply chain and this can lead to tension in the system, and even fracture under some circumstances. If your customers are slower than you to adapt to change then you may need to be able to support multiple versions of your product in production simultaneously, but this quickly increases your overheads and leaves you potentially exposed when change is triggered by security concerns. If you are slower to adapt than your dependencies, you may find that support for key components is withdrawn before you are ready and you end up in a state where you can no longer build your product without major remedial actions.

It is essential to recognize this pattern of waves of change that ripple up and down the supply chain and invest in your Continuous Delivery process to mitigate the impact upon your part of the process.