#SpringBoot #SpringMVC #SpringData #JpaRepository #H2 #JSP #Lombok #CRUD #IntelliJ
---
Cruise Logger - version SpringMVC
---
Czwarta wersja loggera rejsów ¿eglarskich. Aplikacja umo¿liwia wykonywanie operacji CRUD(zapisu/odczytu/aktualizacji/usuwania) na bazie danych H2.
W tym przypadku wykorzystano framework Spring(Boot + MVC + Data). Komunikacja z baz¹ danych odbywa siê za pomoc¹ interfejsu JpaRepository. Aplikacja poza podstawow¹ funkcjonalnoœci¹ pozwala na filtracjê danych w zale¿noœci od daty oraz iloœci przep³yniêtych mil (jako przyk³ad wykorzystania JpaRepo). Warstwa widoku wykorzystuje strony JSP z tagami JSTL. Do testowania aplikacji przewidziano generator losowych rejsów umo¿liwiaj¹cy utworzenie przyk³adowych danych.

----------
Fourth version of app that allows you to log your sailing cruises. Application provide CRUD operations (Create/Read/Update/Delete) on H2 database.
In this case the Spring (Boot + MVC + Data) was used. Communication with db is carried out using the JpaRepository interface.
Apart from the basic functionality, application allows to filter data depending on the date or sailed distance (as an example of using JpaRepo). View layer uses JSP pages with JSTL tags. For testing purposes there is random-cruise service that can create sample data.
