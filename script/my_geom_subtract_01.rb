mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

# this is a basic code to make a simple box

a = 100.mm      # define the module dimension
width = a       # width of the box
length = a  # length of the box
height = 0.2 * a # height of the box

x = 0.mm        # define the x position
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
# end of the code

# make a copy of box and move it
box_copy = box_group.copy
u = width * rand(-0.8..0.8)
v = length * rand(-0.8..0.8)
w = height * rand(-0.8..0.8)
move_vector = Geom::Vector3d.new(u, v ,w)
tr = Geom::Transformation.translation(move_vector)
box_copy.transform!(tr)
# subtract box_group with box_copy
substract_result = box_copy.subtract(box_group)
