FROM quay.io/fedora/fedora-bootc:44

RUN <<EOF

dnf -y install \
    greetd \
    greetd-selinux \
    NetworkManager \
    niri \
    quickshell \
    cage \
    && dnf clean all

systemctl enable greetd.service

bootc container lint


sed -i -E '/^(NAME|PRETTY_NAME|VARIANT|VARIANT_ID)=/d' /usr/lib/os-release

printf '%s\n' \
    'NAME="Charoite"' \
    'ID="fedora_linux_charoite"' \
    'ID_LIKE="rhel fedora"' \
    'PRETTY_NAME="Charoite (Rough)"' >> /usr/lib/os-release

EOF
