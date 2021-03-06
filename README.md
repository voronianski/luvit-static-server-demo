# luvit static server demo

Started to play with [luvit.io](http://luvit.io/).

### How to

You need to have [Lua ``>= 5.1``](http://www.lua.org/download.html) installed on your machine, as well as [Luvit](https://github.com/luvit/luvit).

If you are on Mac OS X and have homebrew, just type:

```bash
$: brew install lua
```

and

```bash
$: brew install luvit
```

Then clone this repo and start ``app.lua`` to see demo application in action:

```bash
$: git clone http://github.com/voronianski/luvit-static-server-demo
$: cd luvit-static-server-demo
$: luvit app.lua
```

And then check ``http://localhost:9091`` in your browser.

### Packages

Modules that were used in this example are stored in [luvit github organization](https://github.com/luvit) and created by [Tim Caswell](https://github.com/creationix).

Unfortunately luvit misses package manager to handle dependencies in a simple manner currently. Join the discussion [here](https://groups.google.com/forum/#!topic/luvit/t-jOagzoog0).

---

MIT Licensed
