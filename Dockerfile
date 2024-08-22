FROM alpine@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5

USER root

RUN apk add dpkg

WORKDIR /QLC/pkg

ARG QLC_VERSION=4.12.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb /QLC/pkg

RUN dpkg -i /QLC/pkg/qlcplus_${QLC_VERSION}_amd64.deb

VOLUME /QLC

CMD qlcplus -w -o /QLC/Qlc_Plus_PRJ.qxw -p -wp 9999
