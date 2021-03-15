import os
import sys
import requests
import urllib.parse
import urllib.request
import json

from shutil import copyfile

def sdssDownload(band, location, size, path):

    """
    .
    sdssArchie populates a directory with links to raw images 
    from the SDSS mission.  These images are all in FITS format 
    and suitable for reprojection, moaicking, etc.

    Parameters
    ----------
    band: str
        SDSS wavelength band (e.g. "g").

    location: str
        Coordinates or name of an astronomical object
        (e.g. "4h23m11s -12d14m32.3s", "Messier 017").

    size: float
        Region size in degrees.

    path: str
        Directory for output files.
    """

    debug = 1

    
    # Build the URL to get image metadata
    
    url = "http://montage.ipac.caltech.edu/cgi-bin/ArchiveList/nph-archivelist?survey=SDSSDR7+" \
        + urllib.parse.quote_plus(band) \
        + "&location=" \
        + urllib.parse.quote_plus(location) \
        + "&size=" \
        + str(size) + "&units=deg&mode=JSON"
    
    if debug:
        print('DEBUG> url = "' + url + '"')
    
    
    # Retrieve the image metadata and convert
    # the JSON to a Python dictionary
    
    fjson = urllib.request.urlopen(url)
    
    data = json.load(fjson)
    
    if debug:
        print("DEBUG> data: ")
        print(data)
    
    nimages = len(data)
    
    if debug:
        print("DEBUG> nimages = " + str(nimages))
    
    
    # We need to check the given directory, 
    # whether it exists, whether it is writeable,
    # etc.  We'll do it by trying to create it,
    # then trying to write the image data it.
    
    rtn = {}    
    
    try:
    
        if not os.path.exists(path):
            os.makedirs(path)
    
    except:
        rtn['status'] = 1
        rtn['msg'   ] = 'Cannot create output directory.'
        return rtn   
    
    
    # Retrieve all the images into the data directory

    try:
        for index in range(0,nimages):
    
            datafile    = path +  "/" + data[index]['file']
            url         = data[index]['url']
            archivefile = url
            archivefile = archivefile.replace('http://das.sdss.org','/home/idies/workspace/dr9_imaging/boss/photoObj/frames-new/301')

            if debug:
                print('copy file ' + archivefile + ' to ' + datafile)

            copyfile(archivefile, datafile)

    except:
    
        rtn['status'] = 1
        rtn['msg'   ] = 'Error reading or writing data'
        return rtn
    
    
    # Success
    
    rtn['status'] = 0
    rtn['count' ] = nimages
    return rtn
