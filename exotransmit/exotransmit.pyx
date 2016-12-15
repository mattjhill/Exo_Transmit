cdef extern from "vars.h":
    pass

cdef extern from "getVars.c":
    pass

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
    int main()

def get_spectrum():
    """
    Run ExoTransmit main to produce a transmission spectrum
    """
    main()
