FROM 11notes/dotnetsdk:8
RUN set -ex; \
  git clone https://github.com/some/repo; \
  cd ./repo; \
  dotnet msbuild -restore ..;