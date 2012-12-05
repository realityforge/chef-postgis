Description
===========

[![Build Status](https://secure.travis-ci.org/realityforge/chef-postgis.png?branch=master)](http://travis-ci.org/realityforge/chef-postgis)

The postgis cookbook installs and configures the Postgis Postgresql extension and creates a GIS enabled database template.

Requirements
============

* the `postgresql` cookbook

Attributes
==========

* `node['postgis']['template_name']` - The name of the gis database template. Defaults to "template_postgis".

Usage
=====

There is one recipe provided:

* `postgis::default` - Install the Postgis binaries.
