
---
title: "Version Control"
linkTitle: "Version Control"
weight: 3
description: >
  Organize and manage changes to your software code, configuration, and other related versionable content.
---


- Definition
- Why Version Control 
- Types of Version Control

# Definition
Version control is the practice tracking and managing changes to the files that make up a software system.  The types of files can include source code, build information, configuration files, or any other file necessary for the assembling or running of a software system.

# Why Version Control

The primary purpose of version control is to track changes to files in your system over time in order to ensure the best-practice principles of <b>reproducibility</b> and <b>traceability</b> of your software.  

- <b>Reproducibility</b> is knowing you can go back in history to any moment in your software's development life cycle and have all the information necessary to recreate your software as it existed at a particular point in time.  

- <b>Traceability</b> means that for any existing deployment of a software system, all of the necessary information about that system's provenance is known.  Having traceability allows you to compare what is in place to what should be in place.

Practically speaking, without the use of version control any kind of legitimate automation to enable continuous integration or continues deployment is impossible.

# Types of Version Control

There are numerous types of version control, though only two that are truly appropriate for production software.

- <b>Centralized System:</b> All files are managed by a single service, including any history of changes, and the service tracks status of in-progress efforts. Access management lists of contributors are also controlled by the service.  Examples of centralized version control systems include Subversion or Perforce.

- <b>Distributed System:</b> While there is usually a primary version of a given project, development against that project is done by making a complete copy, or clone, of the whole project into a new environment.  This includes the full history of changes up to that point.  Each copy, or clone, of a project can also maintain it's own list of contributors indepently.  Examples of distributed version control systems include Mercurial and Git.
