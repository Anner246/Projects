# Mapping Police Violence in the US

## Overview

This project was done over the coure of 2 weeks. As my final project for an INST course at UMD College Park I had to pick an excel file containing raw infromation in the form of a flat table. I chose one dealing in police incidents occuring in the US.

This was my first time using SQL outside of a very simple introductory course I took at Montgomery College a year ago. We had to come up with a databse outline based on the information present in the excel file and construct tables with appropriate primary and foreign keys.

After which we would have to go through and clean the data in Excel before importing into MySQL. Then we had to come up with example views and queries to submit alongside the backup and a written report about our expierence throughout the project.

The minimum requirement was 7 tables with 15 rows of sample data per table. I had been doing really well in the course up until then and I wanted to really challenge myself. I wanted something that I could use to show future employers that I could handle real world applications and workloads. I made the decision to include all the data in the file, 14,000+ rows.

## Learning Expierence

This database is not perfectly accurate, however, I will choose to include it here for a few reasons. There were a couple mistakes I made along the way due to inexpierence. Despite that the end result is functional and intuitive. This project has tuaght me a lot that I would not have learned just fulfilling the minimum requirements.

I became very familiar with Excel, learning about power queries and lookup functions, how to save as comma seprated and double check with the notepad. I trained my to catch small details and fix any errors I found. By far the hardest part of this project was combing through and cleaning the data.

Almost all of the mistakes I made I was able to fix later on in the process save for two. To normalize the database I made bridge tables such as IncidentAgency and IncidentVictim, which were created to support many-to-many relationships. While creating the sample views and queries I encountered an issue.

Since the original data required extensive duplicate removal and transformation through power queries, non-unique text fields may have resulted in some logical ID assignments pointing to the first matching record instead of the most specific match.

Although the database maintains
