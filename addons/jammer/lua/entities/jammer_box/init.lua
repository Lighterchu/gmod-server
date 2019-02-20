AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )



function ENT:Initialize()
	
	self.Entity:SetModel( "models/props_lab/reciever01a.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow(false)
	self.Entity:SetModelScale( 0.5, 0 )
	 
	local phys = self.Entity:GetPhysicsObject()
	
		  if (phys:IsValid()) then
			phys:Wake()
		  end
end

function ENT:SpawnFunction( ply, tr )

	if ( !tr.Hit ) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	
	local ent = ents.Create( "jammer_box" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	ent:GetOwner(self.Owner)
	return ent
	
end

