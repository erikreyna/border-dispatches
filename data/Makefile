
decompress:
	unzip srtm_13_05.zip -d srtm_13_05
	unzip srtm_13_06.zip -d srtm_13_06
	unzip srtm_13_07.zip -d srtm_13_07
	unzip srtm_14_06.zip -d srtm_14_06
	unzip srtm_14_07.zip -d srtm_14_07
	unzip srtm_15_06.zip -d srtm_15_06
	unzip srtm_15_07.zip -d srtm_15_07
	unzip srtm_16_06.zip -d srtm_16_06
	unzip srtm_16_07.zip -d srtm_16_07
	unzip srtm_17_06.zip -d srtm_17_06
	unzip srtm_17_07.zip -d srtm_17_07

warp:
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_13_05/srtm_13_05.tif srtm_13_05/srtm_13_05-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_13_06/srtm_13_06.tif srtm_13_06/srtm_13_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_13_07/srtm_13_07.tif srtm_13_07/srtm_13_07-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_14_06/srtm_14_06.tif srtm_14_06/srtm_14_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_14_07/srtm_14_07.tif srtm_14_07/srtm_14_07-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_15_06/srtm_15_06.tif srtm_15_06/srtm_15_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_15_07/srtm_15_07.tif srtm_15_07/srtm_15_07-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_16_06/srtm_16_06.tif srtm_16_06/srtm_16_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_16_07/srtm_16_07.tif srtm_16_07/srtm_16_07-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_17_06/srtm_17_06.tif srtm_17_06/srtm_17_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_17_07/srtm_17_07.tif srtm_17_07/srtm_17_07-3785.tif


hillshade:
	gdaldem hillshade -compute_edges -z 10 srtm_13_05/srtm_13_05-3785.tif srtm_13_05/srtm_13_05-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_13_06/srtm_13_06-3785.tif srtm_13_06/srtm_13_06-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_13_07/srtm_13_07-3785.tif srtm_13_07/srtm_13_07-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_14_06/srtm_14_06-3785.tif srtm_14_06/srtm_14_06-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_14_07/srtm_14_07-3785.tif srtm_14_07/srtm_14_07-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_15_06/srtm_15_06-3785.tif srtm_15_06/srtm_15_06-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_15_07/srtm_15_07-3785.tif srtm_15_07/srtm_15_07-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_16_06/srtm_16_06-3785.tif srtm_16_06/srtm_16_06-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_16_07/srtm_16_07-3785.tif srtm_16_07/srtm_16_07-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_17_06/srtm_17_06-3785.tif srtm_17_06/srtm_17_06-3785.tif
	gdaldem hillshade -compute_edges -z 10 srtm_17_07/srtm_17_07-3785.tif srtm_17_07/srtm_17_07-3785.tif

getExtent:
	gdalinfo -mm srtm_13_05/srtm_13_05.tif | grep Min/Max
	gdalinfo -mm srtm_13_06/srtm_13_06.tif | grep Min/Max
	gdalinfo -mm srtm_13_07/srtm_13_07.tif | grep Min/Max
	gdalinfo -mm srtm_14_06/srtm_14_06.tif | grep Min/Max
	gdalinfo -mm srtm_14_07/srtm_14_07.tif | grep Min/Max
	gdalinfo -mm srtm_15_06/srtm_15_06.tif | grep Min/Max
	gdalinfo -mm srtm_15_07/srtm_15_07.tif | grep Min/Max
	gdalinfo -mm srtm_16_06/srtm_16_06.tif | grep Min/Max
	gdalinfo -mm srtm_16_07/srtm_16_07.tif | grep Min/Max
	gdalinfo -mm srtm_17_06/srtm_17_06.tif | grep Min/Max
	gdalinfo -mm srtm_17_07/srtm_17_07.tif | grep Min/Max

slope:
	gdaldem slope srtm_13_05/srtm_13_05-3785.tif srtm_13_05/srtm_13_05-slope-3785.tif
	gdaldem slope srtm_13_06/srtm_13_06-3785.tif srtm_13_06/srtm_13_06-slope-3785.tif
	gdaldem slope srtm_13_07/srtm_13_07-3785.tif srtm_13_07/srtm_13_07-slope-3785.tif
	gdaldem slope srtm_14_06/srtm_14_06-3785.tif srtm_14_06/srtm_14_06-slope-3785.tif
	gdaldem slope srtm_14_07/srtm_14_07-3785.tif srtm_14_07/srtm_14_07-slope-3785.tif
	gdaldem slope srtm_15_06/srtm_15_06-3785.tif srtm_15_06/srtm_15_06-slope-3785.tif
	gdaldem slope srtm_15_07/srtm_15_07-3785.tif srtm_15_07/srtm_15_07-slope-3785.tif
	gdaldem slope srtm_16_06/srtm_16_06-3785.tif srtm_16_06/srtm_16_06-slope-3785.tif
	gdaldem slope srtm_16_07/srtm_16_07-3785.tif srtm_16_07/srtm_16_07-slope-3785.tif
	gdaldem slope srtm_17_06/srtm_17_06-3785.tif srtm_17_06/srtm_17_06-slope-3785.tif
	gdaldem slope srtm_17_07/srtm_17_07-3785.tif srtm_17_07/srtm_17_07-slope-3785.tif

colorSlope:
	gdaldem color-relief srtm_13_05/srtm_13_05-slope-3785.tif ramp-slope srtm_13_05/srtm_13_05-slopeshade-3785.tif
	gdaldem color-relief srtm_13_06/srtm_13_06-slope-3785.tif ramp-slope srtm_13_06/srtm_13_06-slopeshade-3785.tif
	gdaldem color-relief srtm_13_07/srtm_13_07-slope-3785.tif ramp-slope srtm_13_07/srtm_13_07-slopeshade-3785.tif
	gdaldem color-relief srtm_14_06/srtm_14_06-slope-3785.tif ramp-slope srtm_14_06/srtm_14_06-slopeshade-3785.tif
	gdaldem color-relief srtm_14_07/srtm_14_07-slope-3785.tif ramp-slope srtm_14_07/srtm_14_07-slopeshade-3785.tif
	gdaldem color-relief srtm_15_06/srtm_15_06-slope-3785.tif ramp-slope srtm_15_06/srtm_15_06-slopeshade-3785.tif
	gdaldem color-relief srtm_15_07/srtm_15_07-slope-3785.tif ramp-slope srtm_15_07/srtm_15_07-slopeshade-3785.tif
	gdaldem color-relief srtm_16_06/srtm_16_06-slope-3785.tif ramp-slope srtm_16_06/srtm_16_06-slopeshade-3785.tif
	gdaldem color-relief srtm_16_07/srtm_16_07-slope-3785.tif ramp-slope srtm_16_07/srtm_16_07-slopeshade-3785.tif
	gdaldem color-relief srtm_17_06/srtm_17_06-slope-3785.tif ramp-slope srtm_17_06/srtm_17_06-slopeshade-3785.tif
	gdaldem color-relief srtm_17_07/srtm_17_07-slope-3785.tif ramp-slope srtm_17_07/srtm_17_07-slopeshade-3785.tif

color:
	gdaldem color-relief srtm_13_05/srtm_13_05-3785.tif ramp srtm_13_05/srtm_13_05-color-3785.tif
	gdaldem color-relief srtm_13_06/srtm_13_06-3785.tif ramp srtm_13_06/srtm_13_06-color-3785.tif
	gdaldem color-relief srtm_13_07/srtm_13_07-3785.tif ramp srtm_13_07/srtm_13_07-color-3785.tif
	gdaldem color-relief srtm_14_06/srtm_14_06-3785.tif ramp srtm_14_06/srtm_14_06-color-3785.tif
	gdaldem color-relief srtm_14_07/srtm_14_07-3785.tif ramp srtm_14_07/srtm_14_07-color-3785.tif
	gdaldem color-relief srtm_15_06/srtm_15_06-3785.tif ramp srtm_15_06/srtm_15_06-color-3785.tif
	gdaldem color-relief srtm_15_07/srtm_15_07-3785.tif ramp srtm_15_07/srtm_15_07-color-3785.tif
	gdaldem color-relief srtm_16_06/srtm_16_06-3785.tif ramp srtm_16_06/srtm_16_06-color-3785.tif
	gdaldem color-relief srtm_16_07/srtm_16_07-3785.tif ramp srtm_16_07/srtm_16_07-color-3785.tif
	gdaldem color-relief srtm_17_06/srtm_17_06-3785.tif ramp srtm_17_06/srtm_17_06-color-3785.tif
	gdaldem color-relief srtm_17_07/srtm_17_07-3785.tif ramp srtm_17_07/srtm_17_07-color-3785.tif

clean:
	rm -r */