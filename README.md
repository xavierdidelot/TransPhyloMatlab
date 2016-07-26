# TransPhyloMatlab
# Note #

There is a newer and better version of TransPhylo developed in R and available [here](https://github.com/xavierdidelot/TransPhylo).

# Introduction #

This is the homepage of TransPhyloMatlab, a software package for the Bayesian inference of infectious disease transmission from a phylogeny. The input is a dated phylogeny, where leaves correspond to pathogens isolated from the infected hosts. The main output is a transmission tree which indicates who infected whom. Such reconstruction can be achieved by colouring the branches of the phylogeny using a separate colour for each host, and such that the subtree coloured in a given colour represents the evolution happening within the corresponding host. Changes of colours on branches therefore correspond to transmission events from one host to another.

A more formal description of the statistical methodology underpinning TransPhyloMatlab has been published in 2014 in the scientific journal Molecular Biology and Evolution. This article is entitled [Bayesian inference of infectious disease transmission from whole genome sequence data](http://biorxiv.org/content/early/2013/12/16/001388) and was authored by [Xavier Didelot](http://www.xavierdidelot.xtreemhost.com/)  from Imperial College London, [Jennifer Gardy](http://jennifergardy.com/) from the University of British Columbia and [Caroline Colijn](http://www.imperial.ac.uk/AP/faces/pages/read/Home.jsp?person=c.colijn) from Imperial College London.

# Download #

You can download the [Matlab](http://www.mathworks.co.uk/products/matlab/) source code for TransPhyloMatlab via GIT using the command:
```
git clone https://github.com/xavierdidelot/TransPhyloMatlab.git
```

You will need [Matlab](http://www.mathworks.co.uk/products/matlab/) to use this code. The [bioinformatics toolbox](http://www.mathworks.co.uk/products/bioinfo/) is not strictly required but used for some of the graphical outputs.

Please note that the code for TransPhyloMatlab is distributed under the terms of the GNU GPL v3 license, for more details see https://www.gnu.org/copyleft/gpl.html

To generate a timed phylogeny which is the input required by TransPhyloMatlab, you may want to use [BEAST](http://beast.bio.ed.ac.uk/) or [BEAST2](http://www.beast2.org/wiki/index.php/Main_Page).

# Tutorial #

If you are new to TransPhyloMatlab, you can follow this [tutorial](https://github.com/xavierdidelot/TransPhyloMatlab/wiki/Tutorial) which should only take a few minutes to go through and describes the main functionalities of TransPhyloMatlab, including simulating datasets, inferring the transmission tree given a phylogeny and several graphical representations.

# Getting help #

If you need assistance using TransPhyloMatlab, you can get in touch by emailing `xavier.didelot@gmail.com`
