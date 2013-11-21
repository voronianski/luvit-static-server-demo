-- simple hello world http server

local http = require('http')

function handler (req, res)
	local body = '<h1>Hello Lua Server!</h1>'

	res:writeHead(200, {
		['Content-Type'] = 'text/html',
		['Content-Lenght'] = #body
	});
	res:finish(body)
end

http.createServer(handler):listen(9999)

print('lua server started at localhost:9999')
