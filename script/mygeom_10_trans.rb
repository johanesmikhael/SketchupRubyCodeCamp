mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model

origin = Geom::Point3d.new(0.mm, 0.mm, 0.mm)
a = 100.mm
width = a
length = a * 5
height = a * 2

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

group_copy = group.copy #copy the group to group_copy

axis = Geom::Vector3d.new(0, 0, 1) # set z axis for rotation axis
angle = 0.25 * Math::PI # set the angle as 1/4 PI rad or 45 degree
# note that ruby work in radians instead of degree
rotation_point = origin # set origin above as rotation point
tr = Geom::Transformation.rotation(rotation_point, axis, angle)
group_copy.transform!(tr) # apply the translation to the object
scaling_point = origin
tr_scale = Geom::Transformation.scaling(scaling_point, 1.25) # set scale Transformation
group_copy.transform!(tr_scale) # apply the scaling to the object
