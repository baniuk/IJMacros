// @File(label = "Input directory", style = "directory") input
// @File(label = "Output directory", style = "directory") output
// @String(label = "File suffix", value = ".lsm") suffix

/*
 * Convert lsm files into seprate channels.
 * 
 * Channels have suffix CH1, CH2, DIC. Second channel is optional.
 * Assumes that DIC is las channel
 */

// See also Process_Folder.py for a version of this code
// in the Python scripting language.
setBatchMode(true);

processFolder(input);

// function to scan folders/subfolders/files to find files with correct suffix
function processFolder(input) {
	list = getFileList(input);
	list = Array.sort(list)
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]))
			processFolder("" + input + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	open(input + File.separator + file);
	orginal = getImageID();
	getDimensions(width, height, channels, slices, frames);
	all = channels * frames;
	run("Hyperstack to Stack");
	orginal = getImageID();
	for(i=1; i<=channels; i++) {
		selectImage(orginal);
		run("Slice Keeper", "first=&i last=&all increment=&channels");
		if(i==channels) {
			nameToSave = file + "_CH_" + "DIC" + ".tif";
		} else {
			nameToSave = file + "_CH_" + i + ".tif";
		}
		save(output + File.separator + nameToSave);
		close();
	}
	selectImage(orginal);
	close();
}
