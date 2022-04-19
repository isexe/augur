# Design Document

## Augur

### Overview
This part of the project is about configuring Augur.  The first diagram illustrates the process of a client getting ready to set up Augur.  The second diagram illustrates the process of actually installing Augur using the new easy install script.

<br>

### Activity Diagram: Augur - Dependency Checker Script
![Augur Activity Diagram](./diagrams/augur_activity_diagram.png)

### Description
This activity diagram demonstrates the process of a client preparing for their Augur instance.  Firstly, they clone the Augur repo and set up the python virtual environment.  Afterward, they can use the dependency checker to detect inconsistencies with their services and those required for the Augur instance.  The script will install the missing services if the client decides to do so.  If not, they will be required to install the services themselves.  The client is now ready to begin the Augur installation.

<br>

### Sequence Diagram: Augur - Easy Install Script
![Augur Sequence Diagram](./diagrams/augur_sequence_diagram.png)
### Description
This sequence diagram demonstrates the process of a client installing Augur after the initial setup from the first diagram.  The client runs the easy install script with a few given parameters, then the script sets up the Augur configuration and installs the Augur instance.

<br>

## Augur View
### Overview
This part of the project is about configuring the Augur_view after the Augur has been installed. The first diagram is the activity diagram of the process of configuring the Augur_view.

<br>

### Augur View Activity Diagram
![Augur View Activity Diagram](./diagrams/AugurViewActivityDiagram.drawio.png)

### Description:
This is the activity diagram for configuring the Augur_view. The activity will go through and check to see if Apache or NGINX is installed on the system and if it is, it will finish setting up the needed things before configuring the proxy for either Apache or NGINX.

<br>
  
### Augur View State Machine Diagram
![Augur View Activity Diagram](./diagrams/augur_view_state_diagram.png)
### Description
This state diagram shows the flow if the scripts involved in installing and setting up the Augur View. It checks if the machine is on a server or not, and if it is then it will install as system service under systemd and proxy it through the web service. Then it will set up the virutal environment, checks if requirements and packages are installed and then it will run the app.