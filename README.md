<h1>Getting started with SciServer</h1>

If you can see this, you have successfully registered for SciServer!

<h2>Welcome to SciServer's <a href='https://github.com/sciserver/Example-Notebooks'>Example Notebooks</a> for Compute!</h2>

<h3>Table of Contents</h3>
<ul>
<li><a href="#description">Description</a></li>
<li><a href="#installation">Installation</a></li>
<li><a href="#updating">Updating</a></li>
<li><a href="#contributing">Contributing</a></li>
<li><a href="#contact">Contact</a></li>
</ul>

<h2>The first step</h2>

<p>This repository contains example notebooks that can help you start using SciServer for your data science and science education projects. Use these example notebooks to learn Python syntax, and as templates for creating your own notebooks.</p>

<ol>
    <li>Go to the Home tab (<a href="https://apps.sciserver.org/dashboard" target='_blank'>Launch in a new browser tab</a>)</li>
    <li>Click on Compute from the list of SciServer Apps to open SciServer Compute</li>
    <li>Click the <strong>Create container</strong> button to open the options for starting a virtual computing environment</li>
    <li>Give your new container a name, keep the default options for the dropdown menus, and be sure to check <strong>Getting Started</strong> under Data Volumes</li>
    <li>Click Create; your new container will appear in the list</li>
    <li>Click on the name of the container to launch</li>
    <li>Click on <strong><code>getting_started</code></strong> to see the example notebooks</li>
    <li>Click on <strong><code>welcome.ipynb</code></strong> to open the first example</li>
</ol>

If you have any questions, please email us at sciserver-helpdesk@jhu.edu.

<h2>Next steps</h2>

The directories in this Data Volume contain many examples of Python and/or R notebooks you can use and adapt in your own research and teaching. Each directory includes a README that describes the example notebooks found there.

The <strong><code>getting_started</code></strong> Data Volume is read-only. That means you can run all of the example notebooks in Compute, but you cannot save your changes.

Often the best way to learn to code is to modify a working example, so we highly recommend that you copy these notebooks into your own <strong><code>persistent</code></strong> directory. To do that, use the Copy button in the Files view of the SciServer Dashboard. 

Alternatively, you can use git to clone these files from SciServer's public <a href="https://github.com/sciserver/Example-Notebooks" target="_blank">Example Notebooks</a> GitHub repository. To do that, open a new Python notebook, type the following command into a new cell, and click Run:

<code><strong>!git clone https://github.com/sciserver/Example-Notebooks.git /home/idies/workspace/Storage/{your_username}/persistent/Example-Notebooks/</strong></code>

Be sure to include the exclamation point (!) at the beginning of the command.

<h3 id="updating">Updating</h3>

<p>In the future, we may occasionally change these example notebooks, to add new examples or to take advantage of new SciServer features. Once we have made those future changes, you can integrate the changes into the Example Notebook copies you have made in your user volume.</p>

<p>To get the latest versions, create a new Python 3 notebook and add this command to the first cell:</p>

<code><strong>!git pull</strong></code>

<p>Be sure to include the exclamation point as the first character.</p>

<p>Run this command. Our version management system (git) will do its best to seamlessly merge the new updates with your changes. If it is unable to do so, it will generate a conflict. To learn how to resolve conflicts, see <a href="https://help.github.com/articles/resolving-a-merge-conflict-using-the-command-line/">GitHub's guide to resolving conflicts</a>.</p>

<h3 id="contributing">Contributing</h3>

<p>We encourage you to adapt and use these example notebooks any way you wish! If you would like to share your contributions with us and with other SciServer users, let us know by emailing the SciServer Helpdesk at sciserver-helpdesk@jhu.edu.</p>