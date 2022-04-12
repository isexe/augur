## Improve Installation Process of the Augur System

## Description 
A client wants to setup a new instance of Augur.  This process will involve the stress-free installation of the Augur system and the creation of a local database to store the repositories on Ubuntu OS.

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
The client successfully installs the Augur system using the provided documentation.

## Alternate Success Scenarios 
The client successfully installs the Augur system using the provided documentation and with help from the Augur community.

## Failed End Condition 
The client fails to install the Augur system with the provided documentation and additional help from the community.

## Functional Requirements
1. Available Augur repository.
2. Available installation documentation.
3. Makefile will have options for default values in some fields.
4. Dependencies will be checked before running the makefile.
5. Missing dependencies will be installed (possible feature).

## Non-Functional Requirements
1. Installation process should be stress free.
2. Documentation should be thorough and include common errors.
3. Additional resources should be readily available in the documentation.

## Use Case Diagram
![Use Case Diagrams](/Sprint1%20Documentation/use-case-diagram_augur.png "use-case-diagram_augur.png")

## Dependent Use Cases
NONE
