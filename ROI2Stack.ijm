/*
 * This macro extracs all ROIs from ROI manager and creates
 * new stack from them
 * Image t ocopy from must be selected
 */
macro "ROI2Stack" {
	id = getImageID();
	count = roiManager("count");
	if(count>0) {
		roiManager("select",0);
		Roi.getBounds(x, y, width, height)
	}
	else {
		exit("Must be at leas one ROI in ROIManager")
	}
	// create output stack
	type = toString(bitDepth())+"-bit";
	newImage(getTitle()+"_ROI", type, width, height, count);
	idc = getImageID();
	for (i = 0; i < count; i++) {
		selectImage(id);	// select source
		roiManager("select", i);
		run("Copy");
		selectImage(idc);
		setSlice(i+1);
		run("Select None");
		run("Paste");		
	}
}
