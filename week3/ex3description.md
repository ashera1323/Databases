### NARRATIVE: 
A company keeps track of computer systems in its offices. Each computer has a unique serial number, 
a processor, the information about the cost price and the date it was made. 
Computers can be either laptops or desktop computers. 
Laptops can be carried around through offices. Each laptop can have different brand, weight, screen size and colour. 
Desktop computers have different options for changeable components. 
A single desktop computer can have many components including different types of memories, sound and video cards. 
Also there are other components such as a printer, docker etc. Each component has its unique serial ID, a producer and a cost price. 
Memories can be of internal or external type, different capacities and volatile or non-volatile. 
Sound cards have their specific name and brand. Video cards have their name and brand also. 
Laptops use different memories but can not interact with other components. Some components are able to connect to the software which supports their type. 
Each office computer has an operating system installed. Each operating system has name (Windows, Linux, Mac) and 
edition(7, 8, 10, Debian, Ubuntu, Sierra, Mojave etc.). 
There are many types of software which can be installed on office computers. Each type of software has its unique license number, name and version.
Operating system is a type of software. 
When equipping the offices, company can buy computers with additional accessories. 
Accessories include keyboards, monitors, mice and other, such as mouse mats, headphones etc. 
Each accessory has its unique accessory serial number, cost price and Brand. 
Keyboards can different by the number of buttons on them and wired or wirless. Mice has same differences as keyboards.
Monitors differ in screen sizes.  

### ENTITY TYPES: 
- COMPUTER (Serial number, Processor, Cost, Realised date)
- LAPTOP (Brand, Weight, Display size, Color)
- DESKTOP
- COMPONENT (Serial Id, Producer, Cost)
- MEMORY (Type, Capacity, Volatileness)
- SOUND CARD (Name, Brand)
- VIDEO CARD (Name, Brand)
- SOFTWARE (License no, Name, Version)
- OPERATING SYSTEM (Name, Edition)
- ACCESSORY (Serial nunber, Cost, Brand)
- KEYBOARD (Numb of buttoms, Wire/Wireless)
- MONITOR (Display size)
- MOUSE (Numb of buttoms, Wire/Wireless) 

### RELATIONSHIP TYPES: 
#### OPTIONS 
This is a relationship type which relates DESKTOP and COMPONENT entity types. 
A single desktop computer can have many components but a single component can 
belong to only one desktop. This relationship type's cardinality ratio is (1:N). 
#### SUPPORTS (Removable) 
SUPPORTS relationship type has an attribute Removable with a domain set {Yes, No} 
which states if the component can function properly without particular software 
application. This relationship type relates SOFTWARE and COMPONENT entity types. 
A single component can be supported by different software applications and an 
application can support different components. Cardinality ratio is (M:N) 
#### INSTALLED (Date) 
This relationship type keeps record of which software is 
installed on which computer on which Date. On a single computer different types 
of software can be installed. Also, a single software can be installed on many 
computers. Cardinality is (M:N). 
#### INSTALLED OS (Reason) 
This relationship type relates COMPUTER with the 
OPERATING_ SYSTEM which is installed. We keep track of the reason a new software 
is installed. Computer must have only one operating system and a single operating
system can be installed on many computers. COMPUTER has a total participation 
constraint for this relationship type and the cardinality is (N:1). 
#### SOLD WITH (Warranty) 
This relationship type relates COMPUTER and ACCESSORY 
entity types. It has an Warranty attribute which states for long the warranty is vaild. 
For accessory to end up in company, it needs to be sold with a computer so ACCESSORY 
has a total participation constraint for this relationship type. With a single computer 
many accessories can be sold, and an accessory can be sold with only one computer. 
Cardinality ratio is (1:N). 


