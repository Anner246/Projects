USE mappingpoliceviolence;

-- View 1 --
DROP VIEW IF EXISTS victim_race_percentages;

CREATE VIEW victim_race_percentages AS
	SELECT race, COUNT(victim_id) AS victim_count,
		   CONCAT(ROUND(COUNT(victim_id) * 100.0 / (SELECT COUNT(victim_id) FROM victim), 2), "%") AS percentage
	FROM victim
	GROUP BY race
	ORDER BY victim_count DESC;

-- Query 1 --
SELECT race, victim_count, percentage FROM victim_race_percentages;


-- View 2 --
DROP VIEW IF EXISTS incidents_by_district_party;

CREATE VIEW incidents_by_district_party AS
	SELECT COALESCE (NULLIF(cd.congressperson_party, ''), 'Unknown') AS party,
		   COUNT(i.incident_id) AS incident_count,
           CONCAT(ROUND(COUNT(incident_id) * 100.0 / (SELECT COUNT(incident_id) FROM incident), 2), '%') AS percentage
	FROM incident i
    LEFT JOIN congressdistrict cd
		ON i.congress_id = cd.congress_id
	GROUP BY COALESCE (NULLIF(cd.congressperson_party, ''), 'Unknown')
    ORDER BY incident_count DESC;

-- Query 2 --
SELECT party, incident_count, percentage FROM incidents_by_district_party;


-- View 3 --
DROP VIEW IF EXISTS incident_officer_races_2024;

CREATE VIEW incident_officer_races_2024 AS
	SELECT o.race, COUNT(io.officer_id) AS officer_incidents,
		   CONCAT(
				ROUND(
					COUNT(io.officer_id) * 100.0 / 
						(SELECT COUNT(io2.officer_id)
                         FROM incidentofficer io2
                         JOIN incident i2
							ON io2.incident_id = i2.incident_id
						 WHERE YEAR (i2.incident_date) = 2024
                         ), 
					  2),
				   '%') AS percentage

	FROM incidentofficer io
    JOIN officer o
		ON io.officer_id = o.officer_id
	JOIN incident i
		ON io.incident_id = i.incident_id
	WHERE YEAR (i.incident_date) = 2024
	GROUP BY o.race
    ORDER BY officer_incidents DESC;

-- Query 3 --
SELECT race, officer_incidents, percentage FROM incident_officer_races_2024;


-- View 4 --
DROP VIEW IF EXISTS incidents_per_counties_in_texas;

CREATE VIEW incidents_per_counties_in_texas AS
	SELECT county, COUNT(i.incident_id) AS incident_count
	FROM Incident i
	JOIN CongressDistrict cd
		ON i.congress_id = cd.congress_id
	JOIN State s
		ON cd.state_id = s.state_id
	WHERE s.state_name = 'TX'
	GROUP BY county
	ORDER BY incident_count DESC;

-- Query 4 --
SELECT county, incident_count FROM incidents_per_counties_in_texas;


-- View 5 --
DROP VIEW IF EXISTS agency_incidents_2024;

CREATE VIEW agency_incidents_2024 AS
	SELECT a.agency_name, COUNT(ia.incident_id) AS incident_count
	FROM IncidentAgency ia
	JOIN Agency a
		ON ia.agency_id = a.agency_id
	JOIN Incident i
		ON ia.incident_id = i.incident_id
	WHERE YEAR(i.incident_date) = 2024
	GROUP BY a.agency_name
	ORDER BY incident_count DESC;

-- Query 5 --
SELECT agency_name, incident_count FROM agency_incidents_2024;