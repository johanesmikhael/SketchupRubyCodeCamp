mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod
sel = mod.selection

# create a "a" variable
a = 100.mm
b = 30.mm
width = b * 10       # define the size according to "a" and "b" values
length = a * 5
height = a * 3

pt1 = Geom::Point3d.new(0, 0, 0)
pt2 = Geom::Point3d.new(width, 0, 0)
pt3 = Geom::Point3d.new(width, length, 0)
pt4 = Geom::Point3d.new(0, length, 0)

group = ent.add_group
group_ent = group.entities
face = group_ent.add_face(pt1, pt2, pt3, pt4)

if face.normal.z < 0
  face.reverse!
end

face.pushpull(height)
