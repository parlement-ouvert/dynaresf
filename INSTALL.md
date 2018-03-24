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

### Dynare Preprocessor Installation

The new system build of the preprocessor is not yet official.

In the mean time, you can download it from [Stéphane Adjemian personal site](https://dynare.adjemian.eu/preprocessor/).

Extract `dynare_m` file to repository. Then test it:
```bash
./dynare_m model.mod
./clean.sh
```
