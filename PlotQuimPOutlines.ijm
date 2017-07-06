/**
 * Display outlines collored according to motility or/and convexity 
 * maps produced by QuimP
 * 
 * Piotr Baniukiewicz
 * p.baniukiewicz@warwick.ac.uk
 */

setBatchMode(true);
// Map sizes are hardcoded !!

convM=readMap("/home/baniuk/Documents/Repos/QUIMP-Matlab/Matlab/Segmentation/E1/","OUT81_fluoreszenz-test_0_convexityMap.maQP");
motM=readMap("/home/baniuk/Documents/Repos/QUIMP-Matlab/Matlab/Segmentation/E1/","OUT81_fluoreszenz-test_0_motilityMap.maQP");
xC = readMap("/home/baniuk/Documents/Repos/QUIMP-Matlab/Matlab/Segmentation/E1/","OUT81_fluoreszenz-test_0_xMap.maQP");
yC = readMap("/home/baniuk/Documents/Repos/QUIMP-Matlab/Matlab/Segmentation/E1/","OUT81_fluoreszenz-test_0_yMap.maQP");

open("/home/baniuk/Documents/Repos/QUIMP-Matlab/Matlab/Segmentation/"+"fluoreszenz-test_RGB.tif");
orgIm = getImageID();

selectImage(orgIm);ns = nSlices;
for(s=0;s<ns;s++) {
	selectImage(orgIm);setSlice(s+1);  // +1 because slices start from 1 and
	showProgress((s+1)/ns);
	setLineWidth(2);
	// plot if both maps positive
	for(i=0;i<400;i++) {
		// get map values
		selectImage(convM);cp = getPixel(i,s);
		selectImage(motM); mp = getPixel(i,s);
		if(mp>0 && cp>0) { // check condition
			// decode coordinates from outline index
			selectImage(xC); x = getPixel(i,s);
			selectImage(yC); y = getPixel(i,s);
			setColor("blue");
			// draw point
			selectImage(orgIm); drawRect(x, y, 1, 1);
		} else if(mp>0) { // plot if expanding (but may be concave)
			selectImage(xC); x = getPixel(i,s);
			selectImage(yC); y = getPixel(i,s);
			setColor("yellow");
			selectImage(orgIm); drawRect(x, y, 1, 1);
		} else { // all other
			selectImage(xC); x = getPixel(i,s);
			selectImage(yC); y = getPixel(i,s);
			setColor(255,255,255);
			selectImage(orgIm); drawRect(x, y, 1, 1);
		}
	}
	// plot if both maps negative
	for(i=0;i<400;i++) {
		selectImage(convM);cp = getPixel(i,s);
		selectImage(motM); mp = getPixel(i,s);
		if(mp<0 && cp<0) {
			selectImage(xC); x = getPixel(i,s);
			selectImage(yC); y = getPixel(i,s);
			setColor("red");
			selectImage(orgIm); drawRect(x, y, 1, 1);
		}
	}
}
selectImage(orgIm);setBatchMode("show");
showMessage("DONE!")



/** 
 *  Read map from paQP file and converts it to 2D array 
 *  that is image of type Double.
 *  The array (image) is [f,r], where f stands for frames and r for
 *  outline resolution. 
 *  Note that in IJ notation width of the image stands for resolution 
 *  and height for frames 
 *  @return IJ index of this image
 */
function readMap(path,filename) {
	name=split(filename,".");
	newImage(name[0],"32-bit",400,150,1);
	loaded=File.openAsString(path+filename);
	lines = split(loaded,"\n");
	// iterate over lines
	for(i=0;i<lines.length;i++) {
		line = split(lines[i],",");
		for(l=0;l<line.length;l++) {
			setPixel(l,i,parseFloat(line[l]));
		}
	}
	return getImageID();
}
