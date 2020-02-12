mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

# set the dimension
width = 100.mm
length = 200.mm
height = 300.mm

# set the points for rectangle
pt1 = Geom::Point3d.new(0, 0, 0)
pt2 = Geom::Point3d.new(width, 0, 0)
pt3 = Geom::Point3d.new(width, length, 0)
pt4 = Geom::Point3d.new(0, length, 0)

# create rectangle from the points
face = ent.add_face(pt1, pt2, pt3, pt4)

if face.normal.z < 0 # this code is used to reverse the downward face
  face.reverse!
end
# pushpull the face to create the rectangle
face.pushpull(height)
