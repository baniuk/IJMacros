/*
 * This macro process *.lsm files and saves extracted DIC channel to 
 * separate stack of images.
 * Mainly designed to use with local files in Kay's directory
 * If run froim command line it expects parameters:
 * 		- filename with path
 * 		- out dir (ended with /) - optional parameter. If not provided input dir is used
 * If parameter not provided macro asks for directory with *.lsm files		
 * to process. Processed fiels are saved in the same place as stacked tiffs.
 * Example of run:
 * 		./ImageJ-linux64 --headless -macro /home/Macros/Extract_DIC_channel.ijm "/home/cAR1-GFP-devel5.5h-agar07-10.lsm"
 */
macro "Extract DIC channel" {
	setBatchMode(true)
	arg = getArgument();
	if	(arg=='') { // no arguments - ask for dir
		dir = getDirectory("Choose a Directory"); 
  		list = getFileList(dir);
		for (i = 0; i < list.length; i++)
			if (endsWith(list[i], ".lsm"))
	       		Action(dir,list[i],1,dir);
	    setBatchMode(false);   		
	}
	else {	// there is argument
		param = split(arg);	// can be 2 args input file and output dir
		if(param.length>1)	// we have also output dir
			outdir = param[1];
		else
			outdir = File.getParent(param[0])+File.separator;	// do not have output dir - use input
		Action(File.getParent(param[0])+File.separator,File.getName(param[0]),1,outdir);
	}	
}

// opens and saves stack removing selected channel
function Action(dirin, name, channel_to_delete, dirout) {
	open(dirin+name);
	getDimensions(width, height, channels, slices, frames); // one frame is composed from n channels 
	Stack.setChannel(channel_to_delete);
	run("Delete Slice", "delete=channel"); 
	save(dirout+name+".tif");
}
