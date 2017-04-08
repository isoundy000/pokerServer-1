--[[
	获取公告列表
	@param id_pk
	@param note_title 公告标题
	@param note_context 公告内容（模板）
	@param note_level 公告等级 1优先级最高，数值越大优先级越低
	@param note_type 公告类型 如 0是系统公告，1是赢钱公告，2是礼物公告
	@param reach_condition 达成条件
	@param publish_time 发布时间
	@param is_publish 是否发布
	@param gift_id_fk 礼物id
	
]]--


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
end 

if  args.note_title and args.note_title ~= "" then 
user.note_title=args.note_title
end

if  args.note_context and args.note_context ~= "" then 
user.note_context=args.note_context
end


if  args.note_level and args.note_level ~= "" then 
user.note_level=args.note_level
end


if  args.note_type and args.note_type ~= "" then 
user.note_type=args.note_type
end

if  args.reach_condition and args.reach_condition ~= "" then 
user.reach_condition=args.reach_condition
end

if  args.publish_time and args.publish_time ~= "" then 
user.publish_time=args.publish_time
end

if  args.is_publish and args.is_publish ~= "" then 
user.is_publish=args.is_publish
end
if  args.gift_id_fk and args.gift_id_fk ~= "" then 
user.gift_id_fk=args.gift_id_fk
end

	-- 从数据库中查询
	ngx.log(ngx.INFO,"now query by database...")
	local userDbOp = userDb.new()
	local dbres,err = userDbOp.getBaseFromSql("select * from t_note",user,"and")
	if not dbres then 
		local  result = responeData.new_failed({},err)
		ngx.log(ngx.ERR,"fail to query by database, err:",err)
		return err
	end


local  result = responeData.new_success(dbres)
ngx.say(cjson.encode(result))
