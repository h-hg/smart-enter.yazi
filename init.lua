local is_windows = ya.target_family() == "windows"

local function enterable(dir)
  if is_windows then
    return true
  end
  if not dir.cha.is_exec then
    return false
  end
  local username = ya.user_name(ya.uid())
  if username == "root" then
    return true
  end
  local perms = dir.cha:permissions()
  if dir.cha.uid == ya.uid() then
    if perms:sub(4, 4) ~= "x" and perms:sub(4, 4) ~= "t" then
      ya.notify {
        title = "Permission denied",
        content = "The user(" .. username .. ") hasn't permission.",
        timeout = 2,
        level = "error"
      }
      return false
    end
    return true
  elseif dir.cha.gid == ya.gid() then
    if perms:sub(7, 7) ~= "x" and perms:sub(7, 7) ~= "t" then
      ya.notify {
        title = "Permission denied",
        content = "The group(" .. ya.group_name(ya.gid()) .. ") hasn't permission.",
        timeout = 2,
        level = "error"
      }
      return false
    end
    return true
  else
    if perms:sub(10, 10) ~= "x" and perms:sub(10, 10) ~= "t" then
      ya.notify {
        title = "Permission denied",
        content = "The user " .. username .. " and group(" .. ya.group_name(ya.gid()) .. ") hasn't permission.",
        timeout = 2,
        level = "error"
      }
      return false
    end
    return true
  end
end

return {
  entry = function()
    local h = cx.active.current.hovered
    if h.cha.is_dir then
      if enterable(h) then
        ya.manager_emit("enter", { hovered = true })
      end
    else
      ya.manager_emit("open", { hovered = true })
    end
  end,
}
