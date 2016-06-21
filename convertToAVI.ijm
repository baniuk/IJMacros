input = "/home/baniuk/server-share/QUIMP/Conferences/RI-Raport/";
output = "/home/baniuk/server-share/QUIMP/Conferences/RI-Raport/";

list = getFileList(input);
for(i=0;i<list.length;i++)
{
	open(input + list[i]);
	run("Scale...", "x=0.25 y=0.25 z=1.0 width=348 height=260 depth=300 interpolation=Bicubic average process create");
	savename = output + list[i] + "-1.avi";
	run("AVI... ", "compression=PNG frame=14 save=["+savename+"]");
	close();
	selectWindow(list[i]);
	close();
}
