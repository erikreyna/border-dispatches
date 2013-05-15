
warp:
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_13_06/srtm_13_06.tif srtm_13_06/srtm_13_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_14_06/srtm_14_06.tif srtm_14_06/srtm_14_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_14_07/srtm_14_07.tif srtm_14_07/srtm_14_07-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_15_06/srtm_15_06.tif srtm_15_06/srtm_15_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_16_06/srtm_16_06.tif srtm_16_06/srtm_16_06-3785.tif
	gdalwarp -s_srs EPSG:4326 -t_srs EPSG:3785 -r bilinear srtm_16_07/srtm_16_07.tif srtm_16_07/srtm_16_07-3785.tif


hillshades:
	gdaldem hillshade -co compress=lzw srtm_13_06/srtm_13_06-3785.tif srtm_13_06/srtm_13_06-hillshade-3785.tif
	gdaldem hillshade -co compress=lzw srtm_14_06/srtm_14_06-3785.tif srtm_14_06/srtm_14_06-hillshade-3785.tif
	gdaldem hillshade -co compress=lzw srtm_14_07/srtm_14_07-3785.tif srtm_14_07/srtm_14_07-hillshade-3785.tif
	gdaldem hillshade -co compress=lzw srtm_15_06/srtm_15_06-3785.tif srtm_15_06/srtm_15_06-hillshade-3785.tif
	gdaldem hillshade -co compress=lzw srtm_16_06/srtm_16_06-3785.tif srtm_16_06/srtm_16_06-hillshade-3785.tif
	gdaldem hillshade -co compress=lzw srtm_16_07/srtm_16_07-3785.tif srtm_16_07/srtm_16_07-hillshade-3785.tif

getExtent:
	gdalinfo -mm srtm_13_06/srtm_13_06.tif | grep Min/Max
	gdalinfo -mm srtm_14_06/srtm_14_06.tif | grep Min/Max
	gdalinfo -mm srtm_14_07/srtm_14_07.tif | grep Min/Max
	gdalinfo -mm srtm_15_06/srtm_15_06.tif | grep Min/Max
	gdalinfo -mm srtm_16_06/srtm_16_06.tif | grep Min/Max
	gdalinfo -mm srtm_16_07/srtm_16_07.tif | grep Min/Max

slope:
	gdaldem slope -co compress=lzw srtm_13_06/srtm_13_06-3785.tif srtm_13_06/srtm_13_06-slope-3785.tif
	gdaldem slope -co compress=lzw srtm_14_06/srtm_14_06-3785.tif srtm_14_06/srtm_14_06-slope-3785.tif
	gdaldem slope -co compress=lzw srtm_14_07/srtm_14_07-3785.tif srtm_14_07/srtm_14_07-slope-3785.tif
	gdaldem slope -co compress=lzw srtm_15_06/srtm_15_06-3785.tif srtm_15_06/srtm_15_06-slope-3785.tif
	gdaldem slope -co compress=lzw srtm_16_06/srtm_16_06-3785.tif srtm_16_06/srtm_16_06-slope-3785.tif
	gdaldem slope -co compress=lzw srtm_16_07/srtm_16_07-3785.tif srtm_16_07/srtm_16_07-slope-3785.tif

color:
	gdaldem color-relief srtm_13_06/srtm_13_06-slope-3785.tif ramp srtm_13_06/srtm_13_06-slope-color-3785.tif
	gdaldem color-relief srtm_14_06/srtm_14_06-slope-3785.tif ramp srtm_14_06/srtm_14_06-slope-color-3785.tif
	gdaldem color-relief srtm_14_07/srtm_14_07-slope-3785.tif ramp srtm_14_07/srtm_14_07-slope-color-3785.tif
	gdaldem color-relief srtm_15_06/srtm_15_06-slope-3785.tif ramp srtm_15_06/srtm_15_06-slope-color-3785.tif
	gdaldem color-relief srtm_16_06/srtm_16_06-slope-3785.tif ramp srtm_16_06/srtm_16_06-slope-color-3785.tif
	gdaldem color-relief srtm_16_07/srtm_16_07-slope-3785.tif ramp srtm_16_07/srtm_16_07-slope-color-3785.tif