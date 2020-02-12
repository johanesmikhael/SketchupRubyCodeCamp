mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities # accessing the entities in mod

# this is a basic code to make a simple pipe from two points
# first point
x1 = 0.mm
y1 = 0.mm
z1 = 0.mm
p1 = Geom::Point3d.new(x1, y1, z1)

# second point
x2 = 100.mm
y2 = 100.mm
z2 = 100.mm
p2 = Geom::Point3d.new(x2, y2, z2)

# radius
radius = 5.mm

#crete the group
pipe_group = ent.add_group
# create a single edge
line_edge = pipe_group.entities.add_line(p1, p2)
first_point = line_edge.line[0]       # get the first point
normal_vector = line_edge.line[1].normalize!.reverse!    # get the vector of line
# create the pipe
circle = pipe_group.entities.add_circle(first_point, normal_vector, radius)
face = pipe_group.entities.add_face(circle)
face.followme(line_edge)
# end of the code
