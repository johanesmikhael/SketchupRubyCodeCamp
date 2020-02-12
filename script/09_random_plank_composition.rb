mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

a = 25.mm
result_union = nil
for i in 0..19
  width = a * 0.1
  length = a * rand(4..8)
  height = a * rand(0.5..0.9)
  x = a * rand(1.0..4.0)        # define the x position
  y = a * rand(1.0..4.0)         # define the y position
  z = a * rand(0.0..2.0)    # define the z position

  origin = Geom::Point3d.new(x, y, z) # create a point for origin

  #define points for a rectangle in respect to origin point
  pt1 = Geom::Point3d.new(origin.x - width / 2, origin.y - length / 2, origin.z)
  pt2 = Geom::Point3d.new(origin.x + width / 2, origin.y - length / 2, origin.z)
  pt3 = Geom::Point3d.new(origin.x + width / 2, origin.y + length / 2, origin.z)
  pt4 = Geom::Point3d.new(origin.x - width / 2, origin.y + length / 2, origin.z)

  #create a group_ box group
  box_group = ent.add_group
  # create a rectanglar face
  face = box_group.entities.add_face(pt1, pt2, pt3, pt4)
  if face.normal.z < 0  # this code is used to flip the face if not upward
    face.reverse!
  end
  # pushpull the face to create the box
  face.pushpull(height)
  # end of the code
  random_angle = 2 * Math::PI / 8 * rand(1..8)
  z_vector = Geom::Vector3d.new(0 ,0 ,1).normalize!
  rotation = Geom::Transformation.rotation(origin, z_vector, random_angle)
  box_group.transform!(rotation)
  if result_union == nil
    result_union = box_group
  else
    result_union = box_group.union(result_union)
  end
  if !result_union.manifold?
    break
  end
end
