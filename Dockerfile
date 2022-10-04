#
# Dockerfile for yt-dlp
#

FROM python:3.10-slim
MAINTAINER Tanja84DK <tanja84dk@gmail.com>

COPY --from=mwader/static-ffmpeg /ffmpeg /usr/local/bin/
COPY --from=mwader/static-ffmpeg /ffprobe /usr/local/bin/

RUN pip3 install yt-dlp

# Try to run it so we know it works
RUN yt-dlp --version

WORKDIR /data

ENTRYPOINT ["yt-dlp"]
CMD ["--help"]
