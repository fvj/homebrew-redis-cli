# homebrew-redis-cli

Install a [redis-cli](http://redis.io/) via homebrew.

**original version in aoki/homebrew-redis-cli**, adapted to 7.4.2 and
more convenient (at least for me) installation.


## Bump formula

```
./bump ${VERSION} > redis-cli.rb
(brew info redis-cli && brew uninstall redis-cli) || exit 0
make install
redis-cli -v
```
