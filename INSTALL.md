# DynaRESF Installation

## Installation on Debian Testing

### JupyterLab Installation

Cf:
* http://jupyter.org/install
* http://jupyterlab.readthedocs.io/en/stable/getting_started/installation.html

As user:
```bash
python3 -m pip install jupyter
python3 -m pip install jupyterlab
```

Start JupyterLab using:
```bash
jupyter lab
```

### Dynare Installation

Cf https://github.com/DynareTeam/dynare/tree/master

As `root`:
```bash
apt install octave

# To compile Dynare:
apt build-dep dynare

```

The new system build of the preprocessor is not yet official.

In the mean time, you must use development version of Dynare => As user:
```bash
git clone --recursive https://github.com/DynareTeam/dynare.git
cd dynare
autoreconf -si
./configure --disable-matlab
    Dynare is now configured for building the following components...

    Binaries (with "make"):
        MEX files for Octave (except those listed below):                   yes
        MS-SBVAR MEX files for Octave:                                      yes
        Kalman Steady State MEX file for Octave:                            yes
        K-order and dynare_simul MEX for Octave:                            yes
        Linsolve for Octave:                                                no (Octave >= 3.8)
        Ordschur for Octave:                                                no (Octave >= 4.0)
make
sudo make install
cd ..
```

### DynaRESF Installation

```bash
git clone https://framagit.org/parlement-ouvert/dynaresf.git
```

## DynaRESF Usage

```bash
cd dynaresf/
octave --eval "addpath /usr/local/lib/dynare/matlab/; dynare model.mod"
    warning: function /usr/local/lib/dynare/matlab/missing/corrcoef/tcdf.m shadows a core library function
    warning: called from
        dynare_config at line 142 column 1
        dynare at line 69 column 12
    warning: function /usr/local/lib/dynare/matlab/missing/corrcoef/corrcoef.m shadows a core library function
    warning: called from
        dynare_config at line 142 column 1
        dynare at line 69 column 12

    Configuring Dynare ...
    [mex] Generalized QZ.
    [mex] Sylvester equation solution.
    [mex] Kronecker products.
    [mex] Sparse kronecker products.
    [mex] Local state space iteration (second order).
    [mex] Bytecode evaluation.
    [mex] k-order perturbation solver.
    [mex] k-order solution simulation.
    [mex] Quasi Monte-Carlo sequence (Sobol).
    [mex] Markov Switching SBVAR.

    warning: X13 is not available!
    warning: called from
        initialize_dseries_toolbox at line 85 column 5
        dynare_config at line 248 column 1
        dynare at line 69 column 12
    Using 64-bit preprocessor
    Starting Dynare (version 4.6-unstable).
    Calling Dynare with arguments:
    {
        [1,1] = stochastic
    }
    Starting preprocessing of the model file ...
    Found 3 equation(s).
    Evaluating expressions...done
    Computing static model derivatives:
        - order 1
    Computing dynamic model derivatives:
        - order 1
        - order 2
    Processing outputs ...
    done
    Preprocessing completed.


    STEADY-STATE RESULTS:

    y1 		 0
    y2 		 0
    y3 		 0

    EIGENVALUES:
            Modulus             Real        Imaginary

                0.7              0.7                0
                0.8              0.8                0
                0.9              0.9                0


    There are 0 eigenvalue(s) larger than 1 in modulus
    for 0 forward-looking variable(s)

    The rank condition is verified.

    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    warning: struct: converting a classdef object into a struct overrides the access restrictions defined for properties. All properties are returned, including private and protected ones.
    warning: called from
        model at line 189 column 2
        dynare at line 271 column 1
    Total computing time : 0h00m01s
    Note: warning(s) encountered in MATLAB/Octave code
```

To cleanup generated files:
```bash
./clean.sh
```
