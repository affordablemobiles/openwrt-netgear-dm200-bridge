module("luci.controller.admin.custom", package.seeall)

function index()
    local a = entry({"a1comms", "status", "json"}, template("custom/status_json"))
    a.sysauth = false
    a.dependent = false
end