AddCSLuaFile( "shared.lua" )

SWEP.Author			= "SpeedyFast"
SWEP.Instructions	= "place on ground"

SWEP.Category = "Hacks"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModel			= "models/props_lab/reciever01a.mdl"
SWEP.WorldModel			= "models/props_lab/reciever01a.mdl"
SWEP.ViewModelFOV = 70

SWEP.Primary.ClipSize		= 3
SWEP.Primary.DefaultClip	= 3
SWEP.Primary.Automatic		= false 
SWEP.Primary.Ammo		= "none"
SWEP.Primary.Delay = .01

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.PrintName			= "Jammer"
SWEP.Slot				= 4
SWEP.SlotPos			= 1
SWEP.DrawAmmo			= true
SWEP.DrawCrosshair		= false
SWEP.UseHands           = true
SWEP.Active 			= false


SWEP.Offset = {
	Pos = {
	Up = 0,
	Right = -2,
	Forward = 2,
	},
	Ang = {
	Up = 0,
	Right = 0,
	Forward = -45,
	}
}



function SWEP:DrawWorldModel( )
	local hand, offset, rotate

	if not IsValid( self.Owner ) then
		self:DrawModel( )
		return
	end

	if not self.Hand then
	self.Hand = self.Owner:LookupAttachment( "anim_attachment_rh" )
	end

	hand = self.Owner:GetAttachment( self.Hand )

	if not hand then
		self:DrawModel( )
		return
	end

	offset = hand.Ang:Right( ) * self.Offset.Pos.Right + hand.Ang:Forward( ) * self.Offset.Pos.Forward + hand.Ang:Up( ) * self.Offset.Pos.Up

	hand.Ang:RotateAroundAxis( hand.Ang:Right( ), self.Offset.Ang.Right )
	hand.Ang:RotateAroundAxis( hand.Ang:Forward( ), self.Offset.Ang.Forward )
	hand.Ang:RotateAroundAxis( hand.Ang:Up( ), self.Offset.Ang.Up )

	self:SetRenderOrigin( hand.Pos + offset )
	self:SetRenderAngles( hand.Ang )

	self:DrawModel( )
end


function SWEP:PrimaryAttack()
		self:SetNextPrimaryFire(CurTime() + 1)
		 self:JammerPlace()
		--self:EmitSound("hoff/mpl/seal_c4/whoosh_00.wav")
		--self:TakePrimaryAmmo(1)
end

function SWEP:SecondaryAttack()  return end 

function SWEP:JammerPlace()
   if SERVER then
   	  local ply = self:GetOwner()
      if not IsValid(ply) then return end

      //self:SendWeaponAnim(ACT_VM_THROW)	
	 
      	if self.planted then return end
      

      local ignore = {ply, self}
      local spos = ply:GetShootPos()
      local epos = spos + ply:GetAimVector() *40
      local tr = util.TraceLine({start=spos, endpos=epos, filter=ignore, mask=MASK_SOLID})

      if tr.HitWorld then
         local jammer = ents.Create("jammer_box")
         if IsValid(jammer) then
            jammer:PointAtEntity(ply)
            //self.planted = true
           
           

            local tr_ent = util.TraceEntity({start=spos, endpos=epos, filter=ignore, mask=MASK_SOLID}, jammer)

            if tr_ent.HitWorld then

               local ang = tr_ent.HitNormal:Angle()
               ang:RotateAroundAxis(ang:Right(), -90)
               ang:RotateAroundAxis(ang:Up(), 180)
			   
			  
               jammer:SetPos(tr_ent.HitPos )
               jammer:SetAngles(ang)
               jammer:SetOwner(ply)
               jammer:Spawn()
               jammer.active = true
               print(jammer.active)

			   
			   local phys = jammer:GetPhysicsObject()
               if IsValid(phys) then
                  phys:EnableMotion(false)
               end

		end
         end

         ply:SetAnimation( PLAYER_ATTACK1 )
      end
   end
end