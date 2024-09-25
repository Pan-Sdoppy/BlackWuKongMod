local BaiYi = nil
local BaiShe = nil
local wukong = nil
local obj = nil

function getBaiYi()
    if BaiYi == nil then
        return FindFirstOf("Unit_GYCY_BaiYi_03_C")
    end
    return BaiYi
end

function getBaiShe()
    if BaiShe == nil then
        return FindFirstOf("Unit_GYCY_BaiYi_She_C")
    end
    return BaiShe
end

function getWuKong()
    if wukong == nil then
        return FindFirstOf("Unit_Player_Wukong_C")
    end
    return wukong
end

function getObj()
    if obj == nil then
        return StaticFindObject("/Script/b1-Managed.Default__BGUFunctionLibraryCS")
    end
    return obj
end

function addBlood()
    local wukong = getWuKong()
    local BaiYi = getBaiYi()
    local obj = getObj()
    obj:BGUSetAttrValue(wukong, 151, 875)
    obj:BGUSetAttrValue(BaiYi, 151, 29622.130859375)
end

function reduceAtk()
    local BaiYi = getBaiYi()
    local obj = getObj()
    obj:BGUSetAttrValue(BaiYi, 53, 30)
end

RegisterKeyBind(Key.L, function()
    --local cha = FindAllOf("BGUCharacter")
    --for index, value in ipairs(cha) do
    --    print(value:GetFullName())
    --end
    reduceAtk()
    local obj = getObj()
    local BaiYi = getBaiYi()
    print(obj:GetAttrValue(BaiYi, 1))
end)

ExecuteWithDelay(1500, function()
    print("GreatMonki2 Initialization...")
    RegisterHook("/Script/b1-Managed.InputActionEventReceiver:InputActionTrigger", function(Context, ActionName, TriggerEvent, InputActionValueType, InputActionValue)
        local InputAction = InputActionValueType:get()
        if InputAction == 0 then
            local wukong = getWuKong()
            local BaiYi = getBaiYi()
            local obj = getObj()
            local wukong_hp = obj:GetAttrValue(wukong, 151)
            local BaiYi_hp = obj:GetAttrValue(BaiYi, 151)
            if wukong_hp <= 100 then
                addBlood()
                return
            end
            -- 29622.130859375
            if BaiYi_hp <= 2000 then
                addBlood()
                return
            end
        end
    end)
end)