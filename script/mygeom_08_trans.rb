mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model

origin = Geom::Point3d.new(0.mm, 0.mm, 0.mm)
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

group_copy = group.copy                      #copy the group to group_copy
vector_tr = Geom::Vector3d.new(2 * a, 0, 0)  #set the vector according to a in x axis
tr = Geom::Transformation.translation(vector_tr) # create a translation base on vector
group_copy.transform!(tr)                     # apply the translation to the object
