mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

# create a big box
pt1 = Geom::Point3d.new(0, 0 , 0)
pt2 = Geom::Point3d.new(100.mm, 0, 0)
pt3 = Geom::Point3d.new(100.mm, 100.mm, 0)
pt4 = Geom::Point3d.new(0, 100.mm, 0)

big_box = ent.add_group
face = big_box.entities.add_face(pt1, pt2, pt3, pt4)
face.reverse!
face.pushpull(100.mm)

for i in 0..4
  a = 25.mm
  width = a * rand(1..4)
  length = a * rand(1..4)
  height = a * rand(1..4)

  x = a * rand(0..4)
  y = a * rand(0..4)
  z = a * rand(0..4)

  origin = Geom::Point3d.new(x, y, z)

  # set the point as such that the box origin point will be the center of the box
  pt1 = Geom::Point3d.new(origin.x - width / 2, origin.y - length / 2, origin.z - height / 2)
  pt2 = Geom::Point3d.new(origin.x + width / 2, origin.y - length / 2, origin.z - height / 2)
  pt3 = Geom::Point3d.new(origin.x + width / 2, origin.y + length / 2, origin.z - height / 2)
  pt4 = Geom::Point3d.new(origin.x - width / 2, origin.y + length / 2, origin.z - height / 2)

  group = ent.add_group
  group_ent = group.entities
  face = group_ent.add_face(pt1, pt2, pt3, pt4)

  if face.normal.z < 0
    face.reverse!
  end
  face.pushpull(height)
  #subtract the big_box with group
  big_box = group.subtract(big_box)
end
