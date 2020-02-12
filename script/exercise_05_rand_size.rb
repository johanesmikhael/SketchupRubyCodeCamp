mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model


for i in 0..9
  origin = Geom::Point3d.new(i * 200.mm, 100.mm, 100.mm)
  a = 100.mm
  random_width= rand(0.5..2.0) # create random float number from 0.5..1.5
  width = a * random_width
  random_length = rand(1..10) # create random int number from 1..10
  length = a * random_length
  random_height = rand(1..10) # create random int number from 1..10
  height = a * random_height # put random number as height multiplier

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
