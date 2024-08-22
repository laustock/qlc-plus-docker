FROM debian@sha256:382967fd7c35a0899ca3146b0b73d0791478fba2f71020c7aa8c27e3a4f26672

USER root

WORKDIR /QLC/pkg

ARG QLC_VERSION=4.13.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb /QLC/pkg

RUN dpkg --add-architecture amd64
RUN dpkg -i qlcplus_${QLC_VERSION}_amd64.deb

VOLUME /QLC

CMD qlcplus -w -o /QLC/Qlc_Plus_PRJ.qxw -p -wp 9999
