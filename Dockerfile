# Cf https://mybinder.readthedocs.io/en/latest/dockerfile.html

# Cf https://hub.docker.com/r/cepremap/dynare-jupyter/tags/ for the latest version
FROM cepremap/dynare-jupyter:v0.1.4
LABEL maintainer="dynaresf@parlement-ouvert.fr"

# Install Python3 packages missing from `cepremap/dynare-jupyter` Docker image.
RUN python3 -m pip install --no-cache-dir altair
RUN python3 -m pip install --no-cache-dir ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension
RUN apt-get install -y curl gnupg2
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
RUN jupyter lab build

# Install R packages missing from `cepremap/dynare-jupyter` Docker image.
RUN R -e "devtools::install_github('rstudio/reticulate')"
# Allow jovyan user to install its own packages.
RUN chmod go+rw /usr/local/lib/R/site-library

# Set up a user whose uid is 1000.
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY *.ipynb ${HOME}/
COPY *.mod ${HOME}/
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Specify the default command to run.
EXPOSE 8888
ENTRYPOINT ["jupyter", "lab", "--ip", "0.0.0.0"]