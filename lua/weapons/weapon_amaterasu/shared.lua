if (SERVER) then 

AddCSLuaFile ("shared.lua")

end

if (CLIENT) then

SWEP.PrintName = "Amaterasu"
SWEP.Category = "Mr Ibizza"
SWEP.Slot = 3
SWEP.SlotPos = 1
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.Author = "[HG] Mr Ibizza"
SWEP.Contact = "Contact me via Steam , duh."
SWEP.Purpose = "Left click to use the Amaterasu\nRight Click to teleport"

end

function SWEP:Initialize()
	self.LookOut = {
	Sound("weapons/iamaterasu.wav"),
	Sound("weapons/samaterasu.wav") }
end
function SWEP:Reload()

end

function SWEP:Think()


end

function SWEP:PrimaryAttack()
self.Weapon:SetNextPrimaryFire( CurTime() + 0.08 )
self.Weapon:SetNextPrimaryFire(CurTime()+1.5)
self.Weapon:SendWeaponAnim( ACT_VM_PRIMARYATTACK )

local pos = self.Owner:GetShootPos()		
local ang = self.Owner:GetAimVector()
local tracedata = {}
tracedata.start = pos
tracedata.endpos = pos+(ang*100000)
tracedata.filter = self.Owner
local trace = util.TraceLine(tracedata)
local	target = trace.Entity
 if SERVER then
target:Ignite(30,0)
end
target:EmitSound("ambient/fire/ignite.wav", 100, 100)
self.Weapon:EmitSound( self.LookOut[math.random(1,#self.LookOut)] )

if SERVER then
if target:IsWorld() then


local fire = ents.Create("env_fire")
fire:SetPos( self.Owner:GetEyeTrace().HitPos )
fire:SetKeyValue("targetname", "fire")
fire:SetKeyValue("health", "10")
fire:SetKeyValue("fireattack", "0")
fire:SetKeyValue("ignitionpoint", "0")
fire:SetKeyValue("firesize", "150")
fire:SetKeyValue("StartDisabled", "0")
fire:SetKeyValue("spawnflags", 128 + 2)
fire:SetKeyValue("damagescale", "20")
fire:Spawn()
fire:SetOwner(self.Owner)
fire:Fire("StartFire","","0")
fire:EmitSound("ambient/fire/ignite.wav", 100, 100)

end

end
end

function SWEP:SecondaryAttack()
//self.Weapon:EmitSound("weapons/jump.wav") -- This is annoying as fuck.
//if not (SERVER) then return end
self.Owner:SetPos(self.Owner:GetEyeTrace().HitPos+Vector(0,0,35))
end


SWEP.ViewModelFOV   = 50
SWEP.Instructions    = "Left click to use the Amaterasu\nRight Click to teleport"    
SWEP.Spawnable       = true             
SWEP.AdminSpawnable  = true    
SWEP.ViewModel = "models/weapons/v_hands.mdl"
SWEP.WorldModel = "models/weapons/w_bugbait.mdl"     
SWEP.Primary.ClipSize = -1;
SWEP.Primary.DefaultClip = -1;
SWEP.Primary.Automatic = false;
SWEP.Primary.Ammo = "none";
SWEP.Secondary.ClipSize = -1;
SWEP.Secondary.DefaultClip = -1;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.Ammo = "none"; 
