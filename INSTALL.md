# DynaRESF Installation

## Installation on Debian Testing

### Dynare Installation

As `root`:
```bash
apt install dynare
# apt install octave
```

The new system build of the preprocessor is not yet official.

In the mean time, you can download it from [Stéphane Adjemian personal site](https://dynare.adjemian.eu/preprocessor/).

Extract `dynare_m` file.

As `root`, replace Debian `dynare_m` executables with the new version:
```bash
cp dynare_m /usr/lib/dynare/matlab/dynare_m
cp dynare_m /usr/lib/dynare/matlab/preprocessor64/dynare_m
```

As user:
```bash
octave --eval "dynare model.mod"
    warning: This version of Octave is not supported. Consider installing version 4.2.1 of Octave,
    otherwise m files will be used instead of precompiled mex files and some features, like solution
    of models approximated at third order, will not be available.
    warning: called from
        dynare_config at line 97 column 5
        dynare at line 71 column 12

    warning: function /usr/lib/dynare/matlab/missing/corrcoef/tcdf.m shadows a core library function
    warning: called from
        dynare_config at line 140 column 1
        dynare at line 71 column 12
    warning: function /usr/lib/dynare/matlab/missing/corrcoef/corrcoef.m shadows a core library function
    warning: called from
        dynare_config at line 140 column 1
        dynare at line 71 column 12

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

    Using 64-bit preprocessor
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

    error: 'emptydatesobject' undefined near line 1 column 1
```

To cleanup generated files:
```bash
./clean.sh
```

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
