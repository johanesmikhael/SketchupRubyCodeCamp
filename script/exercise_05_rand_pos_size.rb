mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model


for i in 0..9
  a = 100.mm
  width = a * rand(0.5..1.5)
  length = a * rand(0.5..1.5)
  height = a * rand(1..5)

  # create random (x, y) position
  random_x = (rand(1..10) * 10 * a).mm
  random_y = (rand(1..10) * 10 * a).mm
  origin = Geom::Point3d.new(random_x, random_y, 0)

  pt1 = Geom::Point3d.new(origin.x - width/2 , origin.y - length/2, origin.z)
  pt2 = Geom::Point3d.new(origin.x + width/2, origin.y - length/2, origin.z)
  pt3 = Geom::Point3d.new(origin.x + width/2, origin.y + length/2, origin.z)
  pt4 = Geom::Point3d.new(origin.x - width/2, origin.y + length/2, origin.z)

  group = ent.add_group
  group_ent = group.entities
  face = group_ent.add_face(pt1, pt2, pt3, pt4)

  if face.normal.z < 0  # this code is used to flip the face if not upward
    face.reverse!
  end

  face.pushpull(height)
end
