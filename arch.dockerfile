# ╔═════════════════════════════════════════════════════╗
# ║                       SETUP                         ║
# ╚═════════════════════════════════════════════════════╝
  # GLOBAL
  ARG APP_UID=1000 \
      APP_GID=1000 \
      APP_VERSION=8

  # :: FOREIGN IMAGES
  FROM 11notes/util:bin AS util

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

# :: RUN
  USER root

  # :: install sdk
    RUN set -ex; \
      apk --update --no-cache add \
        git \
        dotnet${APP_VERSION}-hostfxr \
        dotnet${APP_VERSION}-sdk \
        dotnet${APP_VERSION}-dbg;

    RUN set -ex; \
      if [ "${APP_VERSION}" == "9" ]; then \
        apk --update --no-cache add \
          dotnet${APP_VERSION}-sdk-aot; \
      fi;