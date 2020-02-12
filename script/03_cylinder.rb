mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

# this is a basic code to make a simple cylinder

# define center point of circle
x = 0.mm
y = 0.mm
z = 0.mm
center_point = Geom::Point3d.new(x, y, z)
# define the normal of circle
u = 0
v = 0
w = 1
normal_vector = Geom::Vector3d.new(u, v ,w).normalize!
# define the radius
radius = 50.mm
# define the cylinder height
height = 200.mm
#create a group_ cyl group
cyl_group = ent.add_group
#create the circle
circle = cyl_group.entities.add_circle(center_point, normal_vector, radius)
face = cyl_group.entities.add_face(circle)   # create face from circle edges
if face.normal.z < 0  # this code is used to flip the face if not upward
  face.reverse!
end
# pushpull the face to create the box
face.pushpull(height)
# end of the code
