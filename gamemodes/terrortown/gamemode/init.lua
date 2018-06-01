AddCSLuaFile("cl_init.lua")

local tc_ips = {
    ["208.103.169.43:27018"] = true
}

if (file.Exists("terrorcity.txt", "MOD") or tc_ips[game.GetIPAddress()]) then
    DeriveGamemode"terrorcity"
    util.AddNetworkString"ttt_enable_tc"

    return
end

---- Trouble in Terrorist Town
AddCSLuaFile("sh_moat.lua")
AddCSLuaFile("cl_moat.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_hud.lua")
AddCSLuaFile("cl_msgstack.lua")
AddCSLuaFile("cl_hudpickup.lua")
AddCSLuaFile("cl_keys.lua")
AddCSLuaFile("cl_wepswitch.lua")
AddCSLuaFile("cl_awards.lua")
AddCSLuaFile("cl_scoring_events.lua")
AddCSLuaFile("cl_scoring.lua")
AddCSLuaFile("cl_popups.lua")
AddCSLuaFile("cl_equip.lua")
AddCSLuaFile("equip_items_shd.lua")
AddCSLuaFile("cl_help.lua")
AddCSLuaFile("cl_scoreboard.lua")
AddCSLuaFile("cl_tips.lua")
AddCSLuaFile("cl_voice.lua")
AddCSLuaFile("scoring_shd.lua")
AddCSLuaFile("util.lua")
AddCSLuaFile("lang_shd.lua")
AddCSLuaFile("corpse_shd.lua")
AddCSLuaFile("player_ext_shd.lua")
AddCSLuaFile("weaponry_shd.lua")
AddCSLuaFile("cl_radio.lua")
AddCSLuaFile("cl_radar.lua")
AddCSLuaFile("cl_tbuttons.lua")
AddCSLuaFile("cl_disguise.lua")
AddCSLuaFile("cl_transfer.lua")
AddCSLuaFile("cl_search.lua")
AddCSLuaFile("cl_targetid.lua")
AddCSLuaFile("vgui/ColoredBox.lua")
AddCSLuaFile("vgui/SimpleIcon.lua")
AddCSLuaFile("vgui/ProgressBar.lua")
AddCSLuaFile("vgui/ScrollLabel.lua")
AddCSLuaFile("vgui/sb_main.lua")
AddCSLuaFile("vgui/sb_row.lua")
AddCSLuaFile("vgui/sb_team.lua")
AddCSLuaFile("vgui/sb_info.lua")
include("sh_moat.lua")
include("sv_moat.lua")
include("shared.lua")
include("karma.lua")
include("entity.lua")
include("scoring_shd.lua")
include("radar.lua")
include("admin.lua")
include("traitor_state.lua")
include("propspec.lua")
include("weaponry.lua")
include("gamemsg.lua")
include("ent_replace.lua")
include("scoring.lua")
include("corpse.lua")
include("player_ext_shd.lua")
include("player_ext.lua")
include("player.lua")
CreateConVar("ttt_roundtime_minutes", "10", FCVAR_NOTIFY)
CreateConVar("ttt_preptime_seconds", "30", FCVAR_NOTIFY)
CreateConVar("ttt_posttime_seconds", "30", FCVAR_NOTIFY)
CreateConVar("ttt_firstpreptime", "60")
local ttt_haste = CreateConVar("ttt_haste", "1", FCVAR_NOTIFY)
CreateConVar("ttt_haste_starting_minutes", "5", FCVAR_NOTIFY)
CreateConVar("ttt_haste_minutes_per_death", "0.5", FCVAR_NOTIFY)
CreateConVar("ttt_spawn_wave_interval", "0")
CreateConVar("ttt_traitor_pct", "0.25")
CreateConVar("ttt_traitor_max", "32")
CreateConVar("ttt_detective_pct", "0.13", FCVAR_NOTIFY)
CreateConVar("ttt_detective_max", "32")
CreateConVar("ttt_detective_min_players", "8")
CreateConVar("ttt_detective_karma_min", "600")
-- Traitor credits
CreateConVar("ttt_credits_starting", "2")
CreateConVar("ttt_credits_award_pct", "0.35")
CreateConVar("ttt_credits_award_size", "1")
CreateConVar("ttt_credits_award_repeat", "1")
CreateConVar("ttt_credits_detectivekill", "1")
CreateConVar("ttt_credits_alonebonus", "1")
-- Detective credits
CreateConVar("ttt_det_credits_starting", "1")
CreateConVar("ttt_det_credits_traitorkill", "0")
CreateConVar("ttt_det_credits_traitordead", "1")
CreateConVar("ttt_use_weapon_spawn_scripts", "1")
CreateConVar("ttt_weapon_spawn_count", "0")
CreateConVar("ttt_round_limit", "6", FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED)
CreateConVar("ttt_time_limit_minutes", "75", FCVAR_NOTIFY + FCVAR_REPLICATED)
CreateConVar("ttt_idle_limit", "180", FCVAR_NOTIFY)
CreateConVar("ttt_voice_drain", "0", FCVAR_NOTIFY)
CreateConVar("ttt_voice_drain_normal", "0.2", FCVAR_NOTIFY)
CreateConVar("ttt_voice_drain_admin", "0.05", FCVAR_NOTIFY)
CreateConVar("ttt_voice_drain_recharge", "0.05", FCVAR_NOTIFY)
CreateConVar("ttt_namechange_kick", "1", FCVAR_NOTIFY)
CreateConVar("ttt_namechange_bantime", "10")
local ttt_detective = CreateConVar("ttt_sherlock_mode", "1", FCVAR_ARCHIVE + FCVAR_NOTIFY)
local ttt_minply = CreateConVar("ttt_minimum_players", "2", FCVAR_ARCHIVE + FCVAR_NOTIFY)
-- debuggery
local ttt_dbgwin = CreateConVar("ttt_debug_preventwin", "0")
-- Localise stuff we use often. It's like Lua go-faster stripes.
local math = math
local table = table
local net = net
local player = player
local timer = timer
local util = util
-- Pool some network names.
util.AddNetworkString("TTT_RoundState")
util.AddNetworkString("TTT_RagdollSearch")
util.AddNetworkString("TTT_GameMsg")
util.AddNetworkString("TTT_GameMsgColor")
util.AddNetworkString("TTT_RoleChat")
util.AddNetworkString("TTT_TraitorVoiceState")
util.AddNetworkString("TTT_LastWordsMsg")
util.AddNetworkString("TTT_RadioMsg")
util.AddNetworkString("TTT_ReportStream")
util.AddNetworkString("TTT_LangMsg")
util.AddNetworkString("TTT_ServerLang")
util.AddNetworkString("TTT_Equipment")
util.AddNetworkString("TTT_Credits")
util.AddNetworkString("TTT_Bought")
util.AddNetworkString("TTT_BoughtItem")
util.AddNetworkString("TTT_InterruptChat")
util.AddNetworkString("TTT_PlayerSpawned")
util.AddNetworkString("TTT_PlayerDied")
util.AddNetworkString("TTT_CorpseCall")
util.AddNetworkString("TTT_ClearClientState")
util.AddNetworkString("TTT_PerformGesture")
util.AddNetworkString("TTT_Role")
util.AddNetworkString("TTT_RoleList")
util.AddNetworkString("TTT_ConfirmUseTButton")
util.AddNetworkString("TTT_C4Config")
util.AddNetworkString("TTT_C4DisarmResult")
util.AddNetworkString("TTT_C4Warn")
util.AddNetworkString("TTT_ShowPrints")
util.AddNetworkString("TTT_ScanResult")
util.AddNetworkString("TTT_FlareScorch")
util.AddNetworkString("TTT_Radar")

---- Round mechanics
function GM:Initialize()
    MsgN("Trouble In Terrorist Town gamemode initializing...")
    ShowVersion()
    -- Force friendly fire to be enabled. If it is off, we do not get lag compensation.
    RunConsoleCommand("mp_friendlyfire", "1")

    -- Default crowbar unlocking settings, may be overridden by config entity
    GAMEMODE.crowbar_unlocks = {
        [OPEN_DOOR] = true,
        [OPEN_ROT] = true,
        [OPEN_BUT] = true,
        [OPEN_NOTOGGLE] = true
    }

    -- More map config ent defaults
    GAMEMODE.force_plymodel = ""
    GAMEMODE.propspec_allow_named = true
    GAMEMODE.MapWin = WIN_NONE
    GAMEMODE.AwardedCredits = false
    GAMEMODE.AwardedCreditsDead = 0
    GAMEMODE.round_state = ROUND_WAIT
    GAMEMODE.FirstRound = true
    GAMEMODE.RoundStartTime = 0
    GAMEMODE.DamageLog = {}
    GAMEMODE.LastRole = {}
    GAMEMODE.playermodel = GetRandomPlayerModel()
    GAMEMODE.playercolor = COLOR_WHITE
    -- Delay reading of cvars until config has definitely loaded
    GAMEMODE.cvar_init = false
    _SetGlobalFloat("ttt_round_end", -1)
    _SetGlobalFloat("ttt_haste_end", -1)
    -- For the paranoid
    math.randomseed(os.time())
    WaitForPlayers()

    if cvars.Number("sv_alltalk", 0) > 0 then
        ErrorNoHalt("TTT WARNING: sv_alltalk is enabled. Dead players will be able to talk to living players. TTT will now attempt to set sv_alltalk 0.\n")
        RunConsoleCommand("sv_alltalk", "0")
    end

    local cstrike = false

    for _, g in pairs(engine.GetGames()) do
        if g.folder == 'cstrike' then
            cstrike = true
        end
    end

    if not cstrike then
        ErrorNoHalt("TTT WARNING: CS:S does not appear to be mounted by GMod. Things may break in strange ways. Server admin? Check the TTT readme for help.\n")
    end
end

-- Used to do this in Initialize, but server cfg has not always run yet by that
-- point.
function GM:InitCvars()
    MsgN("TTT initializing convar settings...")
    -- Initialize game state that is synced with client
    _SetGlobalInt("ttt_rounds_left", GetConVar("ttt_round_limit"):GetInt())
    GAMEMODE:SyncGlobals()
    KARMA.InitState()
    self.cvar_init = true
end

local broken_parenting_ents = {
	["move_rope"] = true,
	["keyframe_rope"] = true,
	["info_target"] = true,
	["func_brush"] = true
}

_WE_HAVE_MAP_WEAPONS = false
function GM:InitPostEntity()
	if (not ents.MapCreatedEnts) then
		ents.MapCreatedEnts = {}

		local num = 0
		for k, v in ipairs(ents.GetAll()) do
			if (not IsValid(v) or not v:CreatedByMap()) then continue end
			num = num + 1

			ents.MapCreatedEnts[num] = {
				pos = v:GetPos(),
				ang = v:GetAngles(),
				class = v:GetClass(),
				id = v:MapCreationID(),
				trigger = v.TriggerOutput,
				name = v:GetName(),
				ent = v
			}

			if (_WE_HAVE_MAP_WEAPONS) then continue end
			_WE_HAVE_MAP_WEAPONS = (v.AutoSpawnable and not IsValid(v:GetOwner()))
		end

		ents.MapCreatedEntsCount = num
	end

    WEPS.ForcePrecache()
end

function GM:GetGameDescription()
    return self.Name
end

-- Convar replication is broken in gmod, so we do this.
-- I don't like it any more than you do, dear reader.
function GM:SyncGlobals()
    _SetGlobalBool("ttt_detective", ttt_detective:GetBool())
    _SetGlobalBool("ttt_haste", ttt_haste:GetBool())
    _SetGlobalInt("ttt_time_limit_minutes", GetConVar("ttt_time_limit_minutes"):GetInt())
    _SetGlobalBool("ttt_highlight_admins", GetConVar("ttt_highlight_admins"):GetBool())
    _SetGlobalBool("ttt_locational_voice", GetConVar("ttt_locational_voice"):GetBool())
    _SetGlobalInt("ttt_idle_limit", GetConVar("ttt_idle_limit"):GetInt())
    _SetGlobalBool("ttt_voice_drain", GetConVar("ttt_voice_drain"):GetBool())
    _SetGlobalFloat("ttt_voice_drain_normal", GetConVar("ttt_voice_drain_normal"):GetFloat())
    _SetGlobalFloat("ttt_voice_drain_admin", GetConVar("ttt_voice_drain_admin"):GetFloat())
    _SetGlobalFloat("ttt_voice_drain_recharge", GetConVar("ttt_voice_drain_recharge"):GetFloat())
end

function SendRoundState(state, ply)
    net.Start("TTT_RoundState")
    net.WriteUInt(state, 3)

    return ply and net.Send(ply) or net.Broadcast()
end

-- Round state is encapsulated by set/get so that it can easily be changed to
-- eg. a networked var if this proves more convenient
function SetRoundState(state)
    GAMEMODE.round_state = state
    SCORE:RoundStateChange(state)
    SendRoundState(state)
end

function GetRoundState()
    return GAMEMODE.round_state
end

local function EnoughPlayers(p)
	if (not p) then return false end
    local ready = 0

    -- only count truly available players, ie. no forced specs
    for _, ply in ipairs(p) do
        if (IsValid(ply) and ply:ShouldSpawn()) then
            ready = ready + 1
        end
    end

    return ready >= ttt_minply:GetInt()
end

-- Used to be in Think/Tick, now in a timer
function WaitingForPlayersChecker()
	local pls = player.GetAll()
    if GetRoundState() == ROUND_WAIT and EnoughPlayers(pls) then
        timer.Create("wait2prep", 1, 1, PrepareRound)
        timer.Stop("waitingforply")
    end
end

-- Start waiting for players
function WaitForPlayers()
    SetRoundState(ROUND_WAIT)

    if (not timer.Start("waitingforply")) then
        timer.Create("waitingforply", 2, 0, WaitingForPlayersChecker)
    end
end

-- When a player initially spawns after mapload, everything is a bit strange;
-- just making him spectator for some reason does not work right. Therefore,
-- we regularly check for these broken spectators while we wait for players
-- and immediately fix them.
function FixSpectators()
    for k, ply in pairs(player.GetAll()) do
        if ply:IsSpec() and not ply:GetRagdollSpec() and ply:GetMoveType() < MOVETYPE_NOCLIP then
            ply:Spectate(OBS_MODE_ROAMING)
        end
    end
end

-- Used to be in think, now a timer
local function WinChecker()
    if GetRoundState() == ROUND_ACTIVE then
        if CurTime() > GetGlobalFloat("ttt_round_end", 0) then
            EndRound(WIN_TIMELIMIT)
        else
            local win = hook.Call("TTTCheckForWin", GAMEMODE)

            if win ~= WIN_NONE then
                EndRound(win)
            end
        end
    end
end

local function NameChangeKick()
    if (not GetConVar("ttt_namechange_kick"):GetBool()) then
        timer.Remove("namecheck")

        return
    end
	if GetRoundState() ~= ROUND_ACTIVE then return end

    for _, ply in pairs(player.GetHumans()) do
        if ply.spawn_nick then
            if ply.has_spawned and ply.spawn_nick ~= ply:Nick() then
                ply.spawn_nick = ply:Nick()

                if (ply:Alive()) then
                    ply:Kill()
                end
            end
        else
            ply.spawn_nick = ply:Nick()
        end
    end
end

function StartNameChangeChecks()
    if not GetConVar("ttt_namechange_kick"):GetBool() then return end

    -- bring nicks up to date, may have been changed during prep/post
    for _, ply in pairs(player.GetAll()) do
        ply.spawn_nick = ply:Nick()
    end

    if (not timer.Exists("namecheck")) then
        timer.Create("namecheck", 3, 0, NameChangeKick)
    end
end

function StartWinChecks()
    if not timer.Start("winchecker") then
        timer.Create("winchecker", 1, 0, WinChecker)
    end
end

function StopWinChecks()
    timer.Stop("winchecker")
end

local mc_server = GetHostName():lower():find("minecraft")

local function CleanUp()
    ServerLog("Starting Cleanup\n")
    local et = ents.TTT
    -- if we are going to import entities, it's no use replacing HL2DM ones as
    -- soon as they spawn, because they'll be removed anyway
    et.SetReplaceChecking(not et.CanImportEntities(game.GetMap()))
    --[[for k,v in ipairs(player.GetAll()) do
      if IsValid(v) then
         v:StripWeapons()
      end
   end

    local tbl = {}
    for k, v in ipairs(ents.GetAll()) do
        if (not v:IsPlayer() and not v:IsWorld()) then
            if (v:IsWeapon()) then
                v:SetOwner()
                v:Remove()
                continue
            end
            table.insert(tbl, v)
        end
    end]]
    --[[local test_tbl = {}
    for k, v in ipairs(ents.GetAll()) do
        if (not test_tbl[v:GetClass()]) then test_tbl[v:GetClass()] = true end
    end

    PrintTable(test_tbl)]]
    --[[local prop_classes = {
        ["prop_dynamic"] = true,
        ["prop_physics"] = true,
        ["func_breakable"] = true,
        ["prop_physics_multiplayer"] = true,
        ["trigger_hurt"] = true,
        ["trigger_push"] = true
    }
    ServerLog("Starting Cleanup Map\n")

    if (not mc_server) then
        local tbl = {}
        for k, v in ipairs(ents.GetAll()) do
            --ServerLog(v:GetClass() .. "\n")

            if (prop_classes[v:GetClass()]) then
                v:Remove()
                continue
            end
            if (v:IsWeapon() or v:IsRagdoll()) then
                if (not tbl[v:GetClass()]) then
                    tbl[v:GetClass()] = true
                    table.insert(tbl, v:GetClass())
                end

                if (v:IsWeapon()) then v:SetOwner(nil) end
                v:Remove()
            end
        end
        ServerLog("Looped Through Entities\n")
    end]]
    et.FixParentedPreCleanup()
    --[[if (not mc_server) then
        game.CleanUpMap(false, tbl)
        ServerLog("Clean Up 1\n")
    end]]
    ServerLog("Starting Cleanup Map\n")
    game.CleanUpMap()
    ServerLog("Clean Up Map Done\n")
    --for k, v in ipairs(tbl) do if (IsValid(v)) then v:Remove() end end
    et.FixParentedPostCleanup()

    for k, v in pairs(player.GetAll()) do
        v:StripWeapons()
    end

    -- a different kind of cleanup
    ServerLog("Function Finished\n")
end

local import = ents.TTT.CanImportEntities()
local function SpawnEntities()
	_RemoveCorpses()
	_PlaceExtraWeapons(import)
	_ReplaceMapItems()
	
	local pls = player.GetAll()
	for k, v in ipairs(pls) do
		if (not IsValid(v)) then continue end
		KARMA.RoundBegin(v)
        v.JustSpawned = v:SpawnForRound()
		hook.Run("TTTPrepareRoundPlayer", v)
	end
end

local function StopRoundTimers()
    -- remove all timers
    timer.Stop("wait2prep")
    timer.Stop("prep2begin")
    timer.Stop("end2begin")
    timer.Stop("winchecker")
end

-- Make sure we have the players to do a round, people can leave during our
-- preparations so we'll call this numerous times
local function CheckForAbort(p)
	local pls = player.GetAll()
    if (not EnoughPlayers(pls)) then
        LANG.Msg("round_minplayers")
        StopRoundTimers()
        WaitForPlayers()

        return true
    end

    return false
end

function GM:TTTDelayRoundStartForVote()
    -- Can be used for custom voting systems
    --return true, 30
    return false
end

function PrepareRound()
    -- Check playercount
    if (CheckForAbort()) then return end
    local delay_round, delay_length = hook.Call("TTTDelayRoundStartForVote", GAMEMODE)

    if delay_round then
        delay_length = delay_length or 30

        LANG.Msg("round_voting", {
            num = delay_length
        })

        timer.Create("delayedprep", delay_length, 1, PrepareRound)

        return
    end

    -- Cleanup
    _CleanUp()
    
	GAMEMODE.MapWin = WIN_NONE
    GAMEMODE.AwardedCredits = false
    GAMEMODE.AwardedCreditsDead = 0
	-- Update damage scaling
	KARMA.InitState()
    SCORE:Reset()
    -- New look. Random if no forced model set.
    GAMEMODE.playermodel = GAMEMODE.force_plymodel == "" and GetRandomPlayerModel() or GAMEMODE.force_plymodel
    GAMEMODE.playercolor = hook.Call("TTTPlayerColor", GAMEMODE, GAMEMODE.playermodel)
    if (CheckForAbort()) then return end
    -- Schedule round start
    local ptime = GetConVar("ttt_preptime_seconds"):GetInt()

    if GAMEMODE.FirstRound then
        ptime = GetConVar("ttt_firstpreptime"):GetInt()
        GAMEMODE.FirstRound = false
    end

    -- Piggyback on "round end" time global var to show end of phase timer
    SetRoundEnd(CurTime() + ptime)
    timer.Create("prep2begin", ptime, 1, BeginRound)

    -- Mute for a second around traitor selection, to counter a dumb exploit
    -- related to traitor's mics cutting off for a second when they're selected.
    timer.Create("selectmute", ptime - 1, 1, function()
        MuteForRestart(true)
    end)

    LANG.Msg("round_begintime", {
        num = ptime
    })

    SetRoundState(ROUND_PREP)
    -- Delay spawning until next frame to avoid ent overload
    timer.Simple(0, SpawnEntities)

    -- Undo the roundrestart mute, though they will once again be muted for the
    -- selectmute timer.
    timer.Create("restartmute", 1, 1, function()
        MuteForRestart(false)
    end)

    --net.Start("TTT_ClearClientState")
    --net.Broadcast()
    -- In case client's cleanup fails, make client set all players to innocent role
    timer.Simple(1, SendRoleReset)
    -- Tell hooks and map we started prep
    hook.Run("TTTPrepareRound")

    _TriggerRoundStateOutputs(ROUND_PREP)
end

function SetRoundEnd(endtime)
    _SetGlobalFloat("ttt_round_end", endtime)
end

function IncRoundEnd(incr)
    SetRoundEnd(GetGlobalFloat("ttt_round_end", 0) + incr)
end

function TellTraitorsAboutTraitors()
    local traitornicks = {}

    for k, v in pairs(player.GetAll()) do
        if v:IsTraitor() then
            table.insert(traitornicks, v:Nick())
        end
    end

    -- This is ugly as hell, but it's kinda nice to filter out the names of the
    -- traitors themselves in the messages to them
    for k, v in pairs(player.GetAll()) do
        if v:IsTraitor() then
            if #traitornicks < 2 then
                LANG.Msg(v, "round_traitors_one")

                return
            else
                local names = ""

                for i, name in pairs(traitornicks) do
                    if name ~= v:Nick() then
                        names = names .. name .. ", "
                    end
                end

                names = string.sub(names, 1, -3)

                LANG.Msg(v, "round_traitors_more", {
                    names = names
                })
            end
        end
    end
end

function SpawnWillingPlayers(pls, dead_only)
    for k, ply in pairs(pls) do
        if IsValid(ply) then
            ply:SpawnForRound(dead_only)
            ply.JustSpawned = dead_only
        end
    end
end

local function InitRoundEndTime()
    -- Init round values
    local endtime = CurTime() + (GetConVar("ttt_roundtime_minutes"):GetInt() * 60)

    if HasteMode() then
        endtime = CurTime() + (GetConVar("ttt_haste_starting_minutes"):GetInt() * 60)
        -- this is a "fake" time shown to innocents, showing the end time if no
        -- one would have been killed, it has no gameplay effect
        _SetGlobalFloat("ttt_haste_end", endtime)
    end

    SetRoundEnd(endtime)
end

function BeginRound()
    GAMEMODE:SyncGlobals()
	local pls = player.GetAll()
    if CheckForAbort(pls) then return end

    InitRoundEndTime()
    if CheckForAbort(pls) then return end
    -- Respawn dumb people who died during prep
    SpawnWillingPlayers(pls, true)
    -- Remove their ragdolls
    ents.TTT.RemoveRagdolls(true)
    if CheckForAbort(pls) then return end
    -- Select traitors & co. This is where things really start so we can't abort
    -- anymore.
    SelectRoles()
    LANG.Msg("round_selected")
    SendFullStateUpdate()
    -- Edge case where a player joins just as the round starts and is picked as
    -- traitor, but for whatever reason does not get the traitor state msg. So
    -- re-send after a second just to make sure everyone is getting it.
    timer.Simple(1, SendFullStateUpdate)
    timer.Simple(10, SendFullStateUpdate)
    SCORE:HandleSelection() -- log traitors and detectives
    -- Give the StateUpdate messages ample time to arrive
    timer.Simple(1.5, TellTraitorsAboutTraitors)
    timer.Simple(2.5, ShowRoundStartPopup)
    -- Start the win condition check timer
    StartWinChecks()
    StartNameChangeChecks()

    timer.Create("selectmute", 1, 1, function()
        MuteForRestart(false)
    end)

    GAMEMODE.DamageLog = {}
    GAMEMODE.RoundStartTime = CurTime()
    -- Sound start alarm
    SetRoundState(ROUND_ACTIVE)
    LANG.Msg("round_started")
    ServerLog("Round proper has begun...\n")
    GAMEMODE:UpdatePlayerLoadouts() -- needs to happen when round_active
    hook.Call("TTTBeginRound")
    _TriggerRoundStateOutputs(ROUND_BEGIN)

    for k, v in ipairs(player.GetAll()) do
        v.JustSpawned = nil
    end
end

function PrintResultMessage(type)
    ServerLog("Round ended.\n")

    if type == WIN_TIMELIMIT then
        LANG.Msg("win_time")
        ServerLog("Result: timelimit reached, traitors lose.\n")
    elseif type == WIN_TRAITOR then
        LANG.Msg("win_traitor")
        ServerLog("Result: traitors win.\n")
    elseif type == WIN_INNOCENT then
        LANG.Msg("win_innocent")
        ServerLog("Result: innocent win.\n")
    else
        ServerLog("Result: unknown victory condition!\n")
    end
end

function CheckForMapSwitch()
    -- Check for mapswitch
    local rounds_left = math.max(0, GetGlobalInt("ttt_rounds_left", 6) - 1)
    _SetGlobalInt("ttt_rounds_left", rounds_left)
    local time_left = math.max(0, (GetConVar("ttt_time_limit_minutes"):GetInt() * 60) - CurTime())
    local switchmap = false
    local nextmap = string.upper(game.GetMapNext())

    if rounds_left <= 0 then
        LANG.Msg("limit_round", {
            mapname = nextmap
        })

        switchmap = true
    elseif time_left <= 0 then
        LANG.Msg("limit_time", {
            mapname = nextmap
        })

        switchmap = true
    end

    if switchmap then
        timer.Stop("end2prep")
        timer.Simple(15, game.LoadNextMap)
    else
        LANG.Msg("limit_left", {
            num = rounds_left,
            time = math.ceil(time_left / 60),
            mapname = nextmap
        })
    end
end


function EndRound(type)
    PrintResultMessage(type)
    -- first handle round end
    SetRoundState(ROUND_POST)
    local ptime = math.max(5, GetConVar("ttt_posttime_seconds"):GetInt())
    LANG.Msg("win_showreport", {
        num = ptime
    })
    timer.Create("end2prep", ptime, 1, PrepareRound)
    -- Piggyback on "round end" time global var to show end of phase timer
    SetRoundEnd(CurTime() + ptime)
    timer.Create("restartmute", ptime - 1, 1, function()
        MuteForRestart(true)
    end)
    -- Stop checking for wins
    StopWinChecks()
    -- We may need to start a timer for a mapswitch, or start a vote
    _CheckForMapSwitch()
    -- now handle potentially error prone scoring stuff
    -- register an end of round event
    SCORE:RoundComplete(type)
    -- update player scores
    SCORE:ApplyEventLogScores(type)
    -- send the clients the round log, players will be shown the report
    SCORE:StreamToClients()
    -- server plugins might want to start a map vote here or something
    -- these hooks are not used by TTT internally
	local pls = player.GetAll()
    hook.Call("TTTEndRound", GAMEMODE, type, pls)
	for k, v in ipairs(pls) do
		if (not IsValid(v)) then continue end
		KARMA.RoundEnd(v)
		hook.Run("TTTEndRoundPlayer", type, v)
	end

    _TriggerRoundStateOutputs(ROUND_POST, type)
end

function GM:MapTriggeredEnd(wintype)
    self.MapWin = wintype
end

-- The most basic win check is whether both sides have one dude alive
function GM:TTTCheckForWin()
    if ttt_dbgwin:GetBool() then return WIN_NONE end

    if GAMEMODE.MapWin == WIN_TRAITOR or GAMEMODE.MapWin == WIN_INNOCENT then
        local mw = GAMEMODE.MapWin
        GAMEMODE.MapWin = WIN_NONE

        return mw
    end

    local traitor_alive = false
    local innocent_alive = false

    for k, v in pairs(player.GetAll()) do
        if v:Alive() and v:IsTerror() then
            if v:GetTraitor() then
                traitor_alive = true
            else
                innocent_alive = true
            end
        end

        if traitor_alive and innocent_alive then return WIN_NONE end --early out
    end

    if traitor_alive and not innocent_alive then
        return WIN_TRAITOR
    elseif not traitor_alive and innocent_alive then
        return WIN_INNOCENT
    elseif not innocent_alive then
        -- ultimately if no one is alive, traitors win
        return WIN_TRAITOR
    end

    return WIN_NONE
end

local function GetTraitorCount(ply_count)
    -- get number of traitors: pct of players rounded down
    local traitor_count = math.floor(ply_count * GetConVar("ttt_traitor_pct"):GetFloat())
    -- make sure there is at least 1 traitor
    traitor_count = math.Clamp(traitor_count, 1, GetConVar("ttt_traitor_max"):GetInt())

    return traitor_count
end

local function GetDetectiveCount(ply_count)
    if ply_count < GetConVar("ttt_detective_min_players"):GetInt() then return 0 end
    local det_count = math.floor(ply_count * GetConVar("ttt_detective_pct"):GetFloat())
    -- limit to a max
    det_count = math.Clamp(det_count, 1, GetConVar("ttt_detective_max"):GetInt())

    return det_count
end

function SelectRoles()
    local choices = {}

    local prev_roles = {
        [ROLE_INNOCENT] = {},
        [ROLE_TRAITOR] = {},
        [ROLE_DETECTIVE] = {}
    }

    if not GAMEMODE.LastRole then
        GAMEMODE.LastRole = {}
    end

    for k, v in pairs(player.GetAll()) do
        -- everyone on the spec team is in specmode
        if IsValid(v) and (not v:IsSpec()) then
            -- save previous role and sign up as possible traitor/detective
            local r = GAMEMODE.LastRole[v:SteamID()] or v:GetRole() or ROLE_INNOCENT
            table.insert(prev_roles[r], v)
            table.insert(choices, v)
        end

        v:SetRole(ROLE_INNOCENT)
    end

    -- determine how many of each role we want
    local choice_count = #choices
    local traitor_count = GetTraitorCount(choice_count)
    local det_count = GetDetectiveCount(choice_count)
    if choice_count == 0 then return end
    -- first select traitors
    local ts = 0

    while ts < traitor_count do
        -- select random index in choices table
        local pick = math.random(1, #choices)
        -- the player we consider
        local pply = choices[pick]

        -- make this guy traitor if he was not a traitor last time, or if he makes
        -- a roll
        if IsValid(pply) and ((not table.HasValue(prev_roles[ROLE_TRAITOR], pply)) or (math.random(1, 3) == 2)) then
            pply:SetRole(ROLE_TRAITOR)
            table.remove(choices, pick)
            ts = ts + 1
        end
    end

    -- now select detectives, explicitly choosing from players who did not get
    -- traitor, so becoming detective does not mean you lost a chance to be
    -- traitor
    local ds = 0
    local min_karma = GetConVarNumber("ttt_detective_karma_min") or 0

    while (ds < det_count) and (#choices >= 1) do
        -- sometimes we need all remaining choices to be detective to fill the
        -- roles up, this happens more often with a lot of detective-deniers
        if #choices <= (det_count - ds) then
            for k, pply in pairs(choices) do
                if IsValid(pply) then
                    pply:SetRole(ROLE_DETECTIVE)
                end
            end

            break -- out of while
        end

        local pick = math.random(1, #choices)
        local pply = choices[pick]

        -- we are less likely to be a detective unless we were innocent last round
        if (IsValid(pply) and ((pply:GetBaseKarma() > min_karma and table.HasValue(prev_roles[ROLE_INNOCENT], pply)) or math.random(1, 3) == 2)) then
            -- if a player has specified he does not want to be detective, we skip
            -- him here (he might still get it if we don't have enough
            -- alternatives)
            if not pply:GetAvoidDetective() then
                pply:SetRole(ROLE_DETECTIVE)
                ds = ds + 1
            end

            table.remove(choices, pick)
        end
    end

    GAMEMODE.LastRole = {}

    for _, ply in pairs(player.GetAll()) do
        -- initialize credit count for everyone based on their role
        ply:SetDefaultCredits()
        -- store a steamid -> role map
        GAMEMODE.LastRole[ply:SteamID()] = ply:GetRole()
    end
end

local function ForceRoundRestart(ply, command, args)
    -- ply is nil on dedicated server console
    if (not IsValid(ply)) or ply:IsAdmin() or ply:IsSuperAdmin() or cvars.Bool("sv_cheats", 0) then
        LANG.Msg("round_restart")
        StopRoundTimers()
        -- do prep
        PrepareRound()
    else
        ply:PrintMessage(HUD_PRINTCONSOLE, "You must be a GMod Admin or SuperAdmin on the server to use this command, or sv_cheats must be enabled.")
    end
end

concommand.Add("ttt_roundrestart", ForceRoundRestart)

-- Version announce also used in Initialize
function ShowVersion(ply)
    local text = Format("This is TTT version %s\n", GAMEMODE.Version)

    if IsValid(ply) then
        ply:PrintMessage(HUD_PRINTNOTIFY, text)
    else
        Msg(text)
    end
end

concommand.Add("ttt_version", ShowVersion)