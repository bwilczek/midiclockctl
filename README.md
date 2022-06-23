This is a simple CLI controller for the simple [midiclock](https://github.com/widdly/midiclock) application.
It uses [osc-ruby](https://github.com/aberant/osc-ruby) to send messages for `start`, `stop` and `tempo` change.

## Pre-requisites

* Linux-like OS
* Ruby
* `wget`, `unzip`, `gcc` with `alsa` and `lo` libraries

## Usage

```sh
# clone this repo (or download and unzip)
bundle install
bundle exec ruby midiclockctl.rb
```

On first execution `get_midiclock.sh` script is executed. It pulls `midiclock` source code from `github` and compiles it into an executable located in `./midiclock-master/midiclock`.

`midiclock` starts with BPM=120 and is ready to be connected to the instruments in ALSA patchbay, like `QJackCtl` or `Carla`.

The simple `REPL` console supports a handful of commands:

* `q` : quit
* `s` : stop clock
* `p` : start clock
* `any numeric value` : change tempo to given number

## About

This software is dedicated to my wife. Smart and beautiful, my true love and everlasting source of inspiration.

PS: Go dedicate your another pet project to your spouse. Appreciate that they tolerate your nerdiness.
