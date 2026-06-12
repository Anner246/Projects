# Mapping Police Violence in the US

## Overview

This project was completed over the course of two weeks as the final project for an INST course at the University of Maryland, College Park. We were given the task of selecting a flat-file dataset and designing a fully normalized relational database from it. I chose a dataset containing police incidents across the United States.

This was my first time using SQL outside of a very simple introductory course I took at Montgomery College a year prior. We had to come up with a database outline based on the information present in the Excel file and construct tables with appropriate primary and foreign keys.

After that, we had to clean and standardize the data in Excel before importing it into MySQL. We then had to create example views and queries to submit alongside the database backup and a written report about our experience throughout the project.

The minimum requirement was seven tables with fifteen rows of sample data per table. I had been doing really well in the course up until then, and I wanted to really challenge myself. I wanted something that I could use to show future employers that I could handle real-world applications and workloads, so I made the decision to include all of the data in the file: more than 14,000 rows.

## Learning Expierence

This database is not perfectly accurate; however, I still chose to include it here for a few reasons. There were a couple of mistakes I made along the way due to inexperience. Despite that, the end result is functional and intuitive. This project taught me a lot that I would not have learned by simply fulfilling the minimum requirements.

The hardest part was cleaning and transforming a large amount of inconsistent real-world data. I spent a significant amount of time learning Excel, Power Query, lookup functions, CSV formatting, and methods for validating imported data. The project taught me the importance of attention to detail and the amount of work required before data is ready for analysis.

I was able to correct almost all of the mistakes I made during the process, except for two. To normalize the database, I created bridge tables such as IncidentAgency and IncidentVictim to support many-to-many relationships. While creating the sample views and queries, I encountered an issue.

Because the original dataset required extensive duplicate removal and transformation through Power Query, non-unique text fields may have resulted in some logical ID assignments pointing to the first matching record instead of the most specific match. This caused key drift, where some rows became logically misaligned.

If I were to revisit this project, I would rebuild the bridge table mappings using composite keys such as:

Agency Name + State + County
Victim Name + Age + Gender + Race

Although the database could be improved, it remains fully functional for the submitted analyses and demonstrates my ability to design relational databases, normalize data, clean large datasets, and solve real-world data integration problems.

Looking back, I am confident that I could complete the project much more efficiently and with a stronger ETL process.
