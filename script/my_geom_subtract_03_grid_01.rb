mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod
for k in 0..9
  for j in 0..9
    # create a big box
    or_big = Geom::Point3d.new(j * 300.mm,  k * 300.mm, 0)
    normal = Geom::Vector3d.new(0, 0, 1).normalize!

    big_group = ent.add_group
    circle = big_group.entities.add_circle(or_big, normal, 50.mm)
    face = big_group.entities.add_face(circle)
    face.reverse!
    face.pushpull(100.mm)

    for i in 0..4
      a = 25.mm
      width = a * rand(1..4)
      length = a * rand(1..4)
      height = a * rand(1..4)

      x = a * rand(-2..2) +  j * 300.mm
      y = a * rand(-2..2) +  k * 300.mm
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
      if big_group.manifold? # check if the big_box is still manifold or not
        big_group = group.subtract(big_group) #subtract the big_box with group
      end
    end
  end
end
