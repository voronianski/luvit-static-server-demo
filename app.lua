-- Simple static server luvit example

local path = require('path')
local server = require('web')
local log = require('log')
local static = require('static')
local clean = require('clean')
local root = path.join(__dirname, 'public')

local function app (req, res)
	local body

	-- custom response on specific url path
	if req.url.path == '/hello' then
		body = '<h1>Hello luvit static!</h1>'
		return res(200, {
			['Content-Type'] = 'text/html',
			['Content-Length'] = #body
		}, body)
	end

	body = 'Not Found'
	return res(404, {
		['Content-Type'] = 'text/plain',
		['Content-Length'] = #body
	}, body)
end

-- serve static files
app = static(app, {
	root = __dirname .. '/public',
	index = 'index.html',
	autoIndex = true
})

-- log all requests
app = log(app)
app = clean(app)

server.createServer('0.0.0.0', 9091, app)
print('Server started on 0.0.0.0:9091')
