# FOSS4G Paper Review (9/9/2019)
### Minghini, Brovelli, & Frassinelli: [**An open source approach for the intrinsic assessment of the temporal accuracy, up-to-dateness and lineage of OpenStreetMap**](https://www.int-arch-photogramm-remote-sens-spatial-inf-sci.net/XLII-4-W8/147/2018/isprs-archives-XLII-4-W8-147-2018.pdf)
Minghini, Brovelli, and Frassinelli employ a robust technique of assessing OpenStreetMap (OSM) data quality using an intrinsic methodology that evaluates OSM’s data quality (e.g. positional accuracy, “up-to-dateness”, etc.) with the OSM dataset as the basis of comparison. The authors argue that such an approach is not paid as much attention as extrinsic methodologies (i.e. those that use external datasets as the basis of comparison) in existing literature on OSM quality assessment. Furthermore, they cite studies conducted in specific regions where OSM data quality was found to be superior to external governmental datasets, thus presenting a challenge to the effectiveness of extrinsic approaches. The authors examine OSM data in Dar es Salaam, Tanzania, a city that has been subject to numerous humanitarian mapping efforts as a result of the significant presence of informal settlements and vulnerability to flooding. Dar es Salaam is consequently one of the most densely mapped areas in the world on OSM.

The authors notice that node density increases when moving from the periphery to the city center, which they argue serves as a proxy for higher quality data (more nodes = better quality). This occurs as a result of more OSM contributors who update data in the city center on a more frequent basis. Using an open source platform such as OSM to conduct this study is necessary, particularly given the ubiquity of external dataset comparisons. Because the data is crowdsourced and made publicly available, it is not subject to the proprietary interests of larger organizations (i.e. governments and corporations). The data originates from individuals, rather than an organization that likely lacks the same degree of local knowledge.

# Lab #1 - Models of Urban Structure in QGIS (9/12/2019)
### Distance & Direction from Central Business District (CBD) Model
This week, we constructed a model in QGIS to illustrate Homer Hoyt's model of urban structure. The model can be downloaded [**here**](https://marcovg.github.io/DistanceAndDirectionFromPoint.model3). This algorithm calculates the distance (in meters) and direction (in degrees) of a set of input features from the mean coordinates of the centroids of a user-specified feature class. This algorithm could theoretically be applied if the user is seeking to analyze how distance and direction from a "central business district" affect trends and patterns across space in an urban environment.

# Practical #1 - QGIS Modelling (9/25/2019)
### Manchester, NH Case Study
I updated [**the model**](https://marcovg.github.io/DistanceAndDirectionFromPoint.model3) this week to include a SQL Query that calculates the distance field, in place of a Field Calculator operation. The new model takes a shapefile (of any geometry) as the central business district, calculates the centroid, and identifies each tract's geodesic distance (in meters) and direction (in degrees) from the city center. Sample data to demonstrate the model's applicability were drawn from the U.S. Census FactFinder (2017 ACS 5-Year Estimates) and joined to census tracts.

Open source GIS was used throughout this lab and demonstrates Rey's (2009) assertion that open GIS presents opportunities for "user-inspired innovation in research methods" (p. 205). Data Plotly, a third-party plugin for QGIS, is an example of GIS as "toolmaking" as described by Wright et. al. (1997), in which geographic concepts and theory can be applied through tools that can connect to the broader problems being solved / questions being asked (e.g. identifying clusters of high/low rent in particular radii / directions from the central city, applying Hoyt's model). Though the census data we obtained is openly available for public use, the data themselves aren't by definition "open source." Regardless, these estimates from the ACS are still useful for demonstrating the applicability of open source GIS tools. In this way, GIS functions as both a science and a tool because the tool and the "problem" being solved become inseperabale from one another (Wright et. al., 1997, p. 356).
#### Median Gross Rent 
![Manchester, NH Median Gross Rent](https://marcovg.github.io/ManchesterRent.png)
[**This scatter plot**](https://marcovg.github.io/ManchesterDistanceRent.html) shows median gross rent in Manchester tracts by distance from downtown, and [**this polar plot**](https://marcovg.github.io/ManchesterDirectionRent.html) shows the same measure by direction of the tract from downtown. The highest rents in the area are in Bedford (to the southwest), Hooksett (to the north), and Londonderry (to the southeast). Downtown Manchester, along with rural towns that aren't along the Merrimack River (Auburn to the east, Goffstown to the west) have the lowest median gross rent. These suburban tracts tend to be located between 6,000m and 9,000m (3.7mi to 5.6mi) from the city center and are oriented to the north and south.
#### Percent Hispanic
![Manchester, NH Percent Hispanic](https://marcovg.github.io/ManchesterHispanic.png)
[**This scatter plot**](https://marcovg.github.io/ManchesterDistanceHispanic.html) shows the percentage of the population identifying as Hispanic in Manchester tracts by distance from downtown, and [**this polar plot**](https://marcovg.github.io/ManchesterDirectionHispanic.html) shows the same measure by direction of the tract from downtown. There is no evident pattern of Hispanic distribution by distance, though some concentrations can be found in particular directions. The city's largest concentrations of Hispanic populations lie to the northeast (Manchester's North End neighborhood), southwest (Piscataquog neighborhood), and southeast (Hallsville & Kalivas Union neighborhoods). The outlying suburbs, in contrast, have the lowest percentage of Hispanics in the metro area.

# Lab #3 - Global Digital Elevation Models
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

# Lab #4 - Model Error Propagation and Uncertainty
### Comparing ASTER and SRTM Data Quality in Amboró National Park, Bolivia
During this week's lab, we learned how to develop batch scripts to run multiple SAGA tools through the command line in a single instance. The maps show the NUM (number file) returns for both the SRTM and ASTER datasets in Amboró National Park in Bolivia:

#### SRTM NUM Return

#### ASTER NUM Return
