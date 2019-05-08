#!/usr/bin/env python

from setuptools import setup

NAME='pyoiz'
VERSION='0.1.1'
DESCRIB='Practicing to building FreeBSD Packages out of Python code'
LON_DESC='Why to say a lot?'
PROJ_URL='https://github.com/tonight-halfmoon/'
setup(name=NAME,
	version=VERSION,
	description=DESCRIB,
	long_description=LON_DESC,
	url=PROJ_URL,
	py_modules=['py'],
	setup_requires=["setuptools-pkg"],
	entry_points={
		'console_scripts': [ 'start_poiz=py:py_start',
				     'stop_poiz=py:py_stop' 
				]	
	}
     )
