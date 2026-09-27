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

echo NAME="Charoite"
echo ID="fedora_linux_charoite"
echo ID_LIKE="rhel fedora"
echo PRETTY_NAME="Charoite (Rough)"

EOF
