# FOSS4G Paper Review (9/9/2019)
### Minghini, Brovelli, & Frassinelli: [**An open source approach for the intrinsic assessment of the temporal accuracy, up-to-dateness and lineage of OpenStreetMap**](https://www.int-arch-photogramm-remote-sens-spatial-inf-sci.net/XLII-4-W8/147/2018/isprs-archives-XLII-4-W8-147-2018.pdf)
Minghini, Brovelli, and Frassinelli employ a robust technique of assessing OpenStreetMap (OSM) data quality using an intrinsic methodology that evaluates OSM’s data quality (e.g. positional accuracy, “up-to-dateness”, etc.) with the OSM dataset as the basis of comparison. The authors argue that such an approach is not paid as much attention as extrinsic methodologies (i.e. those that use external datasets as the basis of comparison) in existing literature on OSM quality assessment. Furthermore, they cite studies conducted in specific regions where OSM data quality was found to be superior to external governmental datasets, thus presenting a challenge to the effectiveness of extrinsic approaches. The authors examine OSM data in Dar es Salaam, Tanzania, a city that has been subject to numerous humanitarian mapping efforts as a result of the significant presence of informal settlements and vulnerability to flooding. Dar es Salaam is consequently one of the most densely mapped areas in the world on OSM.

The authors notice that node density increases when moving from the periphery to the city center, which they argue serves as a proxy for higher quality data (more nodes = better quality). This occurs as a result of more OSM contributors who update data in the city center on a more frequent basis. Using an open source platform such as OSM to conduct this study is necessary, particularly given the ubiquity of external dataset comparisons. Because the data is crowdsourced and made publicly available, it is not subject to the proprietary interests of larger organizations (i.e. governments and corporations). The data originates from individuals, rather than an organization that likely lacks the same degree of local knowledge.

# Lab #1 - Models of Urban Structure in QGIS (9/12/2019)
### Distance & Direction from Central Business District (CBD) Model
This week, we constructed a model in QGIS to illustrate Homer Hoyt's model of urban structure. The model can be downloaded [**here**](https://marcovg.github.io/DistanceAndDirectionFromPoint.model3). This algorithm calculates the distance (in meters) and direction (in degrees) of a set of input features from the mean coordinates of the centroids of a user-specified feature class. This algorithm could theoretically be applied if the user is seeking to analyze how distance and direction from a "central business district" affect trends and patterns across space in an urban environment.

# Lab #2 - QGIS Modelling (9/19/2019)
### Manchester, NH Case Study
I updated [**the model**](https://marcovg.github.io/DistanceAndDirectionFromPoint.model3) this week to include a SQL Query that calculates the distance field, in place of a Field Calculator operation. The new model takes a shapefile (of any geometry) as the central business district, calculates the centroid, and identifies each tract's geodesic distance (in meters) and direction (in degrees) from the city center. Sample data to demonstrate the model's applicability were drawn from the U.S. Census FactFinder (2017 ACS 5-Year Estimates) and joined to census tracts.

Open source GIS was used throughout this lab and demonstrates Rey's (2009) assertion that open GIS presents opportunities for "user-inspired innovation in research methods" (p. 205). Data Plotly, a third-party plugin for QGIS, is an example of GIS as "toolmaking" as described by Wright et. al. (1997), in which geographic concepts and theory can be applied through tools that can connect to the broader problems being solved / questions being asked (e.g. identifying clusters of high/low rent in particular radii / directions from the central city, applying Hoyt's model). Though the census data we obtained is openly available for public use, the data themselves aren't by definition "open source." Regardless, these estimates from the ACS are still useful for demonstrating the applicability of open source GIS tools. In this way, GIS functions as both a science and a tool because the tool and the "problem" being solved become inseperabale from one another (Wright et. al., 1997, p. 356).
#### Median Gross Rent 
![Manchester, NH Median Gross Rent](https://marcovg.github.io/ManchesterRent.png)
[**This scatter plot**](https://marcovg.github.io/ManchesterDistanceRent.html) shows median gross rent in Manchester tracts by distance from downtown, and [**this polar plot**](https://marcovg.github.io/ManchesterDirectionRent.html) shows the same measure by direction of the tract from downtown. The highest rents in the area are in Bedford (to the southwest), Hooksett (to the north), and Londonderry (to the southeast). Downtown Manchester, along with rural towns that aren't along the Merrimack River (Auburn to the east, Goffstown to the west) have the lowest median gross rent. These suburban tracts tend to be located between 6,000m and 9,000m (3.7mi to 5.6mi) from the city center and are oriented to the north and south.
#### Percent Hispanic
![Manchester, NH Percent Hispanic](https://marcovg.github.io/ManchesterHispanic.png)
[**This scatter plot**](https://marcovg.github.io/ManchesterDistanceHispanic.html) shows the percentage of the population identifying as Hispanic in Manchester tracts by distance from downtown, and [**this polar plot**](https://marcovg.github.io/ManchesterDirectionHispanic.html) shows the same measure by direction of the tract from downtown. There is no evident pattern of Hispanic distribution by distance, though some concentrations can be found in particular directions. The city's largest concentrations of Hispanic populations lie to the northeast (Manchester's North End neighborhood), southwest (Piscataquog neighborhood), and southeast (Hallsville & Kalivas Union neighborhoods). The outlying suburbs, in contrast, have the lowest percentage of Hispanics in the metro area.

# Lab #3 - Global Digital Elevation Models (9/26/2019)
### ASTER Global DEMs of Mt. Kilimanjaro (Made with SAGA)
During this week's lab, we worked with Digital Elevation Models (DEMs) in SAGA GIS to construct various terrain and hydrological models. The following maps showcase SAGA's various analytical tools using an ASTER DEM for the area around Mt. Kilimanjaro in Tanzania.
#### Projected ASTER DEM
![ASTER DEM](https://marcovg.github.io/Lab3_ProjectedAsterDEM.png)
This is a map of the ASTER DEM, projected to Zone 37S UTM. The map shows elevation and units are in meters.
#### Analytical Hillshading
![Analytical Hillshading](https://marcovg.github.io/Lab3_Hillshade225a30h.png)
This is a map simulating light reflection based off of the DEM elevation map. Units are in radians, and the parameters for this hillshade are: Azimuth=225, Height=30, Exaggeration=1.
#### Sink Route
![Sink Route](https://marcovg.github.io/Lab3_SinkRoute.png)
This map indicates the direction in which water flows when it encounters a "sink" in the terrain.
#### Sink Removal
![Sink Removal](https://marcovg.github.io/Lab3_SinkRemoval.png)
This map constructs a new elevation model that reflects a scenario in which terrain "sinks" are filled, which assists us with the forthcoming hydrological analyses.
#### Flow Accumulation
![Flow Accumulation](https://marcovg.github.io/Lab3_FlowAccumulation.png)
This map indicates the number of cells that contribute to the flow of water in a given cell (e.g. value of 1 means no cells contribute, while a value of 100 means 99 other cells contribute). This allows us to identify streams.
#### Channel Network
![Channel Network](https://marcovg.github.io/Lab3_ChannelNetwork.png)
This map shows the stream networks in the area of Mt. Kilimanjaro. The output produces a vector and raster version, though this map only shows the vector output atop a hillshade (Azimuth=315, Heihgt=45, Exaggeration=1).

# Lab #4 - Model Error Propagation and Uncertainty (10/3/2019)
### Comparing ASTER and SRTM Data Quality in Amboró National Park, Bolivia
During this week's lab, we learned how to develop batch scripts to run multiple SAGA tools through the command line in a single instance. The maps below show the NUM (number file) returns for both the SRTM and ASTER datasets in Amboró National Park in Bolivia. It's evident that the ASTER DEM has more consistent data quality than the SRTM DEM. In higher elevation areas of the park, the SRTM dataset makes use of ASTER granules to construct the terrain. Throughout almost the entire study area, the ASTER dataset constructs terrain using GDEM v3 (generally four to six scenes). The inconsistencies in the SRTM dataset are more common in mountainous regions, as evinced by a global assessment of SRTM conducted by Rodríguez, Morris, and Belz (2006).

References:

[**ASTER NUM Documentation**](https://lpdaac.usgs.gov/products/astgtmv003/)

[**SRTM NUM Documentation**](https://lpdaac.usgs.gov/products/srtmgl1nv003/)

[**Rodríguez, Morris, & Belz SRTM Assessment**](https://www.ingentaconnect.com/contentone/asprs/pers/2006/00000072/00000003/art00002?crawler=true&mimetype=application/pdf)

#### SRTM NUM Return
![SRTM NUM Return](https://marcovg.github.io/srtm_num.png)
#### ASTER NUM Return
![ASTER NUM Return](https://marcovg.github.io/aster_num.png)

The following maps compare the outputs at each step of the hydrological analysis between the ASTER and SRTM datasets (ASTER maps are placed above SRTM maps). These outputs were produced using batch scripts ([**ASTER**](https://marcovg.github.io/mosaic_asterhydro.bat), [**SRTM**](https://marcovg.github.io/mosaic_srtmhydro.bat)) running SAGA GIS 6.2 in the Windows Command Prompt:

#### ASTER vs. SRTM - Analytical Hillshade
![ASTER Hillshade](https://marcovg.github.io/Lab4_aster_analyticalhillshading.png)
![SRTM Hillshade](https://marcovg.github.io/Lab4_srtm_analyticalhillshading.png)
There is no discernible difference between the analytical hillshade outputs for ASTER and SRTM.

#### ASTER vs. SRTM - Sink Routes
![ASTER Sink Routes](https://marcovg.github.io/Lab4_aster_sinkroute.png)
![SRTM Sink Routes](https://marcovg.github.io/Lab4_srtm_sinkroute.png)'
In the lower elevation areas outside of Amboró National Park, the sink route function return for the SRTM dataset indicates significant variability in flow direction for streams encountering sinks (particularly on the eastern edge of the study area). The ASTER dataset, on the other hand, does not show the same amount of sink route variability in that same region.

#### ASTER vs. SRTM - Sink-Filled DEMs
![ASTER Sink-Filled DEMs](https://marcovg.github.io/Lab4_aster_filledsinks.png)
![SRTM Sink-Filled DEMs](https://marcovg.github.io/Lab4_srtm_filledsinks.png)
As is generally the case, the differences between the sink-filled DEMs across the two datasets are minor and barely perceptible (unless being viewed at a larger scale, further zoomed in).

#### ASTER vs. SRTM - Flow Accumulation
![ASTER Flow Accumulation](https://marcovg.github.io/Lab4_aster_flowaccumulation.png)
![SRTM Flow Accumulation](https://marcovg.github.io/Lab4_srtm_flowaccumulation.png)
The two datasets generally agree on flow accumulation values; however, as was the case with the sink route output, there is a sparse number of cells on the eastern edge of the study region in the SRTM dataset.

#### ASTER vs. SRTM - Channel Network
![ASTER Channel Network](https://marcovg.github.io/Lab4_aster_channelnetwork.png)
![SRTM Channel Network](https://marcovg.github.io/Lab4_srtm_channelnetwork.png)
The most noticable difference between the two datasets is evident in this map, where the SRTM fails to capture channel networks on the eastern edge of the study region.

# Lab #6 - Resilience Academy in Dar es Salaam (10/24/2019)
### Informal Settlement Detection using OpenStreetMap Data
For this lab, [**Sarah Haedrich**](https://sarahhaedrich.github.io/) and I made use of openly available data from [**OpenStreetMap**](https://www.openstreetmap.org/#map=11/-6.8163/39.1601) and [Resilience Academy](https://resilienceacademy.ac.tz/) to map the number of schools in each subward of Dar es Salaam, Tanzania. Our research sought to answer the following question: **where is there uneven access to educational resources in Dar es Salaam?** Visualizing these data could also help with identifying the presence of informal settlements within the city. Since the OpenStreetMap project allows contributors to create features using any tag or data type, one of our challenges was to account for schools listed both as points and polygons. We also formulated a method for handling duplicate and blank records, as described below (the SQL code used to manipulate the data within our PostGIS database can be found [**here**](https://marcovg.github.io/DSMSchools.sql)):

We first made use of a batch script (created by Prof. Joe Holler) that converted files from [**Planet OSM**](https://planet.openstreetmap.org/) into shapefiles that we could upload to our PostGIS database. To select the data we would analyze, we filtered to only include nodes and polygons where amenity="school" (that is, records in the point layer and polygon layer where the variable "amenity" had the value "school"). To identify duplicate schools, we wrote code that identified school polygons that intersected school points (i.e. where amenity="school" was a tag-value combo in both the point and polygon):

```sql
-- Select all points and polygons representing schools (where amenity="school")
ALTER TABLE planet_osm_polygon ADD COLUMN intersectsPoint Interger
UPDATE planet_osm_polygon
SET intersectsPoint = 1
FROM planet_osm_point
WHERE amenity = 'school'AND st_intersect(planet_osm_polygon.way, planet_osm_point.way)

-- Select school points intersecting school polygons
SELECT * FROM planet_osm_polygon WHERE intersectsPoint = 1
```

For school polygons without intersecting school points, we wanted to include these in the analysis as well. To do this, we converted the polygons into centroids (also projecting the polygon to match the CRS of the point data):
```sql
-- Create centroids of school polygons intersecting points
SELECT osm_id, name, amenity, st_centroid(st_transform(way, 32727)), intersectsPoint
FROM planet_osm_polygon
WHERE amenity = 'school' and intersectpoint is NULL
```

We then merged (using UNION) the centroids of the school polygons with the school points (effectively adding additional records to the school points layer, in a new layer called "mergedSchools"):
```sql
-- Combine (union) school polygon centroids with school points (and convert to UTM 27S projection)
CREATE TABLE mergedSchools AS
SELECT osm_id, amenity, st_centroid FROM pointlessSchools2
UNION
SELECT osm_id, amenity, st_transform(way, 32727) FROM planet_osm_point
WHERE amenity = 'school'
```

At this point, we noticed that some of the schools in the "mergedSchools" layer have duplicate or blank names (the latter usually being the result of school buildings already atop school boundary areas). To merge duplicate schools, we first chose to filter out schools without any names (to avoid merging all schools with blank names):
```sql
-- Filtering out schools with blank names.
CREATE TABLE nonBlank_Schools AS
SELECT * FROM mergedSchools
WHERE name <> ""
```

After filtering out the blanks, we eliminated duplicate records (those with the same name) by identifying the centroid of the union of the duplicates (mid-point between each duplicate school point). The names were trimmed and converted to upper-case to account for any whitespace or uppercase/lowercase mismatching:
```sql
-- Group by school name (for schools with duplicate names).
CREATE TABLE groupedSchools AS
SELECT st_centroid(st_union(st_centroid)), trim(upper(name)) FROM nonBlank_Schools
GROUP BY trim(upper(name))
```

We then brought the blank schools back into the dataset:
```sql
-- To avoid merging all schools with blank names, blank-named schools are added in after merging duplicates.
CREATE TABLE remergedSchools AS
SELECT btrim AS name, st_centroid as geom FROM groupedSchools
UNION
SELECT name, st_centroid as geom FROM blankschools
```

Our next step involved counting the number of schools in each ward. In a new column, we assigned to each school the "fid" of the subward in which it is located:
```sql
-- Create new column for schools containing the ward the school is in.
UPDATE remergedSchools
SET ward = subwards.fid
FROM subwards
WHERE st_intersects(remergedSchools.geom, st_transform(subwards.geom, 32727))
```

Finally, the last step was to count the number of schools in each ward as follows:
```sql
-- Summing up the number of schools in each ward.
CREATE TABLE schoolWard as
SELECT ward, count(*) as schoolCount FROM remergedSchools
GROUP BY ward
```

The final map can be found [**here**](https://marcovg.github.io/dsmmap). It's immediately evident that subwards on the periphery of the city (in the northwest, southeast, and southwest) lack proximity to schools. Not until moving closer to the city center does the concentration of schools increase (though certain wards in the city center also lack proximity to schools). These data indicate that access to education is spatially uneven in Dar es Salaam.

# GIS Twitter Data Article (11/18/2019)
### Gu, Qian, and Chen: [**From Twitter to detector: Real-time traffic incident detection using social media data**](https://doi.org/10.1016/j.trc.2016.02.011)
In this article, the authors discuss how they use Twitter data to map traffic incidents in the Philadelphia and Pittsburgh metro areas. Arguing that sensor coverage is "sparse" and reporting to emergency response systems is "labor-intensive," the authors pursue an inductive research approach that takes advantage of data from Twitter's REST API, using natural language processing (NLP) algorithms. The authors use the following keywords to fetch tweets: "traffic, accident, road, avenue, car, bike, truck, driver, injured, congestion, slow, I-, PA-, US-, exit, mile, stop, -crazy, -hate, -!" where keywords with the "-" in front are keywords they want to exclude from the query. The research isn't reproducible, since running their query wouldn't get the same sample of tweets at a different point in time (the date the query was run isn't provided). However, the research is replicable in that they provide a detailed explanation of how they handled keywords using NLP techniques. R packages that could be used include rTweet, nlp, and wordnet (used to grab synonyms of the initial "seed words").

# Labs #7 & #8 - Investigating Malawi Vulnerability with GIS Models (10/31/2019 & 11/7/2019)
### Reproducing Malcolm et al.'s Multi-Criteria Vulnerability Analysis

# Lab #9 - Twitter Data Analysis with RStudio, PostGIS, and QGIS (11/14/2019)
### Twitter Analysis of Impeachment Proceedings

# Lab #10 - Analyzing Twittersphere Activity during Hurricane Dorian (11/21/2019)
### Spatial Hotspot Analysis: Hurricane Dorian vs. Baseline Twitter Activity for November
