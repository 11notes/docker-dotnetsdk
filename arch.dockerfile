# ╔═════════════════════════════════════════════════════╗
# ║                       SETUP                         ║
# ╚═════════════════════════════════════════════════════╝
# GLOBAL
  ARG APP_UID=1000 \
      APP_GID=1000

# :: FOREIGN IMAGES
  FROM 11notes/util:bin AS util


# ╔═════════════════════════════════════════════════════╗
# ║                       BUILD                         ║
# ╚═════════════════════════════════════════════════════╝
# :: APK
  FROM alpine AS build
  COPY ./build /
  ARG TARGETARCH \
      TARGETVARIANT \
      APP_VERSION

  RUN set -ex; \
    apk --update --no-cache add \
      pv \
      wget \
      tar \
      xz \
      jq;

  RUN set -ex; \
    SHA512=$(cat /sha512.json | jq -r '.sha512 | .[] | select(.version == "'${APP_VERSION}'") | .'${TARGETARCH}${TARGETVARIANT}''); \
    case "${TARGETARCH}${TARGETVARIANT}" in \
      "amd64") export TARGETARCH="x64";; \
      "armv7") export TARGETVARIANT="";; \
    esac; \
    wget -q --show-progress --progress=bar:force https://builds.dotnet.microsoft.com/dotnet/Sdk/${APP_VERSION}/dotnet-sdk-${APP_VERSION}-linux-musl-${TARGETARCH}${TARGETVARIANT}.tar.gz; \
    echo "${SHA512} dotnet-sdk-${APP_VERSION}-linux-musl-${TARGETARCH}${TARGETVARIANT}.tar.gz" | sha512sum -c; \
    pv dotnet-sdk-${APP_VERSION}-linux-musl-${TARGETARCH}${TARGETVARIANT}.tar.gz | tar xz -C /usr/local/bin;


# ╔═════════════════════════════════════════════════════╗
# ║                       IMAGE                         ║
# ╚═════════════════════════════════════════════════════╝
  # :: HEADER
  FROM 11notes/alpine:stable

  # :: default arguments
    ARG TARGETPLATFORM \
        TARGETOS \
        TARGETARCH \
        TARGETVARIANT \
        APP_IMAGE \
        APP_NAME \
        APP_VERSION \
        APP_ROOT \
        APP_UID \
        APP_GID \
        APP_NO_CACHE

  # :: default environment
    ENV APP_IMAGE=${APP_IMAGE} \
        APP_NAME=${APP_NAME} \
        APP_VERSION=${APP_VERSION} \
        APP_ROOT=${APP_ROOT}

  # :: multi-stage
    COPY --from=util / /
    COPY --from=build /usr/local/bin /usr/local/bin

# :: RUN
  USER root

  RUN set -ex; \
    apk --update --no-cache add \
      git \
      icu-data-full \
      icu-libs \
      lttng-ust \
      xz-libs \
      libunwind;

# :: EXECUTE
  ENTRYPOINT ["/usr/local/bin/dotnet"]
  CMD ["sdk", "check"]