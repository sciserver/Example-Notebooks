#
# Written by Min-Su Shin
# Department of Astronomy, University of Michigan (2009 - )
# Department of Astrophysical Sciences, Princeton University (2005 - 2009)
#
# You can freely use the code.
#

import numpy
import math

def sky_median_sig_clip(input_arr, sig_fract, percent_fract, max_iter=100, low_cut=True, high_cut=True):
	"""Estimating a sky value for a given number of iterations

	@type input_arr: numpy array
	@param input_arr: image data array
	@type sig_fract: float
	@param sig_fract: fraction of sigma clipping
	@type percent_fract: float
	@param percent_fract: convergence fraction
	@type max_iter: integer
	@param max_iter: max. of iterations
	@type low_cut: boolean
	@param low_cut: cut out only low values
	@type high_cut: boolean
	@param high_cut: cut out only high values
	@rtype: tuple
	@return: (sky value, number of iterations)

	"""
	work_arr = numpy.ravel(input_arr)
	old_sky = numpy.median(work_arr)
	sig = work_arr.std()
	upper_limit = old_sky + sig_fract * sig
	lower_limit = old_sky - sig_fract * sig
	if low_cut and high_cut:
		indices = numpy.where((work_arr < upper_limit) & (work_arr > lower_limit))
	else:
		if low_cut:
			indices = numpy.where((work_arr > lower_limit))
		else:
			indices = numpy.where((work_arr < upper_limit))
	work_arr = work_arr[indices]
	new_sky = numpy.median(work_arr)
	iteration = 0
	while ((math.fabs(old_sky - new_sky)/new_sky) > percent_fract) and (iteration < max_iter) :
		iteration += 1
		old_sky = new_sky
		sig = work_arr.std()
		upper_limit = old_sky + sig_fract * sig
		lower_limit = old_sky - sig_fract * sig
		if low_cut and high_cut:
			indices = numpy.where((work_arr < upper_limit) & (work_arr > lower_limit))
		else:
			if low_cut:
				indices = numpy.where((work_arr > lower_limit))
			else:
				indices = numpy.where((work_arr < upper_limit))
		work_arr = work_arr[indices]
		new_sky = numpy.median(work_arr)
	return (new_sky, iteration)



def sky_mean_sig_clip(input_arr, sig_fract, percent_fract, max_iter=100, low_cut=True, high_cut=True):
	"""Estimating a sky value for a given number of iterations

	@type input_arr: numpy array
	@param input_arr: image data array
	@type sig_fract: float
	@param sig_fract: fraction of sigma clipping
	@type percent_fract: float
	@param percent_fract: convergence fraction
	@type max_iter: integer
	@param max_iter: max. of iterations
	@type low_cut: boolean
	@param low_cut: cut out only low values
	@type high_cut: boolean
	@param high_cut: cut out only high values
	@rtype: tuple
	@return: (sky value, number of iterations)

	"""
	work_arr = numpy.ravel(input_arr)
	old_sky = numpy.mean(work_arr)
	sig = work_arr.std()
	upper_limit = old_sky + sig_fract * sig
	lower_limit = old_sky - sig_fract * sig
	if low_cut and high_cut:
		indices = numpy.where((work_arr < upper_limit) & (work_arr > lower_limit))
	else:
		if low_cut:
			indices = numpy.where((work_arr > lower_limit))
		else:
			indices = numpy.where((work_arr < upper_limit))
	work_arr = work_arr[indices]
	new_sky = numpy.mean(work_arr)
	iteration = 0
	while ((math.fabs(old_sky - new_sky)/new_sky) > percent_fract) and (iteration < max_iter) :
		iteration += 1
		old_sky = new_sky
		sig = work_arr.std()
		upper_limit = old_sky + sig_fract * sig
		lower_limit = old_sky - sig_fract * sig
		if low_cut and high_cut:
			indices = numpy.where((work_arr < upper_limit) & (work_arr > lower_limit))
		else:
			if low_cut:
				indices = numpy.where((work_arr > lower_limit))
			else:
				indices = numpy.where((work_arr < upper_limit))
		work_arr = work_arr[indices]
		new_sky = numpy.mean(work_arr)
	return (new_sky, iteration)



def range_from_zscale(input_arr, contrast = 1.0, sig_fract = 3.0, percent_fract = 0.01, max_iter=100, low_cut=True, high_cut=True):
	"""Estimating ranges with the zscale algorithm

	@type input_arr: numpy array
	@param input_arr: image data array as sample pixels to derive z-ranges
	@type contrast: float
	@param contrast: zscale contrast which should be larger than 0.
	@type sig_fract: float
	@param sig_fract: fraction of sigma clipping
	@type percent_fract: float
	@param percent_fract: convergence fraction
	@type max_iter: integer
	@param max_iter: max. of iterations
	@type low_cut: boolean
	@param low_cut: cut out only low values
	@type high_cut: boolean
	@param high_cut: cut out only high values
	@rtype: tuple
	@return: (min. value, max. value, number of iterations)

	"""
	work_arr = numpy.ravel(input_arr)
	work_arr = numpy.sort(work_arr) # sorting is done.
	max_ind = len(work_arr) - 1
	midpoint_ind = int(len(work_arr)*0.5)
	I_midpoint = work_arr[midpoint_ind]
	#print ".. midpoint index ", midpoint_ind, " I_midpoint ", I_midpoint
	# initial estimation of the slope
	x = numpy.array(range(0, len(work_arr))) - midpoint_ind
	y = numpy.array(work_arr)
	temp = numpy.vstack([x, numpy.ones(len(x))]).T
	slope, intercept = numpy.linalg.lstsq(temp, y)[0]
	old_slope = slope
	#print "... slope & intercept ", old_slope, " ", intercept
	# initial clipping
	sig = y.std()
	upper_limit = I_midpoint + sig_fract * sig
	lower_limit = I_midpoint - sig_fract * sig
	if low_cut and high_cut:
		indices = numpy.where((work_arr < upper_limit) & (work_arr > lower_limit))
	else:
		if low_cut:
			indices = numpy.where((work_arr > lower_limit))
		else:
			indices = numpy.where((work_arr < upper_limit))
	# new estimation of the slope
	x = numpy.array(indices[0]) - midpoint_ind
	y = numpy.array(work_arr[indices])
	temp = numpy.vstack([x, numpy.ones(len(x))]).T
	slope, intercept = numpy.linalg.lstsq(temp, y)[0]
	new_slope = slope
	#print "... slope & intercept ", new_slope, " ", intercept
	iteration = 1
	# to run the iteration, we need more than 50% of the original input array
	while (((math.fabs(old_slope - new_slope)/new_slope) > percent_fract) and (iteration < max_iter)) and (len(y) >= midpoint_ind) :
		iteration += 1
		old_slope = new_slope
		# clipping
		sig = y.std()
		upper_limit = I_midpoint + sig_fract * sig
		lower_limit = I_midpoint - sig_fract * sig
		if low_cut and high_cut:
			indices = numpy.where((work_arr < upper_limit) & (work_arr > lower_limit))
		else:
			if low_cut:
				indices = numpy.where((work_arr > lower_limit))
			else:
				indices = numpy.where((work_arr < upper_limit))
		# new estimation of the slope
		x = numpy.array(indices[0]) - midpoint_ind
		y = work_arr[indices]
		temp = numpy.vstack([x, numpy.ones(len(x))]).T
		slope, intercept = numpy.linalg.lstsq(temp, y)[0]
		new_slope = slope
		#print "... slope & intercept ", new_slope, " ", intercept

	z1 = I_midpoint + (new_slope / contrast) * (0 - midpoint_ind)
	z2 = I_midpoint + (new_slope / contrast) * (max_ind - midpoint_ind)

	return (z1, z2, iteration)



def range_from_percentile(input_arr, low_cut=0.25, high_cut=0.25):
	"""Estimating ranges with given percentiles

	@type input_arr: numpy array
	@param input_arr: image data array as sample pixels to derive ranges
	@type low_cut: float
	@param low_cut: cut of low-value pixels
	@type high_cut: float
	@param high_cut: cut of high-value pixels
	@rtype: tuple
	@return: (min. value, max. value)

	"""
	work_arr = numpy.ravel(input_arr)
	work_arr = numpy.sort(work_arr) # sorting is done.
	size_arr = len(work_arr)
	low_size = int(size_arr * low_cut)
	high_size = int(size_arr * high_cut)
	
	z1 = work_arr[low_size]
	z2 = work_arr[size_arr - 1 - high_size]

	return (z1, z2)



def histeq(inputArray, num_bins=1024):
	"""Performs histogram equalisation of the input numpy array.
    
	@type inputArray: numpy array
	@param inputArray: image data array
	@type num_bins: int
	@param num_bins: number of bins in which to perform the operation (e.g. 1024)
	@rtype: numpy array
	@return: image data array
    
	"""		
    
	imageData=numpy.array(inputArray, copy=True)
    
	# histogram equalisation: we want an equal number of pixels in each intensity range
	sortedDataIntensities=numpy.sort(numpy.ravel(imageData))	
	median=numpy.median(sortedDataIntensities)
    
	# Make cumulative histogram of data values, simple min-max used to set bin sizes and range
	dataCumHist=numpy.zeros(num_bins)
	minIntensity=sortedDataIntensities.min()	
	maxIntensity=sortedDataIntensities.max()
	histRange=maxIntensity-minIntensity
	binWidth=histRange/float(num_bins-1)
	for i in range(len(sortedDataIntensities)):
		binNumber=int(math.ceil((sortedDataIntensities[i]-minIntensity)/binWidth))
		addArray=numpy.zeros(num_bins)
		onesArray=numpy.ones(num_bins-binNumber)
		onesRange=range(binNumber, num_bins)
		numpy.put(addArray, onesRange, onesArray)
		dataCumHist=dataCumHist+addArray
                
	# Make ideal cumulative histogram
	idealValue=dataCumHist.max()/float(num_bins)
	idealCumHist=numpy.arange(idealValue, dataCumHist.max()+idealValue, idealValue)
    
	# Map the data to the ideal
	for y in range(imageData.shape[0]):
		for x in range(imageData.shape[1]):
		# Get index corresponding to dataIntensity
			intensityBin=int(math.ceil((imageData[y][x]-minIntensity)/binWidth))
            
	# Guard against rounding errors (happens rarely I think)
	if intensityBin<0:
		intensityBin=0
	if intensityBin>len(dataCumHist)-1:
		intensityBin=len(dataCumHist)-1
        
	# Get the cumulative frequency corresponding intensity level in the data
	dataCumFreq=dataCumHist[intensityBin]
            
	# Get the index of the corresponding ideal cumulative frequency
	idealBin=numpy.searchsorted(idealCumHist, dataCumFreq)
	idealIntensity=(idealBin*binWidth)+minIntensity
	imageData[y][x]=idealIntensity

	scale_min = imageData.min()
	scale_max = imageData.max()
	imageData.clip(min=scale_min, max=scale_max)
	imageData = (imageData -scale_min) / (scale_max - scale_min)
	indices = numpy.where(imageData < 0)
	imageData[indices] = 0.0
        
	return imageData



def linear(inputArray, scale_min=None, scale_max=None):
	"""Performs linear scaling of the input numpy array.

	@type inputArray: numpy array
	@param inputArray: image data array
	@type scale_min: float
	@param scale_min: minimum data value
	@type scale_max: float
	@param scale_max: maximum data value
	@rtype: numpy array
	@return: image data array
	
	"""		
	#print "img_scale : linear"
	imageData=numpy.array(inputArray, copy=True)
	
	if scale_min == None:
		scale_min = imageData.min()
	if scale_max == None:
		scale_max = imageData.max()

	imageData.clip(min=scale_min, max=scale_max)
	imageData = (imageData -scale_min) / (scale_max - scale_min)
	indices = numpy.where(imageData < 0)
	imageData[indices] = 0.0
	
	return imageData


def sqrt(inputArray, scale_min=None, scale_max=None):
	"""Performs sqrt scaling of the input numpy array.

	@type inputArray: numpy array
	@param inputArray: image data array
	@type scale_min: float
	@param scale_min: minimum data value
	@type scale_max: float
	@param scale_max: maximum data value
	@rtype: numpy array
	@return: image data array
	
	"""		
    
	#print "img_scale : sqrt"
	imageData=numpy.array(inputArray, copy=True)
	
	if scale_min == None:
		scale_min = imageData.min()
	if scale_max == None:
		scale_max = imageData.max()

	imageData.clip(min=scale_min, max=scale_max)
	imageData = imageData - scale_min
	indices = numpy.where(imageData < 0)
	imageData[indices] = 0.0
	imageData = numpy.sqrt(imageData)
	imageData = imageData / math.sqrt(scale_max - scale_min)
	
	return imageData


def log(inputArray, scale_min=None, scale_max=None):
	"""Performs log10 scaling of the input numpy array.

	@type inputArray: numpy array
	@param inputArray: image data array
	@type scale_min: float
	@param scale_min: minimum data value
	@type scale_max: float
	@param scale_max: maximum data value
	@rtype: numpy array
	@return: image data array
	
	"""		
    
	#print "img_scale : log"
	imageData=numpy.array(inputArray, copy=True)
	
	if scale_min == None:
		scale_min = imageData.min()
	if scale_max == None:
		scale_max = imageData.max()
	factor = math.log10(scale_max - scale_min)
	indices0 = numpy.where(imageData < scale_min)
	indices1 = numpy.where((imageData >= scale_min) & (imageData <= scale_max))
	indices2 = numpy.where(imageData > scale_max)
	imageData[indices0] = 0.0
	imageData[indices2] = 1.0
	try :
		imageData[indices1] = numpy.log10(imageData[indices1])/factor
	except :
		print("Error on math.log10 for ", (imageData[i][j] - scale_min))

	return imageData


def power(inputArray, power_index=3.0, scale_min=None, scale_max=None):
	"""Performs power scaling of the input numpy array.

	@type inputArray: numpy array
	@param inputArray: image data array
	@type power_index: float
	@param power_index: power index
	@type scale_min: float
	@param scale_min: minimum data value
	@type scale_max: float
	@param scale_max: maximum data value
	@rtype: numpy array
	@return: image data array
	
	"""		
    
	#print "img_scale : power"
	imageData=numpy.array(inputArray, copy=True)
	
	if scale_min == None:
		scale_min = imageData.min()
	if scale_max == None:
		scale_max = imageData.max()
	factor = 1.0 / math.pow((scale_max - scale_min), power_index)
	indices0 = numpy.where(imageData < scale_min)
	indices1 = numpy.where((imageData >= scale_min) & (imageData <= scale_max))
	indices2 = numpy.where(imageData > scale_max)
	imageData[indices0] = 0.0
	imageData[indices2] = 1.0
	imageData[indices1] = numpy.power((imageData[indices1] - scale_min), power_index)*factor

	return imageData


def asinh(inputArray, scale_min=None, scale_max=None, non_linear=2.0):
	"""Performs asinh scaling of the input numpy array.

	@type inputArray: numpy array
	@param inputArray: image data array
	@type scale_min: float
	@param scale_min: minimum data value
	@type scale_max: float
	@param scale_max: maximum data value
	@type non_linear: float
	@param non_linear: non-linearity factor
	@rtype: numpy array
	@return: image data array
	
	"""		
    
	#print "img_scale : asinh"
	imageData=numpy.array(inputArray, copy=True)
	
	if scale_min == None:
		scale_min = imageData.min()
	if scale_max == None:
		scale_max = imageData.max()
	factor = numpy.arcsinh((scale_max - scale_min)/non_linear)
	indices0 = numpy.where(imageData < scale_min)
	indices1 = numpy.where((imageData >= scale_min) & (imageData <= scale_max))
	indices2 = numpy.where(imageData > scale_max)
	imageData[indices0] = 0.0
	imageData[indices2] = 1.0
	imageData[indices1] = numpy.arcsinh((imageData[indices1] - scale_min)/non_linear)/factor

	return imageData
