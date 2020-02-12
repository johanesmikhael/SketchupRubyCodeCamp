mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod


for q in 0..15
       # define the module dimension
  width = 200.mm       # width of the box
  length = 600.mm  # length of the box
  height = 200.mm  # height of the box
  distance = 300.mm
  x = 0.mm + q * distance       # define the x position
  y = 0.mm        # define the y position
  z = 0.mm        # define the z position

  origin = Geom::Point3d.new(x, y, z) # create a point for origin

  #define points for a rectangle in respect to origin point
  pt1 = Geom::Point3d.new(origin.x, origin.y, origin.z)
  pt2 = Geom::Point3d.new(origin.x + width, origin.y, origin.z)
  pt3 = Geom::Point3d.new(origin.x + width, origin.y + length, origin.z)
  pt4 = Geom::Point3d.new(origin.x, origin.y + length, origin.z)

  #create a group_ box group
  box_group = ent.add_group
  # create a rectanglar face
  face = box_group.entities.add_face(pt1, pt2, pt3, pt4)
  if face.normal.z < 0  # this code is used to flip the face if not upward
    face.reverse!
  end
  # pushpull the face to create the box
  face.pushpull(height)

  for i in 0..2
    a = 20.mm
    width = a * rand(3..7)
    length = a * rand(3..7)
    height = a * rand(3..7)

    x = a * rand(0..10) + q * distance
    y = a * rand(0..30)
    z = a * rand(0..10)

    origin = Geom::Point3d.new(x, y, z)

    pt1 = Geom::Point3d.new(origin.x - width / 2, origin.y - length / 2, origin.z - height / 2)
    pt2 = Geom::Point3d.new(origin.x + width / 2, origin.y - length / 2, origin.z - height / 2)
    pt3 = Geom::Point3d.new(origin.x + width / 2, origin.y + length / 2, origin.z - height / 2)
    pt4 = Geom::Point3d.new(origin.x - width / 2, origin.y + length / 2, origin.z - height / 2)

    group = ent.add_group
    group_ent = group.entities
    face = group_ent.add_face(pt1, pt2, pt3, pt4)

    axis = Geom::Vector3d.new(0, 0, 1)
    angle = rand(0..8) * 0.25 * Math::PI
    tr = Geom::Transformation.rotation(origin, axis, angle)
    # group.transform!(tr)

    axis = Geom::Vector3d.new(1, 0, 0)
    angle = rand(-1..1) * 0.05 * Math::PI
    tr = Geom::Transformation.rotation(origin, axis, angle)
    # group.transform!(tr)

    if face.normal.z < 0
      face.reverse!
    end
    face.pushpull(height)
    box_group = group.subtract(box_group)
    if !box_group.manifold?
      break
    end
  end


  for i in 0..40
    a = 10.mm
    width = a * rand(2..10)
    length = a * rand(2..10)
    height = a * rand(2..10)

    x = a * rand(0..20) + q * distance
    y = a * rand(0..60)
    z = a * rand(0..20)

    origin = Geom::Point3d.new(x, y, z)

    pt1 = Geom::Point3d.new(origin.x - width / 2, origin.y - length / 2, origin.z - height / 2)
    pt2 = Geom::Point3d.new(origin.x + width / 2, origin.y - length / 2, origin.z - height / 2)
    pt3 = Geom::Point3d.new(origin.x + width / 2, origin.y + length / 2, origin.z - height / 2)
    pt4 = Geom::Point3d.new(origin.x - width / 2, origin.y + length / 2, origin.z - height / 2)

    group = ent.add_group
    group_ent = group.entities
    face = group_ent.add_face(pt1, pt2, pt3, pt4)

    axis = Geom::Vector3d.new(0, 0, 1)
    angle = rand(0..8) * 0.25 * Math::PI
    tr = Geom::Transformation.rotation(origin, axis, angle)
    #group.transform!(tr)

    axis = Geom::Vector3d.new(1, 0, 0)
    angle = rand(-1..1) * 0.05 * Math::PI
    tr = Geom::Transformation.rotation(origin, axis, angle)
    #group.transform!(tr)

    if face.normal.z < 0
      face.reverse!
    end
    face.pushpull(height)
    box_group = group.subtract(box_group)
    if !box_group.manifold?
      break
    end
  end
end
