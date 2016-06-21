/*
 * Copies selected frame to separate window and prepare it for wand tool
 */
run("Copy");
run("Internal Clipboard");
run("Smooth");
run("Enhance Contrast", "saturated=0.35");
