mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model


for i in 0..9
  origin = Geom::Point3d.new(i * 200.mm, 100.mm, 100.mm)
  a = 100.mm
  width = a
  length = a * 5
  height = a * 3

  pt1 = Geom::Point3d.new(origin.x, origin.y, origin.z)
  pt2 = Geom::Point3d.new(origin.x + width, origin.y, origin.z)
  pt3 = Geom::Point3d.new(origin.x + width, origin.y + length, origin.z)
  pt4 = Geom::Point3d.new(origin.x, origin.y + length, origin.z)

  group = ent.add_group
  group_ent = group.entities
  face = group_ent.add_face(pt1, pt2, pt3, pt4)
  if face.normal.z < 0  # this code is used to flip the face if not upward
    face.reverse!
  end
  face.pushpull(height)
end
