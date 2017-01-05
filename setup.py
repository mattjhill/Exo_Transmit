from setuptools import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy as np

ext_modules=[
    Extension("exotransmit.exotransmit",
              sources=["exotransmit/exotransmit.pyx"],
              include_dirs=[np.get_include(), "cextern"],
              libraries=["m"] # Unix-like specific
    )
]

setup(
  name = "exotransmit",
  packages=['exotransmit'],
  ext_modules = cythonize(ext_modules),
  package_data = {'exotransmit' : ['data/Opac/*', 'data/EOS/*', 'data/T_P/*']},
  zip_safe=False
)