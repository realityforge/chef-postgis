Description
===========

[![Build Status](https://secure.travis-ci.org/realityforge/chef-postgis.png?branch=master)](http://travis-ci.org/realityforge/chef-postgis)

The postgis cookbook installs and configures the Postgis Postgresql extension and creates a GIS enabled database template.

Requirements
============

* the `postgresql` cookbook

Attributes
==========

* `node['postgis']['template_name']` - The name of the gis database template. Defaults to "template_postgis". Set to nil to disable the creation of the template.

Usage
=====

There is one recipe provided:

* `postgis::default` - Install the Postgis binaries and create the template. Note: this includes the postgresql::server after installing the postgis binaries.

However it should be noted that it is best setup the locale so that the encoding is the desired database encoding prior to including the recipe. Typically this is set via a snippet such as;

    node.override['locale']['lang'] = 'en_AU.UTF-8'
    include_recipe 'locale::default'

    include_recipe 'postgis::default'
