#SpringBoot #SpringMVC #SpringData #JpaRepository #H2 #JSP #Lombok #CRUD #IntelliJ

Cruise Logger - version SpringMVC

Czwarta wersja loggera rejs�w �eglarskich. Aplikacja umo�liwia wykonywanie operacji CRUD(zapisu/odczytu/aktualizacji/usuwania) na bazie danych H2.
W tym przypadku wykorzystano framework Spring(Boot + MVC + Data). Komunikacja z baz� danych odbywa si� za pomoc� interfejsu JpaRepository. Aplikacja poza podstawow� funkcjonalno�ci� pozwala na filtracj� danych w zale�no�ci od daty oraz ilo�ci przep�yni�tych mil (jako przyk�ad wykorzystania JpaRepo). Warstwa widoku wykorzystuje strony JSP z tagami JSTL. Do testowania aplikacji przewidziano generator losowych rejs�w umo�liwiaj�cy utworzenie przyk�adowych danych.


Fourth version of app that allows you to log your sailing cruises. Application provide CRUD operations (Create/Read/Update/Delete) on H2 database.
In this case the Spring (Boot + MVC + Data) was used. Communication with db is carried out using the JpaRepository interface.
Apart from the basic functionality, application allows to filter data depending on the date or sailed distance (as an example of using JpaRepo). View layer uses JSP pages with JSTL tags. For testing purposes there is random-cruise service that can create sample data.