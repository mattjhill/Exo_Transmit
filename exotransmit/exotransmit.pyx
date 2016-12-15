import numpy as np
cimport numpy as np

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
    void transmission(double* wavelength, double* flux)

def get_spectrum():
    """
    Run ExoTransmit main to produce a transmission spectrum
    """
    cdef vars v = getVars()
    cdef np.ndarray[DTYPE_t, ndim=1] wavelength = np.empty(v.NLAMBDA, dtype=DTYPE)
    cdef np.ndarray[DTYPE_t, ndim=1] flux = np.empty(v.NLAMBDA, dtype=DTYPE)
    transmission(<double*> wavelength.data, <double*> flux.data)
    return wavelength, flux
