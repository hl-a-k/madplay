以下是madplay使用示例。
有两个关键参数： --no-tty-control 允许后台运行 --audio-type 用来增加标识，用于关闭特定铃声
`
madplay --no-tty-control --audio-type 1-1 -Q  -r -a -15 -t 30 /usr/app/ring/ringtone1.mp3&
madplay --no-tty-control --audio-type 1-2 -Q  -r -a -15  /usr/app/ring/ringtone1.mp3 &
madplay --no-tty-control --audio-type 1-1 -Q  -r -a -15  /vfat/audio/foreverLove.mp3 &
`

以下是特定铃声关闭该当

`
ps | grep 'audio-type 1-1' | grep -v grep | awk '{print $1}' | xargs kill -9
ps | grep 'audio-type 1-2' | grep -v grep | awk '{print $1}' | xargs kill -9
`

以下是暂停所有铃声 200ms
`
killall -SIGUSR1 madplay
`