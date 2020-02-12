mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

for i in 0..19
  for j in 0..19 # create inner loop with j counter
    a = 100.mm
    width = a #set the ratio to 1:1:1
    length = a
    # add sin function to box height
    height = a * Math.sin(2 * i / 19.0 * Math::PI) * Math.sin(2 * j / 19.0 * Math::PI) + 200.mm

    #set the j to correspond with y coordinate
    origin = Geom::Point3d.new(i * width, j * length , 0)

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
