<h2>Welcome to SciServer's <a href='https://github.com/sciserver/Example-Notebooks'>Example Notebooks</a> for Compute!</h2>

<h3>Table of Contents</h3>
<ul>
<li><a href="#description">Description</a></li>
<li><a href="#installation">Installation</a></li>
<li><a href="#contributing">Contributing</a></li>
<li><a href="#license">License</a></li>
<li><a href="#contact">Contact</a></li>
</ul>

<h3 id="description">Description</h3>

<p>This repository contains example notebooks that can help you start using SciServer for your data science and science education projects. Use these example notebooks to learn Python syntax, and as templates for creating your own notebooks.</p>

<h3 id="installation">Installation</h3>

<p>The easiest way to get these Example Notebooks is to log in to SciServer and go to <a href="https://apps.sciserver.org/compute/">SciServer Compute</a>. Click <strong>Create Container</strong> to open the Create Container dialog box. At the bottom of the newly-opened dialog box, you will see a list of <strong>Data volumes</strong>. Be sure the checkbox next to <strong>Getting started</strong> is checked.</p>

<p>Once you create the container with the Getting Started data volume mounted, you can access these example notebooks from within Compute by going to the <strong>getting_started</strong> volume. They are in the <em>Example-Notebooks</em> folder.</p>

<p>The Getting Started data volume is read-only, so you may run the notebooks but not make changes to them. The first thing you should do is to copy them into your persistent volume by running the <strong>Copy Example Notebooks.ipynb</strong> notebook. Doing so will create a new folder called <code>examples</code> inside your persistent volume, with read/write copies of all these notebooks. You can then change the notebooks, see what the changes do, and save your changes.</p>

<p>Alternatively, if you are familiar with GitHub, you can directly clone the files into your SciServer file system space by opening a new Python notebook and running the following command - you will need to include the exclamation point at the beginning for it to run correctly:</p>

<code><strong>!git clone https://github.com/sciserver/Example-Notebooks.git {local directory name}</strong></code>


<h3 id="update">Update</h3>

<p>We occasionally change these example notebooks, to add new examples or to take advantage of new SciServer features. To get the latest versions, run the notebook <strong><code>Update Example Notebooks.ipynb</code></strong>. The update notebook will work even if you run it from the new directory in your persistent volume, where you may then save the updated versions.</p>

<p>If you run the update notebook after you have already made changes to your versions of the example notebooks, our version management system (git) will do its best to seamlessly merge the new updates with your changes. If it is unable to do so, it will generate a conflict. To learn how to resolve conflicts, see <a href="https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/">GitHub's guide to resolving conflicts</a>.</p>

<h3 id="contributing">Contributing</h3>

<p>We encourage you to adapt and use these example notebooks any way you wish! If you would like to share your contributions with us and with other SciServer users, let us know by emailing the SciServer Helpdesk at sciserver-helpdesk@jhu.edu.</p>

<h3 id="contact">Contact</h3>

<p>For technical questions or to report a bug, please email sciserver-helpdesk@jhu.edu.</p>
<p>For more information about SciServer, what it is, and what you can do with it, please visit www.sciserver.org.</p>
