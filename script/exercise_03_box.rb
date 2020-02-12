mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod
sel = mod.selection

a = 100.mm
width = a
length = a
height = a

origin = Geom::Point3d.new(0.mm, 0.mm, 0.mm)

pt1 = Geom::Point3d.new(origin.x - width/2 , origin.y - length/2, origin.z - height/2)
pt2 = Geom::Point3d.new(origin.x + width/2, origin.y - length/2, origin.z - height/2)
pt3 = Geom::Point3d.new(origin.x + width/2, origin.y + length/2, origin.z - height/2)
pt4 = Geom::Point3d.new(origin.x - width/2, origin.y + length/2, origin.z - height/2)

group = ent.add_group
group_ent = group.entities
face = group_ent.add_face(pt1, pt2, pt3, pt4)

if face.normal.z < 0
  face.reverse!
end

face.pushpull(height)
