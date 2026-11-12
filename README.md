# FailSafeIT

## Varför den uppfyller 1NF, 2NF och 3NF.
Designen uppfyller första normalformen eftersom varje kolumn endast innehåller ett värde per cell. Alla tabeller har även en primär nyckel. 

Andra normalformen uppfylls eftersom den redan uppfyller första normalformen. Alla icke-nycklar är beroende av primärnyckeln

Tredje normalformen innebär att tabellen uppfyller båda första och andra formen. Transitiva beroenden undviks genom att icke-nyckelkolumner inte är beroende av andra icke-nyckelkolumner. Kundens uppgifter lagras i en separat tabell, konsulter i en egen. De kopplas sedan ihop med uppdrags tabellen och främmande nycklar.


 
##  Sec: Om din databas nås via en publik webbapplikation, på vilket sätt skyddar du systemet så att en angripare inte kan skriva skadlig SQL-kod i ett inmatningsfält och radera hela din databas (SQL Injection)?

För att skydda mot SQL Injection använder man parametriserade frågor. Det innebär att SQL kommandots struktur separeras från användarens indata. Skadlig text tolkas aldrig då som körbar kod.

##Ops: Om FailSafe IT växer till tusentals kunder och miljontals uppdrag, vilken databasfunktion bör du implementera på tabellerna för att säkerställa att sökningar efter specifika organisationsnummer fortfarande går blixtsnabbt?

För att det fortfarande ska gå snabbt bör indexering användas. Det innebär att databasen kan hitta ett specifikt värde utan att behöva läsa igenom varje rad i tabeller. I mitt projekt används primärnycklar som i detta fall skapar ett unikt index vilket är ett clustered index
