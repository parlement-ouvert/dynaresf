# Cf https://mybinder.readthedocs.io/en/latest/dockerfile.html

FROM cepremap/dynare-jupyter:stable
LABEL maintainer="dynaresf@parlement-ouvert.fr"

# Set up a user whose uid is 1000.
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY dynaresf.ipynb ${HOME}/
COPY model.mod ${HOME}/
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Specify the default command to run.
CMD ["jupyter", "lab", "--ip", "0.0.0.0"]