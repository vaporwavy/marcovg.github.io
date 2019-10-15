::set the path to your SAGA program
SET PATH=%PATH%;c:\saga6

::set the prefix to use for all names and outputs
SET pre=Lab4_SRTMHydro

::set the directory in which you want to save ouputs. In the example below, part of the directory name is the prefix you entered above
SET od=W:\Lab4\data\srtm_elev\hydro

:: the following creates the output directory if it doesn't exist already
if not exist %od% mkdir %od%

saga_cmd ta_lighting 0 -ELEVATION=W:\Lab4\data\srtm_elev\Lab4_SRTMElevmosaicUTM.sgrd -SHADE=%od%\AnalyticalHillshade.sgrd -METHOD=0 -POSITION=0 -AZIMUTH=315 -DECLINATION=45 -EXAGGERATION=1 -UNIT=0

saga_cmd ta_preprocessor 1 -ELEVATION=W:\Lab4\data\srtm_elev\Lab4_SRTMElevmosaicUTM.sgrd -SINKROUTE=%od%\SinkRoute.sgrd -THRESHOLD=0 -THRSHEIGHT=100

saga_cmd ta_preprocessor 2 -DEM=W:\Lab4\data\srtm_elev\Lab4_SRTMElevmosaicUTM.sgrd -SINKROUTE=%od%\SinkRoute.sgrd -DEM_PREPROC=%od%\RemovedSinks.sgrd -METHOD=1 -THRESHOLD=0 -THRSHEIGHT=100

saga_cmd ta_hydrology 0 -ELEVATION=%od%\RemovedSinks.sgrd -SINKROUTE=%od%\SinkRoute.sgrd -FLOW=%od%\FlowAccumulation.sgrd -STEP=1 -FLOW_UNIT=0 -METHOD=4 -LINEAR_DO=1 -LINEAR_MIN=500 -CONVERGENCE=1.1 -NO_NEGATIVES=1

saga_cmd ta_channels 0 -ELEVATION=%od%\RemovedSinks.sgrd -CHNLNTWRK=%od%\ChannelNetwork.sgrd -CHNLROUTE=%od%\ChannelRoute.sgrd -SHAPES=%od%\ChannelShapes.sgrd -INIT_GRID=%od%\FlowAccumulation.sgrd -INIT_METHOD=2 -INIT_VALUE=1000 -MINLEN=10

::print a completion message so that uneasy users feel confident that the batch script has finished!
ECHO Processing Complete!
PAUSE