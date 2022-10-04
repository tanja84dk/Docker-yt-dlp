yt-dlp
==========

[`yt-dlp`][1] is a small command-line program to download videos from
<https://www.youtube.com/> and a few more sites and a fork of the original [`youtube-dl`][2].

[`yt-dlp`][1] is a [`youtube-dl`][2] fork based on the now inactive [`yt-dlc`][5]. The main of yt-dlp is adding new features and patches while also keeping up to date with the original project.

Inspired By
==========
Got originally inspired by [`vimagick/youtube-dl`][3] to create the container after had used his for long time and most of the time loved it.

And after a lot of testing I chose then to create my own based on python’s docker image (slim version) instead of the alpine image because had in some edge cases some issues using alpine.

## Tutorial

```sh
docker run --rm -u $(id -u):$(id -g) -v $(PWD):/data tanja84dk/yt-dlp url
```

The -u is to set the userid and groupid that the files are saved as

/data is the working directory

Just as a example how I use it myself ( If its one long command and not two commands just in case it wraps to two lines )

```sh
docker run --rm -u 1000:1000 -v /mnt/configs/yt-dlp/.cache:/.cache -v /mnt/configs/yt-dlp:/data -v /mnt/Archive/Downloads:/data/Download tanja84dk/yt-dlp --config-location /data/.config/full.conf videolink
```

And I have this folder structure on the host that for me I mount in.

/mnt/config/yt-dlp/{.cache, .config}  
/mnt/Archive/Downloads

I store my difference output configurations in /mnt/configs/Youtube/.config

## Credits
 - Credit to [`youtube-dl`][2] for the original project Licensed under [`The Unlicense`][7]
 - Credit to [`yt-dlp`][1] for their updated fork of youtube-dl Licensed under [`The Unlicense`][6]
 - Credit to [`wader`][4] for making static compiled binaries for ffmpeg Licensed under [`MIT`][8] wich I'm using in this image to limit the numbers of dependencies 


[1]: https://github.com/yt-dlp/yt-dlp
[2]: https://ytdl-org.github.io/youtube-dl/
[3]: https://hub.docker.com/r/vimagick/youtube-dl
[4]: https://github.com/wader/static-ffmpeg
[5]: https://github.com/blackjack4494/yt-dlc
[6]: https://github.com/yt-dlp/yt-dlp/blob/master/LICENSE
[7]: https://github.com/ytdl-org/youtube-dl/blob/master/LICENSE
[8]: https://github.com/wader/static-ffmpeg/blob/master/LICENSE
