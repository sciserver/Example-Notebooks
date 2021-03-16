<h1>Getting started with SciServer</h1>

If you can see this, you have successfully registered for SciServer!

<h2>The first step</h2>

The <strong><code>getting_started</code></strong> Data Volume contains many examples that can help you start using SciServer Compute right away. Starting from your SciServer Dashboard, follow these steps:

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

Once you have copied the files into your persistent space, you can save your changes. Try changing different parts of the example notebooks to see what your changes do. Have fun!
