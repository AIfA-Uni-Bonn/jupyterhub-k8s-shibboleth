FROM jupyterhub/k8s-hub:0.11.1

# used from main hub Dockerfile
ARG NB_USER=jovyan
ARG NB_UID=1000
ARG HOME=/home/jovyan

USER root

# add additional requirements
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt && rm -f requirements.txt



# copy an additional template into the jupytehub folder
#
# necessary for the updated shibboleth authenticator
COPY templates/* /usr/local/share/jupyterhub/templates




USER ${NB_USER}
