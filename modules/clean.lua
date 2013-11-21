-- Clean middleware adds missing Date and Server headers, auto chunked encoding, etc..

local iStream = require('core').iStream
local stringFormat = require('string').format
local osDate = require('os').date

return function (app)
  return function (req, res)
    app(req, function (code, headers, body)
      local hasDate = false
      local hasServer = false
      local hasContentLength = false
      for name in pairs(headers) do
        name = name:lower()
        if name == "date" then hasDate = true end
        if name == "server" then hasServer = true end
        if name == "content-length" then hasContentLength = true end
        if name == "transfer-encoding" then hasContentLength = true end
      end
      if not hasDate then
        headers['Date'] = osDate("!%a, %d %b %Y %H:%M:%S GMT")
      end
      if not hasServer then
        headers['Server'] = "Luvit " .. process.version
      end
      if not hasContentLength then
        if type(body) == "string" then
          headers["Content-Length"] = #body
        elseif type(body) == "table" then
          headers["Transfer-Encoding"] = "chunked"
          local originalStream = body
          body = iStream:new()
          originalStream:on("data", function (chunk)
            body:emit("data", stringFormat("%X\r\n%s\r\n", #chunk, chunk))
          end)
          originalStream:on("end", function ()
            body:emit("data", stringFormat("0\r\n\r\n\r\n"))
            body:emit("end")
          end)
        end
      end
      res(code, headers, body)
    end)
  end
end