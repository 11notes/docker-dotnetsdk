FROM 11notes/dotnetsdk:9
RUN set -ex; \
  git clone https://github.com/some/repo; \
  cd ./repo; \
  dotnet msbuild -restore ..;