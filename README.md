mruby-build-server
====

mruby build server written in mod_mruby.

All you have to do is to post your own build_config.rb to mruby-build-server. Then, you can get compiled binary (libmruby.a) without CRuby or C compiler on your local PC. 

## Installation

```bash
./setup.sh
```

## Usage

```bash
curl -d "`cat /path/to/build_confg.rb`" http://hostname:8080/mruby-build
```

## Demo

## Development

You can run this on local dev environment. You need to prepare `docker`.

## Author

[Jun Uchino](https://github.com/ujun)

