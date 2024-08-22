FROM alpine:3.20.2

USER root

RUN apk add dpkg

VOLUME /QLC/pkg

ARG QLC_VERSION=4.13.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb /QLC/pkg

RUN dpkg -i /QLC/pkg/qlcplus_${QLC_VERSION}_amd64.deb

WORKDIR /QLC

ADD S7_Qlc_Plus.qxw /QLC/

CMD qlcplus -w -o S7_Qlc_Plus.qxw -p -wp 9999