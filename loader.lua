-- Xinnz Hub | Protected Loader --
local _lKoQvbA = 7823 + (44 - 44)
local _GnMzXpR = 3190 + (17 - 17)
local _HtWsIcJ = 5541 + (62 - 62)
local _RbYqFoN = 8274 + (33 - 33)
local _VxDmEuP = 2963 + (81 - 81)

local function _WqYtBcNa(_KpLmRoZ, _DsVfHjX)
    local _TnGwAkQ = {}
    for _UeObMiP = 1, #_KpLmRoZ do
        _TnGwAkQ[_UeObMiP] = string.char(bit32.bxor(_KpLmRoZ[_UeObMiP], _DsVfHjX))
    end
    return table.concat(_TnGwAkQ)
end

-- Key: 7 + 13 + 21 + 6 = 47
local _CxPnFqI = 7
local _YrOkLsH = 13
local _MvBdWaT = 21
local _ZjEnGcU = 6
local _QhXtRwK = _CxPnFqI + _YrOkLsH + _MvBdWaT + _ZjEnGcU

-- URL encoded (XOR key=47):
-- "https://YOURAPP.vercel.app/load"
-- Ganti chunk di bawah dengan URL Vercel kamu (pakai encoder: https://xor.pw)
-- Atau tempel URL plain di _XinnzRaw lalu hapus bagian decode
local _ChunkA = {87,109,109,93,122,27,56,56}
local _ChunkB = {89,94,120,99,95,88,105,95}
local _ChunkC = {95,27,108,83,99,100,93,89}
local _ChunkD = {27,124,94,81,104,85,91,56}
local _ChunkE = {92,94,126,93}

-- ─────────────────────────────────────────────────────────────
-- CARA MUDAH: hapus bagian decode di atas, aktifkan baris ini:
-- local _XinnzRaw = "https://YOURAPP.vercel.app/load"
-- ─────────────────────────────────────────────────────────────

local _XinnzMerge = {}
for _,v in ipairs(_ChunkA) do table.insert(_XinnzMerge, v) end
for _,v in ipairs(_ChunkB) do table.insert(_XinnzMerge, v) end
for _,v in ipairs(_ChunkC) do table.insert(_XinnzMerge, v) end
for _,v in ipairs(_ChunkD) do table.insert(_XinnzMerge, v) end
for _,v in ipairs(_ChunkE) do table.insert(_XinnzMerge, v) end
local _XinnzRaw = _WqYtBcNa(_XinnzMerge, _QhXtRwK)

local _NpKwVeB = math.floor(math.pi * 74) % 19
local _FsAqLoD = math.floor(math.pi * 31) % 7
local _JuYcMxH = math.floor(math.pi * 58) % 23

local function _PdRmVnOq(_BgTeShIk)
    local _ZoWfCuJx = nil
    pcall(function()
        local _r = game:HttpGet(_BgTeShIk, true)
        if type(_r) == 'string' and #_r > 200 then _ZoWfCuJx = _r end
    end)
    if _ZoWfCuJx then return _ZoWfCuJx end
    local _fn = rawget(_G,'request') or rawget(_G,'http_request')
        or (rawget(_G,'syn') and rawget(syn,'request'))
    if _fn then
        pcall(function()
            local _r = _fn({Url=_BgTeShIk, Method='GET'})
            if _r and type(_r.Body)=='string' and #_r.Body > 200 then
                _ZoWfCuJx = _r.Body
            end
        end)
    end
    return _ZoWfCuJx
end

local function _KeVwBzRm()
    local _plr = game:GetService('Players').LocalPlayer
    local _pg  = _plr:WaitForChild('PlayerGui')
    local _sg  = Instance.new('ScreenGui')
    _sg.Name='_XL4829' _sg.ResetOnSpawn=false
    _sg.DisplayOrder=999999 _sg.IgnoreGuiInset=true _sg.Parent=_pg
    local _bg=Instance.new('Frame',_sg)
    _bg.Size=UDim2.fromScale(1,1)
    _bg.BackgroundColor3=Color3.fromRGB(7,5,16) _bg.BorderSizePixel=0
    local _lbl=Instance.new('TextLabel',_bg)
    _lbl.Size=UDim2.new(1,0,0,60) _lbl.Position=UDim2.new(0,0,0.4,0)
    _lbl.BackgroundTransparency=1 _lbl.TextColor3=Color3.fromRGB(65,102,250)
    _lbl.Font=Enum.Font.GothamBold _lbl.TextSize=24
    _lbl.Text='\226\151\134 Xinnz Hub'
    local _sub=Instance.new('TextLabel',_bg)
    _sub.Size=UDim2.new(1,0,0,20) _sub.Position=UDim2.new(0,0,0.55,0)
    _sub.BackgroundTransparency=1 _sub.TextColor3=Color3.fromRGB(80,80,130)
    _sub.Font=Enum.Font.Gotham _sub.TextSize=12 _sub.Text='Loading...'
    local _bb=Instance.new('Frame',_bg)
    _bb.Size=UDim2.new(0.38,0,0,3) _bb.Position=UDim2.new(0.31,0,0.63,0)
    _bb.BackgroundColor3=Color3.fromRGB(20,16,45) _bb.BorderSizePixel=0
    Instance.new('UICorner',_bb).CornerRadius=UDim.new(1,0)
    local _bar=Instance.new('Frame',_bb)
    _bar.Size=UDim2.fromScale(0,1) _bar.BackgroundColor3=Color3.fromRGB(65,102,250)
    _bar.BorderSizePixel=0
    Instance.new('UICorner',_bar).CornerRadius=UDim.new(1,0)
    local _TS=game:GetService('TweenService')
    local function _sb(p,m)
        pcall(function()
            _TS:Create(_bar,TweenInfo.new(0.4,Enum.EasingStyle.Quad),{Size=UDim2.fromScale(p,1)}):Play()
            _sub.Text=m or ''
        end)
    end
    task.wait(0.35) _sb(0.2,'Connecting...')
    task.wait(0.25) _sb(0.45,'Downloading...')
    local _src=_PdRmVnOq(_XinnzRaw)
    if not _src then
        _lbl.TextColor3=Color3.fromRGB(220,60,60) _lbl.Text='[X] Failed'
        _sub.Text='Check URL or HTTP.' task.wait(4)
        pcall(function() _sg:Destroy() end) return
    end
    _sb(0.78,'Compiling...') task.wait(0.2)
    local _fn,_er=loadstring(_src)
    if not _fn then
        _lbl.TextColor3=Color3.fromRGB(220,60,60) _lbl.Text='[X] Error'
        _sub.TextSize=9 _sub.Text=tostring(_er):sub(1,80)
        task.wait(5) pcall(function() _sg:Destroy() end) return
    end
    _sb(1,'Launching...') task.wait(0.3)
    pcall(function() _sg:Destroy() end) _fn()
end
_KeVwBzRm()
