local cjson = require "cjson"
local request_method = ngx.var.request_method
local args = ""
local request_uri = ngx.var.request_uri
if "POST" == request_method then
    ngx.req.read_body()
    local args = ngx.req.get_post_args()
    local param = ""
    for key, val in pairs(args) do
        param = key
    end
    param = cjson.decode(param)
    ngx.var.urlParams = request_uri.."?username="..tostring(param.username).."&sign="..tostring(param.sign).."&timestamp="..tostring(param.timestamp)
else
    ngx.var.urlParams = request_uri
end
