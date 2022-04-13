# Improve Installation Process of the Augur System

## Description 
A client wants to set up a new instance of Augur.  This process will involve the installation of the Augur system and the creation of a local database to store the repositories.  Using scripts, the installation should be more efficient and less stressful by detecting dependencies, installing dependencies, and loading default values for some parts of the Augur install.

## Triggers 
A client clones the Augur repository at this [link](http://github.com/chaoss/augur) and begins the installation process documented [here](https://oss-augur.readthedocs.io/en/main/index.html).

## Actors 
* Client
* Augur Community

## Preconditions 
* Clone of Augur Repository
* Ubuntu OS
* Some Technical Knowledge

## Main Success Scenario
The client successfully installs the Augur system using the provided documentation and new scripts.

## Alternate Success Scenarios 
The client successfully installs the Augur system using the provided documentation and new scripts with the help of the Augur community.

## Failed End Condition 
The client fails to install the Augur system with the provided documentation and additional help from the community.

## Functional Requirements
1. Available Augur repository.
2. Available installation documentation.
3. Dependencies will be checked before running the makefile.
4. Missing dependencies will be installed (possible feature).
5. Installation script will set up a default version of the Augur system.
6. Makefile will have options for default values in some fields.
7. A single installation script will install the Augur system in one go.

## Non-Functional Requirements
1. Installation process should be stress-free.
2. Documentation should be thorough and include common errors.
3. Additional resources should be readily available in the documentation.
4. Installation scripts should not feel unnecessary.
5. Installation scripts should be useful for beginners.

## Use Case Diagram
![Use Case Diagrams](/Sprint1%20Documentation/augur_use-case-diagram.png "use-case-diagram_augur.png")

## Dependent Use Cases
NONE
