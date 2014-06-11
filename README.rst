date_age - Lasso 8 Custom Tag Returns Age in Years
##################################################

Read the article `date_age - Lasso 8 Custom Tag Returns Age in Years
<http://www.stevepiercy.com/articles/date_age-lasso-8-custom-tag-returns-age-in-years/>`_.

Description
===========

``[date_age]`` returns age in years. By default the current date is used to
determine age, but can be overridden by passing in a second date.

Demo
====

`Demo <http://www.stevepiercy.com/lasso/date_age_demo/>`_.

Usage
=====

.. code-block:: lasso

    date_age(-dob=date('2000-02-29'));
    '<br />';
    date_age(-dob=date('2000-02-28'), -end=date('2010-03-01'));

.. code-block:: text

    =>
    10
    10


Installation
============

Instructions for installing ``date_age`` are in the demo file
``date_age_demo/index.lasso``.
