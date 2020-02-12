mod = Sketchup.active_model # open sketchup active_model
ent = mod.entities          # accessing the entities in mod


# define the radius and centerpoint
r = 100.mm
# center_point
x = 0.mm
y = 0.mm
z = 0.mm
center = Geom::Point3d.new(x, y, z)

# create the group
ball_group = ent.add_group

# create the first circle
vector_z = Geom::Vector3d.new(0, 0, 1)
circle1 = ball_group.entities.add_circle(center, vector_z, r)

# create the second circle perpendicular to first circle
vector_x = Geom::Vector3d.new(1, 0, 0)
circle2 = ball_group.entities.add_circle(center, vector_x, r)
# create a face form circle2 and followme with circle 1 to create the ball
face = ball_group.entities.add_face(circle2)
face.followme(circle1)

# the following code is to soften the visible edges
for ent in ball_group.entities
  if ent.typename == "Edge"
    if !ent.smooth?
      ent.smooth = true
      ent.soft = true
    end
  end
end
