--[[
	删除礼物类型  根据id或者礼品类型名称删除对应的礼品类型
	@param id_pk
	@param gift_name
]]

local cjson = require "cjson"
local userDb = require "db.base_db"
local reqArgs = require "common.request_args"
local responeData = require "common.api_data_help"

-- 获取参数
local currentRequestArgs = reqArgs.new()
local args = currentRequestArgs.getArgs()
local user ={}

if args.id_pk and args.id_pk~="" then
user.id_pk=args.id_pk
else 
	local  result = responeData.new_failed({},zhCn_bundles.db_parm_error)
	ngx.say(cjson.encode(result))
	return 
end 

-- if args.gift_name and args.gift_name~="" then 
-- user.gift_name=args.gift_name
-- end


local userDbOp = userDb.new()
local res,error=userDbOp.deleteBasefromSql("t_gift_type",user)
if not res then 
	local  result = responeData.new_failed({},error)
	ngx.say(cjson.encode(result))
	return 
end

local  result = responeData.new_success({})
ngx.say(cjson.encode(result))