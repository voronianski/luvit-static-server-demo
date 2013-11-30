local http = require('http')
local Stack = require('stack')

http.createServer(Stack.stack(
	function (req, res, nxt)
		p('first middleware')
		nxt()
	end,
	function (req, res, nxt)
		p('second middleware')
		res:finish('Stack example')
	end
)):listen(8081)
