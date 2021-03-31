# Millennium Data Sets at SciServer
SciServer currently contains the following data sets. These are represented as tables distributed over multiple databases.
Their schema (=definitions of tables and their columns) can also be found on the "Schema Browser" tab of the CasJobs tool,
or by following their link to the original Millennium Database site (needs registration there).

**IMPORTANT**: To gain access to these data sets on SciServer, users will have to join the Cosmological Simulations science domain.
To do so, go to the "<a jhref="https://apps.sciserver.org/dashboard/science" target="_blank">Science Domains</a> tab on the SciServer dashboard, select the "Cosmological Simulations" entry on the list (really the only entry right now), and click the "join" button on the right.

<table>
<tr><th colspan=2>Raw data</th></tr>
<tr><th/><th>Simulation particles</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/mmsnapshots/millimilsnapshots">MMSnapshots..MillimilSnapshots</a>
</td><td>Particles from millimil simulation</td></tr>
<tr><th/><th>Density fields</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/millimil/mmfield">millimil..MMField</a></td>
<td>millimil density field, 32<sup>3</sup> cells, + smoothing</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mfield/mfield">MField..MField</a></td>
<td>Millennium density field, 256<sup>3</sup> cells, + smoothing</td></tr>
<tr><th colspan=2>Halo catalogues</th></tr>
<tr><th/><th>Friends-of-friends (FOF) groups</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/millimil/fof">millimil..FOF</a></td>
<td>millimil FOF groups</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mfield/fof">MField..FOF</a></td>
<td>Millennium FOF groups</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/millenniumii/fof">MillenniumII..FOF</a></td>
<td>Millennium-II FOF groups</td></tr>
<tr><th/><th>SUBFIND subhalos</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/millimil/fofsubhalo">millimil..fofsubhalo</a></td>
<td>links between millimil subhalos and FOF groups, for information about details subhalos see millimil..MPAHalo.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mfield/fofsubhalo">MField..fofsubhalo</a></td>
<td>Subhalos with pointer to containing FOF groups, for information about details subhalos see millimil..MPAHalo.</td></tr>
    <tr><th colspan=2>Halo-particle links</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/mmsnapshots/millimilsnapshotids">MMSnapshots..MillimilSnapshotIds</a></td>
<td>links between particles and FOF groups and Subahlos ()</td></tr>
<tr><th colspan=2>Halo merger trees</th></tr>
<tr><th/><th>SUBFIND merger trees</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/millimil/mpahalo">millimil..MPAHalo</a></td>
<td>SUBFIND subhalo merger trees from millimil simulation.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpahalotrees/mhalo">MPAHaloTrees..MHalo</a></td>
<td>SUBFIND subhalo merger trees from Millennium simulation.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/minimilii/halotree">miniMilII..HaloTree</a></td>
<td>SUBFIND subhalo merger trees from mini-Millennium-II simulation.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/millenniumii/halotree">MillenniumII..HaloTree</a></td>
<td>SUBFIND subhalo merger trees from Millennium-II simulation.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpahalotrees/mr">MPAHaloTrees..MR</a></td>
<td>SUBFIND subhalo merger trees from Millennium simulation, 
updated version of <a href="/MyMillennium/Help/databases/mpahalotrees/mhalo">MPAHaloTrees..MHalo</a></td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpahalotrees/mrii">MPAHaloTrees..MRII</a></td>
<td>SUBFIND subhalo merger trees from Millennium-II simulation, 
updated version of <a href="/MyMillennium/Help/databases/millenniumii/halotree">MillenniumII..HaloTree</a></td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpahalotrees/mr7">MPAHaloTrees..MR7</a></td>
<td>SUBFIND subhalo merger trees from Millennium-WMAP7 simulation</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpahalotrees/mrscwmap7">MPAHaloTrees..MRscWMAP7</a></td>
<td>SUBFIND subhalo merger trees from Millennium simulation, scaled to WMAP7 cosmology.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpahalotrees/mriiscwmap7">MPAHaloTrees..MRIIscWMAP7</a></td>
<td>SUBFIND subhalo merger trees from Millennium-II simulation, 
scaled to WMAP7 cosmology.</td></tr>
<tr><th/><th>Durham (D)Halo merger trees</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/dhalotrees/dhalo">DHaloTrees..DHalo</a></td>
<td>Durham halo merger trees from Millennium simulation.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/dhalotrees/dsubhalo">DHaloTrees..DSubHalo</a></td>
<td>Link between Durham halo merger trees and SUBFIND subhalos.</td></tr>
<tr><th colspan=2>Semi-analytical galaxy catalogues</th></tr>
<tr><th/><th>MPA model: L-Galaxies</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpagalaxies/delucia2006a">MPAGalaxies..DeLucia2006a</a></td>
<td>Galaxy merger trees run with L-Galaxies on millimil halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2007MNRAS.375....2D" target="_blank">DeLucia &amp; Blaizot (2007)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpagalaxies/delucia2006a">MPAGalaxies..DeLucia2006a</a></td>
<td>Galaxy merger trees run with L-Galaxies on Millennium halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2007MNRAS.375....2D" target="_blank">DeLucia &amp; Blaizot (2007)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpagalaxies/bertone2007a">MPAGalaxies..Bertone2007a</a></td>
<td>Galaxy merger trees run with L-Galaxies on Millennium halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2007MNRAS.379.1143B" target="_blank">Bertone <i>etal</i> (2007)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2010a/mr">Guo2010a..mMR</a></td>
<td>Galaxy merger trees run with L-Galaxies on millimil halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2011MNRAS.413..101G" target="_blank">Guo <i>etal</i> (2011)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2010a/mr">Guo2010a..MR</a></td>
<td>Galaxy merger trees run with L-Galaxies on Millennium halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2011MNRAS.413..101G" target="_blank">Guo <i>etal</i> (2011)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2010a/mr">Guo2010a..MRII</a></td>
<td>Galaxy merger trees run with L-Galaxies on Millennium-II halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2011MNRAS.413..101G" target="_blank">Guo <i>etal</i> (2011)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2010a/mr">Guo2010a..mMRII</a></td>
<td>Galaxy merger trees run with L-Galaxies on mini-Millennium-II halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2011MNRAS.413..101G" target="_blank">Guo <i>etal</i> (2011)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2013a/mr">Guo2013a..MR</a></td>
<td>Galaxy merger trees run on original 
<a href="/MyMillennium/Help/databases/mpahalotrees/mr">Millennium halo trees</a> with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2013MNRAS.428.1351G" target="_blank">Guo <i>etal</i> (2013)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2013a/mrii">Guo2013a..MRII</a></td>
<td>Galaxy merger trees run on original 
<a href="/MyMillennium/Help/databases/mpahalotrees/mrii">Millennium-II halo trees</a> with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2013MNRAS.428.1351G" target="_blank">Guo <i>etal</i> (2013)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2013a/mr">Guo2013a..MR</a></td>
<td>Galaxy merger trees run on
<a href="/MyMillennium/Help/databases/mpahalotrees/mr7">Millennium-WMAP7 halo trees</a> with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2013MNRAS.428.1351G" target="_blank">Guo <i>etal</i> (2013)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2013a/mrscwmap7">Guo2013a..MRscWMAP7</a></td>
<td>Galaxy merger trees run on  
<a href="/MyMillennium/Help/databases/mpahalotrees/mrscwmap7">Millennium halo trees</a> scaled to WMAP7 cosmology with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2013MNRAS.428.1351G" target="_blank">Guo <i>etal</i> (2013)</a>.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/guo2013a/mriiscwmap7">Guo2013a..MRIIscWMAP7</a></td>
<td>Galaxy merger trees run on  
<a href="/MyMillennium/Help/databases/mpahalotrees/mriiscwmap7">Millennium-II halo trees</a> scaled to WMAP7 cosmology with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2013MNRAS.428.1351G" target="_blank">Guo <i>etal</i> (2013)</a>.</td></tr>

<tr><td><a href="/MyMillennium/Help/databases/henriques2015a/mrscplanck1">Henriques2015a..MRscPlanck1</a></td>
<td>Galaxy merger trees run on  
<a href="/MyMillennium/Help/databases/mpahalotrees/mrscplanck1">Millennium halo trees</a> scaled to Planck1 cosmology with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2015MNRAS.451.2663H" target="_blank">Henriques <i>etal</i> (2015)</a>.</td></tr>

<tr><td><a href="/MyMillennium/Help/databases/henriques2015a/mriiscplanck1">Henriques2015a..MRIIscPlanck1</a></td>
<td>Galaxy merger trees run on  
<a href="/MyMillennium/Help/databases/mpahalotrees/mriiscplanck1">Millennium-II halo trees</a> scaled to Planck1 cosmology with L-Galaxies version described in 
<a href="http://adsabs.harvard.edu/abs/2015MNRAS.451.2663H" target="_blank">Henriques <i>etal</i> (2015)</a>.</td></tr>

<tr><td>[Not yet at SciServer]<<a href="/MyMillennium/Help/databases/henriques2020a/mrscplanck1">Henriques2020a..MRscPlanck1 </a></td>
<td>Galaxy merger trees run on original 
<a href="/MyMillennium/Help/databases/henriques2020a/mrscplanck1">Millennium halo trees</a> scaled to Planck1 cosmology with L-Galaxies version described in 
<a href="https://ui.adsabs.harvard.edu/abs/2020MNRAS.491.5795H/" target="_blank">Henriques <i>etal</i> (2020)</a>.</td></tr>
<tr><td>[Not yet at SciServer] <a href="/MyMillennium/Help/databases/henriques2020a/mrscplanck1_rings">Henriques2020a..MRscPlanck1_Rings</a></td>
<td>Disc properties in radial bins for the galaxies stored in the Henriques2020a..MRscPlanck1 table.</td></tr>

<tr><th/><th>Durham model: GalForm</th></tr>
<tr><td><a href="/MyMillennium/Help/databases/dgalaxies/bower2006a">DGalaxies..Bower2006a</a></td>
<td>Galaxy merger trees run with GalForm on Millennium halo trees in as described in 
<a href="http://adsabs.harvard.edu/abs/2006MNRAS.370..645B" target="_blank">Bower <i>etal</i> (2007)</a>.</td></tr>
<tr><th colspan=2>Light-cone catalogues</th></tr>
<tr><td>
<a href="/MyMillennium/Help/databases/mpamocks/kitzbichler2006abcdef">MPAMocks..Kitzbichler2006a - MPAMocks..Kitzbichler2006f</a><br/>
<a href="/MyMillennium/Help/databases/mpamocks/kitzbichler2006abcdef_johnson">MPAMocks..Kitzbichler2006a_Johnson - MPAMocks..Kitzbichler2006f_Johnson</a><br/>
<a href="/MyMillennium/Help/databases/mpamocks/kitzbichler2006abcdef_sdss">MPAMocks..Kitzbichler2006a_SDSS - MPAMocks..Kitzbichler2006f_SDSS</a>
</td>
<td>1.4<sup>o</sup>x1.4<sup>o</sup> Light-cone "mock" catalogues as described in 
<a href="http://adsabs.harvard.edu/abs/2007MNRAS.376....2K" target="_blank">Kitzbichler &amp; White (2007)</a>.
Based on semi-analytics catalogue in <a href="/MyMillennium/Help/databases/mpagalaxies/delucia2006a">MPAGalaxies..DeLucia2006a</a></td></tr>
<tr><td>
<a href="/MyMillennium/Help/databases/mpamocks/blaizot2006_allsky">
MPAMocks..Blaizot2006_AllSky_PT_1 (periodic)<br/>
MPAMocks..Blaizot2006_AllSky_RT_1 - MPAMocks..Blaizot2006_AllSky_RT_5 (random shifts)</a> 
</td>
<td>6 all-sky light-cone catalogues created using the MoMaF algorithm of Jeremy Blaizot described in  
<a href="http://adsabs.harvard.edu/abs/2005MNRAS.360..159B" target="_blank">Blaizot <i>etal</i> (2005)</a>.
Based on semi-analytics catalogue in 
<a href="/MyMillennium/Help/databases/mpagalaxies/delucia2006a">MPAGalaxies..DeLucia2006a</a>.
Depth comparable to the spectral sample in SDSS.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/mpamocks/cosmos2006">MPAMocks..Cosmos_012_000 etc</a></td>
<td>24 1.4<sup>o</sup>x1.4<sup>o</sup> Light-cone "mock" catalogues as described in 
<a href="http://adsabs.harvard.edu/abs/2007MNRAS.376....2K" target="_blank">Kitzbichler &amp; White (2007)</a>.
The semi-analytics catalogue on which these cones are based ar NOT in the database. 
These cones have been used by the COSMOS collaboration in various papers.</td></tr>
<tr><td><a href="/MyMillennium/Help/databases/henriques2012a/database">Henriques2012a</a></td>
<td>Database with 2x24 1.4<sup>o</sup>x1.4<sup>o</sup> pencil beam and 2 all-sky light-cone "mock" catalogues as described in 
<a href="http://adsabs.harvard.edu/abs/2012MNRAS.421.2904H" target="_blank">Henriques <i>etal</i> (2012)</a>.
Based on semi-analytics catalogue in <a href="/MyMillennium/Help/databases/guo2010a/mr">Guo2010a..MR</a>.
Catalogues exists for different stellar population synthesis models.</td></tr>

</table>


