Description
--

This repository contains Magma code for gluing curves along their torsion, both by geometric methods (upcoming) and by analytic methods (fully implemented).

Prerequisites
--

An installation of Magma and the dependency [`JRSijsling/curve_reconstruction`](https://github.com/JRSijsling/curve_reconstruction). You will need Neurohr's algorithms mentioned in said dependency.

Installation 
--

You can enable the functionality of this package in Magma by attaching the `gluing/magma/spec` file with `AttachSpec`. To make this independent of the directory in which you find yourself, and to active this on startup by default, you may want to indicate the relative path in your `~/.magmarc` file, by adding the line
```
AttachSpec("~/Programs/gluing/magma/spec");
```

Usage
--

Examples are given in the directory `examples/`.

Verbose comments are enabled by
```
SetVerbose("Gluing", n);
```
where and `n` is either `1` or `2`. A higher value gives more comments.


Citing this code
--

These methods, as well as the upcoming geometric part of this package, are based on the Ph.D. thesis of Jeroen Hanselman at the Universität Ulm, which is work in progress. Please cite this work if this code has been helpful in your research.
