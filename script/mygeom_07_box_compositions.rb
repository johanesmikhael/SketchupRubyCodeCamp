mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod
for k in 0..6
  for j in 0..5
    for i in 0..4
      a = 25.mm
      width = a * rand(1..4)
      length = a * rand(1..4)
      height = a * rand(1..4)

      x = a * rand(0..4) + j * 1000.mm # add 1000.m grid
      y = a * rand(0..4) + k * 1000.mm # add 1000.m grid
      z = a * rand(0..4)

      origin = Geom::Point3d.new(x, y, z)

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
    end
  end
end
