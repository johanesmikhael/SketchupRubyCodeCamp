mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

i = 0
while i < 10
  puts i
  a = 100.mm
  width = a
  length = a * 5
  height = a * 3

  origin = Geom::Point3d.new(i * width, 100.mm , 100.mm)

  pt1 = Geom::Point3d.new(origin.x , origin.y, origin.z)
  pt2 = Geom::Point3d.new(origin.x + width, origin.y, origin.z)
  pt3 = Geom::Point3d.new(origin.x + width, origin.y + length, origin.z)
  pt4 = Geom::Point3d.new(origin.x, origin.y + length, origin.z)

  group = ent.add_group
  group_ent = group.entities
  face = group_ent.add_face(pt1, pt2, pt3, pt4)

  if face.normal.z < 0
    face.reverse!
  end

  face.pushpull(height)
  i = i + 1
end
