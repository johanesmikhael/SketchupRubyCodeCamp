mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod
sel = mod.selection


width = 100.mm
length = 200.mm
height = 300.mm

pt1 = Geom::Point3d.new(0, 0, 0)
pt2 = Geom::Point3d.new(width, 0, 0)
pt3 = Geom::Point3d.new(width, length, 0)
pt4 = Geom::Point3d.new(0, length, 0)

# create a group
group = ent.add_group
# create a face in a group entities
face = group.entities.add_face(pt1, pt2, pt3, pt4)

if face.normal.z < 0
  face.reverse!
end

face.pushpull(height)
