--[[
	首页的渲染文件
]]
local template = require "resty.template"
local reqArgs = require "common.request_args"
local responeData = require"common.api_data_help"
local cjson = require "cjson"
local session =require "resty.session".open()

local currentRequestArgs = reqArgs.new()
local args = currentRequestArgs.getArgs()



-- session必须开启缓存才能够使用，为了便捷开发，先不判断，而是直接跳转到index页面

-- if args.token == session.data.token then 
-- 	-- 从登陆跳过来，带了token才能跳转到html/index.html界面
-- 	local address="/html/index.html"
-- 	local model={}
-- 	template.render(address,model)
-- else
-- 	result = responeData.new_failed({},err)
-- end
	local address="/html/index.html"
	-- local model={index_address="http://localhost/api/html/index?token="..session.data.token}

	-- 这里也是一样的，先用没有token的
	local model={}
	template.render(address,model)