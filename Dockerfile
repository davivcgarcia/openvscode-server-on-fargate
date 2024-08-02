FROM gitpod/openvscode-server:latest

# Change to a priviledged user to be able to install packages
USER root

# Make sure the system packages are updates and install prerequisites
RUN apt-get -y update && apt-get -y upgrade &&  \ 
    apt-get install --no-install-recommends \
    -y unzip curl ncat iproute2 dnsutils less python3-boto3 nfs-common && \
    rm -rf /var/lib/apt/lists/*

# Installs AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install --bin-dir /usr/bin --install-dir /usr/local/aws-cli --update

# Add extra argument for the connection token
ENV OPENVSCODE_CONN_TOKEN=changeme

# Restore default user required for the web interface
USER openvscode-server

ENTRYPOINT [ "/bin/sh", "-c", "exec ${OPENVSCODE_SERVER_ROOT}/bin/openvscode-server --host 0.0.0.0 --connection-token ${OPENVSCODE_CONN_TOKEN} \"${@}\"", "--" ]