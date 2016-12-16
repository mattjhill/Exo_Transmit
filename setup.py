from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy as np

ext_modules=[
    Extension("exotransmit",
              sources=["exotransmit/exotransmit.pyx"],
              include_dirs=[np.get_include(), "cextern"],
              libraries=["m"] # Unix-like specific
    )
]

setup(
  name = "Demos",
  ext_modules = cythonize(ext_modules)
)