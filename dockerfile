FROM quay.io/fedora/fedora-bootc:44

RUN dnf -y install \
    greetd \
    greetd-selinux \
    NetworkManager \
    niri \
    quickshell \
    cage \
    && dnf clean all

RUN systemctl enable greetd.service
