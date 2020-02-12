mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities          # accessing the entities in mod



radius = 2.mm               # define the radius of the pipe
points_arr = Array.new      # define an empty array
n = 20                     # initiate the iteration max
for i in 0..n               # create iteration of i from 0 to n
  # create a series of points based on i value
  x = i * 20.mm # random x from -10.mm to 10.mm
  y = 5.mm * rand(-10..10) # random x from -10.mm to 10.mm
  z = 5.mm * rand(-10..10)                      # this value create a parabolic curve
  point = Geom::Point3d.new(x, y, z)  # create a point based on x, y, z values
  points_arr.push(point)              # put the point to points array
end

pipe_group = ent.add_group            #create a group
curve = pipe_group.entities.add_curve(points_arr)     # create a curve based on points in points_arr
                                      # define the radius of the pipe
first_edge = curve[0]                 # get the first edge of the curve
first_point = first_edge.line[0]      # get the first point of the curve
first_normal = first_edge.line[1].normalize!.reverse! # get the vector of startpoint
#create the pipe
circle = pipe_group.entities.add_circle(first_point, first_normal, radius)
face = pipe_group.entities.add_face(circle)
face.followme(curve)
#end of the code
