
--______________________________________Report 1 No of incidents in each year in each state
SELECT count(f.Incident_ID) AS [Number of crimes],s.Population_Group_Description,c.Year_


FROM Hate_Crime_Incident_Fact f INNER JOIN State_Dim s

ON f.State_Id = s.State_Id

INNER JOIN  Calendar_Dim c

ON f.CalendarKey = c.CalendarKey

GROUP BY s.Population_Group_Description,c.Year_
ORDER BY c.Year_ DESC,s.Population_Group_Description

--_____________________________________________________
--Report 2 : No of incidents in all states in all years
SELECT f.Incident_ID AS Incident,s.State_Name


FROM Hate_Crime_Incident_Fact f 
INNER JOIN State_Dim s

ON f.State_Id = s.State_Id

--INNER JOIN  Calendar_Dim c

--ON f.CalendarKey = c.CalendarKey

--GROUP BY s.State_Name
--______________________________________________________________________________________________________
--__________Report 3: No of hate crimes against different races from 1991-2017
SELECT count(f.Incident_ID) AS [Number of crimes],r.Race_Name,c.Year_


FROM Hate_Crime_Incident_Fact f INNER JOIN Race_Dim r

ON r.Race_Id = f.Victim_Race_Id

INNER JOIN  Calendar_Dim c
ON f.CalendarKey = c.CalendarKey

GROUP BY r.Race_Name,c.Year_
ORDER BY c.Year_ DESC,r.Race_Name
--______________________________________________________________________________________________________
--__________Report 4: No of hate crimes against different races by other races
SELECT count(f.Incident_ID) AS [Number of crimes],r.Race_Name as VictimRace,
(select Race_Dim.Race_Name from Race_Dim where Race_Id = f.Offender_Race_Id ) as OffenderRace


FROM Hate_Crime_Incident_Fact f INNER JOIN Race_Dim r

ON r.Race_Id = f.Victim_Race_Id 

GROUP BY r.Race_Name,f.Offender_Race_Id
ORDER BY r.Race_Name
--______________________________________________________________________________________________________
--__________Report 5: No of hate crimes for particular crime type at different crime scenes
SELECT count(f.Incident_ID) AS [Number of crimes],ct.Crime_Type,cs.Crime_Scene_Type

FROM Hate_Crime_Incident_Fact f
INNER JOIN Crime_Type_Dim ct

ON ct.Crime_Type_ID = f.Crime_Type_ID

INNER JOIN  Crime_Scene_Type_Dim cs
ON f.Crime_Scene_ID = cs.Crime_Scene_ID

GROUP BY ct.Crime_Type,cs.Crime_Scene_Type
ORDER BY ct.Crime_Type DESC,cs.Crime_Scene_Type


