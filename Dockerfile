FROM --platform=linux/amd64 mambaorg/micromamba:1.4.2
# Enforce that Linux platform is used for MacOS with ARM-SoC's

COPY --chown=$MAMBA_USER:$MAMBA_USER lock.yml /tmp/lock.yml
RUN micromamba install --yes --name base --file /tmp/lock.yml && \
    micromamba clean --all --yes

# (otherwise environment/python will not be found)
ARG MAMBA_DOCKERFILE_ACTIVATE=1 

# guarantee trouble-some libraries are loaded correctly
RUN python -c "import rasterio; import geopandas; import torch; import numpy; print('\nCould load libraries!\n');"

EXPOSE 8888
ENTRYPOINT [ "/usr/local/bin/_entrypoint.sh", "jupyter", "lab", "--port=8888", "--ip=0.0.0.0", "--no-browser", "--ServerApp.trust_xheaders=True", "--ServerApp.disable_check_xsrf=False", "--ServerApp.allow_remote_access=True", "--ServerApp.allow_origin='*'"]
