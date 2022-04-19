# Design Document

## Augur
### Overview
(Type an overview of the our requirements/project and the diagrams included)

<br>

### Activity Diagram: Dependency Checker
![diagram](./diagrams/augur_activity_diagram.png)
<this is how you insert a picture into the md>

### Description
(Type a description for the diagram above)

<br>

### Diagram #2...
(Should probably include a diagram for the augur auto installer)
### Description

<br>

## Augur View
### Overview
This part of the project is about configuring the Augur_view after the Augur has been installed. The first diagram is the activity diagram of the process of configuring the Augur_view.

<br>

### Augur View Activity Diagram
![diagram](./diagrams/AugurViewActivityDiagram.drawio.png)

### Description:
This is the activity diagram for configuring the Augur_view. The activity will go through and check to see if Apache or NGINX is installed on the system and if it is, it will finish setting up the needed things before configuring the proxy for either Apache or NGINX.

<br>
  
### Diagram #2...
![diagram](./diagrams/augur_view_state_diagram.png)
### Description
This state diagram shows the flow if the scripts involved in installing and setting up the Augur View. It checks if the machine is on a server or not, and if it is then it will install as system service under systemd and proxy it through the web service. Then it will set up the virutal environment, checks if requirements and packages are installed and then it will run the app.
<br>

## Helpful information
### Various Diagrams
Most applicable to our project:
* Sequence Diagram
* State Diagram
* Activity Diagram

Other diagrams:
* Class Diagram
* ER Diagram
* Use Case
