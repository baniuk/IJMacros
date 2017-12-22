/**
 * This macro produces comparision of shrinknl method.
 * 
 * @see com.github.celldynamics.quimp.geom.filters.OutlineProcessor.shrinknl(double, double, double, double, double, double, double, double)
 * @see com.github.celldynamics.quimp.plugin.randomwalk.PropagateSeedsTest.testGetCompositeSeed_Contour2()
 * @see com.github.celldynamics.quimp.plugin.randomwalk.PropagateSeeds.Contour.propagateSeed(ImageProcessor, ImageProcessor, double, double)
 * QuimP.git@62d0e2128c10c60b1e6a90611000e7806fee3c64
 */
run("Duplicate...", "duplicate");
setFont("Monospaced", 12)
makeRectangle(108, 128, 307, 288);
run("Crop");
setSlice(1)
drawString("shrinkDist=5", 8, 15)
drawString("expandDist=10", 8, 15+12+5)
drawString("alpha=0.35", 8, 15+12+5+12+5)
drawString("ampl=5", 8, 15+12+5+12+5+12+5)
drawString("averCurvDist=1", 8, 15+12+5+12+5+12+5+12+5)
drawString("avrNormDist=6", 8, 15+12+5+12+5+12+5+12+5+12+5)

setSlice(2)
drawString("shrinkDist=5", 8, 15)
drawString("expandDist=10", 8, 15+12+5)
drawString("alpha=0.35", 8, 15+12+5+12+5)
drawString("ampl=5", 8, 15+12+5+12+5+12+5)
drawString("averCurvDist=6", 8, 15+12+5+12+5+12+5+12+5)
drawString("avrNormDist=6", 8, 15+12+5+12+5+12+5+12+5+12+5)

setSlice(3)
drawString("shrinkDist=5", 8, 15)
drawString("expandDist=10", 8, 15+12+5)
drawString("alpha=0.35", 8, 15+12+5+12+5)
drawString("ampl=5", 8, 15+12+5+12+5+12+5)
drawString("averCurvDist=6", 8, 15+12+5+12+5+12+5+12+5)
drawString("avrNormDist=0", 8, 15+12+5+12+5+12+5+12+5+12+5)

setSlice(4)
drawString("shrinkDist=5", 8, 15)
drawString("expandDist=10", 8, 15+12+5)
drawString("alpha=0.35", 8, 15+12+5+12+5)
drawString("ampl=5", 8, 15+12+5+12+5+12+5)
drawString("averCurvDist=1", 8, 15+12+5+12+5+12+5+12+5)
drawString("avrNormDist=0", 8, 15+12+5+12+5+12+5+12+5+12+5)

run("Make Montage...", "columns=2 rows=2 scale=1 border=1");