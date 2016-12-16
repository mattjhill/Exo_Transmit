import numpy as np
cimport numpy as np
from libc.stdio cimport printf

DTYPE = np.float64
ctypedef np.float64_t DTYPE_t

cdef extern from "vars.h":
    ctypedef struct vars:
        int NTAU

        int NTEMP
        double TLOW
        double THIGH

        int NPRESSURE
        double PLOW
        double PHIGH
        double THRESHOLD
        double RAYLEIGH

        int NLAMBDA
        double G
        double R_PLANET
        double R_STAR
        double T_STAR

        char* tpfname

cdef extern from "getVars.c":
    vars getVars()


cdef extern from "atmos.h":
    pass

cdef extern from "opac.h":
    pass

cdef extern from "nrutil.h":
    pass

cdef extern from "nrutil.c":
    pass

cdef extern from "constant.h":
    pass

cdef extern from "prototypes.h":
    pass

cdef extern from "readchemtable.c":
    pass

cdef extern from "read_t_p.c":
    pass

cdef extern from "rt_transmission.c":
    pass

cdef extern from "geometry.c":
    pass

cdef extern from "utils.c":
    pass

cdef extern from "planck.c":
    pass

cdef extern from "totalopac.c":
    pass 

cdef extern from "getChemSelection.c":
    pass

cdef extern from "getFileArray.c":
    pass

cdef extern from "getNTau.c":
    pass

cdef extern from "interpol.c":
    pass

cdef extern from "stdio.h":
    pass

cdef extern from "readopactable.c":
    pass

cdef extern from "main_transmission.c":
    void transmission(vars variables, double* wavelength, double* flux)

def get_spectrum(n_tau=334, n_temp=30, T_low=100.0, T_high=3000.0, n_pressure=13, P_low=1.0e-4, P_high=1.0e8, 
    threshold=0.0, rayleigh=1.0, n_lambda=7454, g=9.8, R_planet=6.40e+6, R_star=7.00e+8, tpfname='T_P/t_p_800K.dat'):
    """
    Run ExoTransmit main to produce a transmission spectrum
    """
    cdef vars variables
    variables.NTAU = n_tau

    variables.NTEMP = n_temp
    variables.TLOW = T_low
    variables.THIGH = T_high

    variables.NPRESSURE = n_pressure
    variables.PLOW = P_low
    variables.PHIGH = P_high
    variables.THRESHOLD = threshold
    variables.RAYLEIGH = rayleigh

    variables.NLAMBDA = n_lambda
    variables.G = g
    variables.R_PLANET = R_planet
    variables.R_STAR = R_star

    cdef bytes b_tpfname = tpfname.encode()
    variables.tpfname = b_tpfname

    cdef np.ndarray[DTYPE_t, ndim=1] wavelength = np.empty(variables.NLAMBDA, dtype=DTYPE)
    cdef np.ndarray[DTYPE_t, ndim=1] flux = np.empty(variables.NLAMBDA, dtype=DTYPE)
    transmission(variables, <double*> wavelength.data, <double*> flux.data)
    return wavelength, flux
