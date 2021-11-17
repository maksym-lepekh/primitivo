# run:
#   docker run -d --cap-add sys_ptrace -p127.0.0.1:2222:22 <image-name>
#
# ssh credentials:
#   user@password

FROM ubuntu:21.10

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

RUN apt-get update \
  && apt-get install -y ssh \
      build-essential \
      gcc \
      g++ \
      gdb \
      clang \
      make \
      ninja-build \
      autoconf \
      automake \
      locales-all \
      dos2unix \
      rsync \
      tar \
      python \
  && apt-get clean

RUN CMAKE_VER=3.20.6; \
    wget  https://github.com/Kitware/CMake/releases/download/v$CMAKE_VER/cmake-$CMAKE_VER-linux-x86_64.sh \
    && sh cmake-$CMAKE_VER-linux-x86_64.sh --skip-license --prefix=/usr \
    && rm -f cmake-$CMAKE_VER-linux-x86_64.sh

RUN ( \
    echo 'LogLevel DEBUG2'; \
    echo 'PermitRootLogin yes'; \
    echo 'PasswordAuthentication yes'; \
    echo 'Subsystem sftp /usr/lib/openssh/sftp-server'; \
  ) > /etc/ssh/sshd_config_test_clion \
  && mkdir /run/sshd

RUN useradd -m user \
  && yes password | passwd user

RUN usermod -s /bin/bash user

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config_test_clion"]